const fs = require('fs');
const path = require('path');
const template = require('art-template');

const personGreeting = require("../db/personGreeting");
const personDao = require("../db/person");
const greetingLog = require("../db/greetingLog");


const scheduleService = require('../service/scheduleService')
const mailService = require('../service/mailService')

// 加载所有服务
const api = {}
fs.readdirSync(path.join(__dirname, './'))
    .filter(file => file !== 'index.js')
    .forEach(service => {
        let name = service.replace('.js', '');
        api[name] = require('./' + name);
    })

// 发送问候邮件
async function sendGreetingMail(greetingsTask) {
    // 1. 获取问候任务信息
    let {person_id, greeting_id, greeting_name, email, services, person} = greetingsTask;
    // 默认都有天气预报
    services.unshift({
        "service_name": "天气预报",
        "service_class": "WeatherService"
    })
    // 2. 调用各个服务装填内容
    let args = { greeting_name, person_id, greeting_id};
    for(let k in person) args[k] = person[k];
    let subject = greeting_name;
    let servicesData = [];
    for(let s of services) {
        args['service_name'] = s.service_name;
        let content = await api[s.service_class].doService(args);
        // 邮件标题为标题版天气预报
        if (s.service_class == 'WeatherService')
            subject = api[s.service_class].topic(content);
        servicesData.push({
            name: s.service_name,
            content
        });
    }
    // 3. 根据模板渲染邮件html
    // let htmlLog = JSON.stringify(servicesData, null, 2);
    let html = template(path.join(__dirname, '../views/mailTemplate.html'), {
        servicesData
    });
    // 4. 发生邮件
    mailService.sendMail({
        from: '"🌈 greeting mail" <374648769@qq.com>', // sender address
        to: email, // list of receivers
        subject: subject, // Subject line
        html: html, // html body
    }, (err, msg) => {
        let result = true;
        if(err) {
            result = false;
        }
        // 保存邮件发送日志
        // 解决表情字符集问题
        let weather = servicesData.filter(e => e.name === '天气预报');
        if (weather.length > 0) {
            weather = weather[0];
            delete weather.content.now.emoji;
            delete weather.content.forecasts;
            delete weather.content.tomorrow.emoji;
        }
        let htmlLog = JSON.stringify(servicesData, null, 2);
        greetingLog.add({
            greeting_id: greetingsTask.greeting_id,
            greeting_name: greetingsTask.greeting_name,
            greeting_cron: greetingsTask.greeting_cron,
            email: email,
            content: htmlLog,
            result: result,
            return_msg: result ? `成功发送给${msg.accepted}` : "发生失败"
        })
        personDao.addGreetingsNumber(greetingsTask.person_id);
        personGreeting.addGreetingsNumber(greetingsTask.greeting_id);
    })
}


// 主定时任务：根据问候任务发送问候邮件
async function mainSchedule() {
    // 1. 加载任务
    let personGreetings = await personGreeting.queryList().then(result => result) || [];
    let greetingsTasks = new Map();
    personGreetings.map(greeting => {
        let {email, person_id, greeting_id, greeting_cron, greeting_name} = greeting;
        let distinct = greeting_cron + "," + email + greeting_name;
        let greetingsTask = greetingsTasks.get(distinct) || {};
        if (greetingsTasks.has(distinct)) {
            let service = {
                'service_name': greeting.service_name,
                'service_class': greeting.service_class,
                'topic': greeting.topic
            }
            greetingsTask.services.push(service);
        } else {
            greetingsTask = {
                email,
                person_id,
                greeting_id,
                greeting_cron,
                greeting_name,
                person: {
                    'province': greeting.province,
                    'city': greeting.city,
                    'district': greeting.district,
                    'district_id': greeting.district_id,
                    'phone': greeting.phone,
                    'greetings_number': greeting.greetings_number,
                },
                services: [{
                    'service_name': greeting.service_name,
                    'service_class': greeting.service_class,
                }]
            }
            greetingsTasks.set(distinct, greetingsTask)
        }
    })

    let greetingsSchedule = {};
    for ( let [k, v] of greetingsTasks.entries()) {
        let cron = k.split(',')[0];
        let schedule = greetingsSchedule[cron] || [];
        schedule.push(v);
        greetingsSchedule[cron] = schedule;
    }
    // 2. 开启定时任务
    Object.entries(greetingsSchedule).forEach(kv => {
        // for (let greetingTask of kv[1]) {
        //     if (greetingTask.person_id === 1) {
        //         sendGreetingMail(greetingTask)
        //     }
        // }

        scheduleService.addSchedule(kv[0], () => {
            for (let greetingTask of kv[1]) {
                sendGreetingMail(greetingTask);
            }
            console.log(new Date().toLocaleString() + ` 定时任务：${kv[0]}触发完毕!`)
        })
    })
    return true;
}

// 重加载任务：每晚0点10分重新加载用户的服务配置，重新开启定时任务
let first = true;
function reloadServiceSchedule() {
    scheduleService.closeAllSchedule();
    if (first) {
        first = false;
    } else {
        console.log(new Date().toLocaleString() + ' 重新加载任务，准备重启。');
    }
    console.log(new Date().toLocaleString() + ' 正在启动...');
    mainSchedule()
        .then(data => data ? console.log(new Date().toLocaleString() + ' 启动成功!') : console.log(new Date().toLocaleString() + ' 启动失败: false' ))
        .catch(err => console.log(new Date().toLocaleString() + ' 启动失败:' + err));
    scheduleService.addSchedule('0 10 0 * * ?', () => reloadServiceSchedule())
}

module.exports = {
    reloadServiceSchedule
};