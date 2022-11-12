// 正能量
const axios = require('axios');

const URL = "https://data.zhai78.com/openOneGood.php";

function PositiveEnergyService() {
}

PositiveEnergyService.prototype = {
    constructor: PositiveEnergyService,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            return res.data.status === 1 ? res.data.txt : '服务异常';
        }).catch(() => '服务异常');
    }
}

module.exports = new PositiveEnergyService();
