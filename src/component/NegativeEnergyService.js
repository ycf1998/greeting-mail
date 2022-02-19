const axios = require('axios');

const URL = "http://api.lkblog.net/ws/api.php"

function NegativeEnergyService() {}

NegativeEnergyService.prototype = {
    constructor: NegativeEnergyService,
    doService: async function (args) {
        return await axios.get(URL).then(res => res.data.data)
            .catch(() => "对不起，服务请求失败!");
    }
}

module.exports = new NegativeEnergyService();
