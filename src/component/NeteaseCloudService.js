const axios = require('axios');


let cache = "对不起，服务请求失败!";
const URL = "http://www.yduanzi.com/duanzi/getduanzi";

function CircleOfFriends() {
}

CircleOfFriends.prototype = {
    constructor: CircleOfFriends,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            let txt = JSON.parse(res.data || {})?.duanzi || cache;
            if (txt !== "对不起，服务请求失败!")
                cache = txt;
            return cache;
        }).catch(() => cache);
    }
}

module.exports = new CircleOfFriends();
