const personDb = require("../db/person");
const personGreetingDb = require("../db/personGreeting");
const provincesDb = require("../db/provinces");
const greetingCardDb = require("../db/greetingCard");
const serviceDb = require("../db/service");
const greetingServiceDb = require("../db/greetingService");

async function register(ctx) {
    let record = ctx.request.body;
    let person = await personDb.queryByEmail(record.email) || [];
    if (person.length > 0) {
        ctx.body = {
            code: 500,
            message: "该邮箱已被注册"
        }
        return;
    }
    // 获取地区码
    record.district_id = await provincesDb.getDistrictId(record.district).then(res => res[0].district_id);
    // 注册
    record.id = await personDb.add(record);
    // 分发问候任务卡
    await greetingCardDb.queryList().then(cards => {
        for (let card of cards) {
            let personGreeting = {
                person_id: record.id,
                greeting_name: card.card_name,
                card_type: card.card_type,
                greeting_cron: card.card_cron,
            }
            personGreetingDb.add(personGreeting);
        }
    })
    if (record.id < 1) {
        ctx.body = {
            code: 500,
            message: "注册失败"
        }
    } else {
        ctx.session.USERID = record.id;
        ctx.body = {
            code: 200,
            message: "注册成功"
        }
    }
}

async function login(ctx) {
    await personDb.login(ctx.request.body).then(result => {
        if (result.length > 0) {
            let person = result[0];
            if (person.lockded) {
                ctx.body = {
                    code: 500,
                    message: "你号被封了"
                }
            } else {
                ctx.body = {
                    code: 200,
                    message: "登录成功",
                    data: person
                }
                ctx.session.USERID = person.id;
            }
        } else {
            ctx.body = {
                code: 500,
                message: "账户或者密码错误"
            }
        }
    });
}

async function getUserInfo(ctx) {
    await personDb.queryById(ctx.session.USERID).then(result => {
        if (result.length > 0) {
            let personDb = result[0];
            ctx.body = {
                code: 200,
                message: "登录成功",
                data: personDb
            }
        } else {
            delete ctx.session.USERID
            ctx.body = {
                code: 500
            }
        }
    });
}

async function getPersonGreeting(ctx) {
    await personGreetingDb.queryByPerson(ctx.params.id).then(result => ctx.body = result);
}

async function toggleGreeting(ctx) {

    let personGreeting = {
        open: ctx.request.body.open,
        person_id: ctx.session.USERID,
        id: ctx.query.id
    }
    let affectedRows = await personGreetingDb.toggleGreeting(personGreeting);
    if (affectedRows > 0) {
        ctx.body = {
            code: 200,
            message: '修改成功'
        }
    } else {
        ctx.body = {
            code: 500,
            message: '修改失败'
        }
    }
}

async function updatePersonGreeting(ctx) {
    let post = ctx.request.body;
    await greetingServiceDb.delByGreetingId(post.id, ctx.session.USERID);
    if (post.service !== undefined && post.service.length > 0) {
        for (let s of post.service) {
            let greetingService = {
                greeting_id: post.id,
                service_id: s,
                // TODO 主题未设定
                topic: 0,
            }
            await greetingServiceDb.add(greetingService);
        }
    }
    ctx.body = {
        code: 200,
        message: "修改成功，将于第二日生效"
    }
}

// 返回视图
async function loadPersonGreeting(ctx) {
    let serviceList = await serviceDb.queryList();
    let personGreeting = await personGreetingDb.queryByPerson(ctx.params.id);
    let greetingTasks = [];
    let taskCount = [];
    for (let data of personGreeting) {
        if (taskCount.includes(data.id)) {
            greetingTasks.filter(e => e.id === data.id)[0].services.push({
                service_id: data.service_id,
                topic: data.topic
            });
        } else {
            let gt = {
                id: data.id,
                card_name: data.greeting_name,
                card_type: data.card_type,
                card_desc: data.card_desc,
                greetings_number: data.greetings_number,
                open: data.open,
                services: [{service_id: data.service_id, topic: data.topic}],
            }
            taskCount.push(data.id);
            greetingTasks.push(gt);
        }
    }
    greetingTasks.forEach(gt => gt.subscribe = gt.services.map(e => e.service_id));
    await ctx.render('greetingCard', {
        greetingTasks,
        serviceList
    })
}

module.exports = {
    getUserInfo,
    login,
    register,
    getPersonGreeting,
    toggleGreeting,
    updatePersonGreeting,
    loadPersonGreeting
}