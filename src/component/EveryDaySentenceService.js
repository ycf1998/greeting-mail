// 每日一语
const axios = require('axios');
const https = require('https');

// 在 axios 请求时，选择性忽略 SSL
const agent = new https.Agent({
    rejectUnauthorized: false
});

const URL = "https://api.oick.cn/yiyan/api.php"

function EveryDaySentenceService() {}

EveryDaySentenceService.prototype = {
    constructor: EveryDaySentenceService,
    doService: async function (args) {
        return await axios.get(URL, {
            httpsAgent: agent
        }).then(res => res.data)
            .catch((err) => "服务异常");
    }
}

module.exports = new EveryDaySentenceService();
