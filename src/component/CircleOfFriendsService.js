const axios = require('axios');


let cache = "对不起，服务请求失败!";
const URL = "https://pyq.shadiao.app/api.php";

function CircleOfFriends() {
}

CircleOfFriends.prototype = {
    constructor: CircleOfFriends,
    doService: async function (args) {
        return await axios.get(URL).then(res => {
            let txt = res.data || cache;
            if (txt !== "对不起，服务请求失败!")
                cache = txt;
            return cache;
        }).catch(() => cache);
    }
}

module.exports = new CircleOfFriends();
