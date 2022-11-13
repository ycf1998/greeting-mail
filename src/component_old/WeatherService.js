const axios = require('axios');

const URL = `https://wttr.in/地区?format=%c+%C+%t&lang=zh`;

function WeatherService() {}

WeatherService.prototype = {
    constructor: WeatherService,
    doService: async function (args) {},
    topic: async function (content, args) {
        return await axios.get(encodeURI(URL.replace('地区', args.district))).then(res => {
            if (res.data) {
                let arr = res.data.split(' ');
                return `🗺${args.district} ${arr[0]}${arr[2]} ${arr[3].replace('+', '')} ${getWeekDate()}`
            } 
        }).catch(err => '')
    }
}

function getWeekDate() {
    let weeks = new Array("星期日", "星期一", "星期二", "星期三", "星期四", "星期五", "星期六");
    let now = new Date();
    let day = now.getDay();
    let week = weeks[day];
    return week;
}

module.exports = new WeatherService();