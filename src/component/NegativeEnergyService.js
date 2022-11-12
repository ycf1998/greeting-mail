// 毒鸡汤
const axios = require('axios');

const URL = "http://api.lkblog.net/ws/api.php"

function NegativeEnergyService() {}

NegativeEnergyService.prototype = {
    constructor: NegativeEnergyService,
    doService: async function (args) {
        return await axios.get(URL).then(res => res.data.data)
            .catch(() => "服务异常");
    }
}

module.exports = new NegativeEnergyService();
