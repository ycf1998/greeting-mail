const greetingLog = require("../db/greetingLog");
const template = require('art-template');

async function showLog(ctx) {
    await greetingLog.queryList().then(result => {
        let html = template.render(`<table border=1>
        <tr>
        <th>问候时间</th>
        <th>问候结果</th>
        <th>问候人</th>
        <th>邮箱</th>
        <th>省份</th>
        <th>城市</th>
        <th>地区</th>
        <th>开启问候</th>
        <th>问候次数</th>
        </tr>
        {{each result}}
        <tr style='text-align:center'>
        <td>{{$value.create_time}}</td>
        <td>{{$value.result}}</td>
        <td>{{$value.memo}}</td>
        <td>{{$value.email}}</td>
        <td>{{$value.province}}</td>
        <td>{{$value.city}}</td>
        <td>{{$value.district}}</td>
        <td>{{$value.open_greeting}}</td>
        <td>{{$value.greetings_number}}</td>
        </tr>{{/each}}</table>`, {result});
        ctx.body = html;
    });
}

module.exports = {
    showLog
}