const axios = require('axios');


let cache = "对不起，服务请求失败!";
const URL = "https://chp.shadiao.app/api.php";

function RainbowFart() {
}

RainbowFart.prototype = {
    constructor: RainbowFart,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            let txt = res.data || cache;
            if (txt !== "对不起，服务请求失败!")
                cache = txt;
            return cache;
        }).catch(() => cache);
    }
}

module.exports = new RainbowFart();
