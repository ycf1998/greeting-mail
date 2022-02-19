const axios = require('axios');


let cache = "对不起，服务请求失败!";
const URL = "https://data.zhai78.com/openOneGood.php";

function PositiveEnergyService() {
}

PositiveEnergyService.prototype = {
    constructor: PositiveEnergyService,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            let txt = res.data.status === 1 ? res.data.txt : cache;
            if (txt !== "对不起，服务请求失败!")
                cache = txt;
            return cache;
        }).catch(() => cache);
    }
}

module.exports = new PositiveEnergyService();
