const exec = require("./dbConfig");

const add = (log) => {
    const sql = "insert into greeting_log(greeting_id, greeting_name, greeting_cron, email, content, `result`, return_msg) values(?, ?, ?, ?, ?, ?, ?)";
    const values = [log.greeting_id, log.greeting_name, log.greeting_cron, log.email, log.content, log.result, log.return_msg];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const queryList = () => exec("select t.create_time, t2.username, t2.password, t2.email, t2.phone, t2.province, t2.city, t2.district, t2.district_id, t2.open_greeting, t2.locked, t2.greetings_number from greeting_log t left join person t2 on t.person_id = t2.id");

module.exports = {
    add,
    queryList
}