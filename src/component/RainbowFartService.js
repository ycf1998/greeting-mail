// 彩虹屁
const axios = require('axios');

const URL = "https://api.shadiao.app/chp";

function RainbowFart() {
}

RainbowFart.prototype = {
    constructor: RainbowFart,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            return res.data?.data.text || '服务异常';
        }).catch(() => '服务异常');
    }
}

module.exports = new RainbowFart();
