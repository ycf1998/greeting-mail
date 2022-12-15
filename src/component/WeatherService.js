const axios = require('axios');
const { baiduWeatherAk } = require("../config");

const emojiMap = {
    "晴": '☀',
    "多云": '🌥',
    "阴": '☁',
    "阵雨": '🌧',
    "雷阵雨": '⛈',
    "雷阵雨伴有冰雹": '⛈ + ☄',
    "雨夹雪": '🌧 + ❄',
    "小雨": '🌧',
    "中雨": '🌧*2',
    "大雨": '🌧*3',
    "暴雨": '🌧*4',
    "特大暴雨": '🌧*5',
    "阵雪": '🌨',
    "小雪": '🌨',
    "中雪": '🌨*2',
    "大雪": '🌨*3',
    "暴雪": '🌨*4',
    "雾": '🌫',
    "龙卷风": '🌪',
};
const URL = `http://api.map.baidu.com/weather/v1/?data_type=all&ak=${baiduWeatherAk}&district_id=`;

function getEmoji (text) {
    let emoji = emojiMap[text];
    if (emoji === undefined) {
        if (text.includes("雨")) emoji = '🌧';
        else if (text.includes("雾")) emoji = '🌫';
        else if (text.includes("雪")) emoji = '🌨';
        else emoji = '💢'
    }
    return emoji;
}

function WeatherService () { }

WeatherService.prototype = {
    constructor: WeatherService,
    doService: async function (args) {
        sleep(800)
        let districtId = args?.district_id;
        if (districtId !== undefined) {
            return await axios.get(encodeURI(URL + districtId)).then(res => res.data)
                .then(data => {
                    if (data.status === 0) {
                        data.result.now.emoji = getEmoji(data.result.now.text);
                        let tomorrow = data.result.forecasts[1] ?? {};
                        tomorrow.emoji = getEmoji(tomorrow.text_day);
                        tomorrow.text = tomorrow.text_day;
                        tomorrow.temp = Math.floor((parseInt(tomorrow.high) + parseInt(tomorrow.low)) / 2);
                        data.result.tomorrow = tomorrow;
                        return data.result;
                    } else {
                        return '对不起，服务请求失败';
                    }
                })
                .catch(() => "对不起，服务请求失败!");
        }
        return '未找到此地区相关天气信息';
    },
    topic: function (content) {
        let location = content.location;
        let now = content.now;
        let forecasts = content.forecasts;
        if (location !== undefined && now !== undefined) {
            return `🗺${location.name} ${getEmoji(now.text)}${now.text} ${now.temp}℃ ${forecasts[0].week}`;
        }
    }
}

function sleep (NumMillis) {
    var nowTime = new Date();
    var exitTime = nowTime.getTime() + NumMillis;
    while (true) {
        now = new Date();
        if (now.getTime() > exitTime)
            return;
    }
}

module.exports = new WeatherService();


/**
 {
    "status": 0,
    "result": {
        "location": {
            "country": "中国",
            "province": "福建省",
            "city": "厦门市",
            "name": "厦门",
            "id": "350200"
        },
        "now": {
            "text": "晴",
            "temp": 32,
            "feels_like": 38,
            "rh": 62,
            "wind_class": "2级",
            "wind_dir": "西风",
            "uptime": "20210527110000"
        },
        "forecasts": [
        {
        "text_day": "多云",
        "text_night": "多云",
        "high": 34,
        "low": 26,
        "wc_day": "3~4级",
        "wd_day": "西南风",
        "wc_night": "<3级",
        "wd_night": "静风",
        "date": "2021-05-27",
        "week": "星期四"
        },..]
    }
 }
 **/