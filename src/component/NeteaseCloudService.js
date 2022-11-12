// 网易云
const axios = require('axios');

const URL = "http://www.yduanzi.com/duanzi/getduanzi";

function CircleOfFriends() {
}

CircleOfFriends.prototype = {
    constructor: CircleOfFriends,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            return JSON.parse(res.data || {})?.duanzi || '服务异常';
        }).catch(() => '服务异常');
    }
}

module.exports = new CircleOfFriends();
