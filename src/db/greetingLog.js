const exec = require("./dbConfig");

const add = (log) => {
    const sql = "insert into greeting_log(greeting_id, greeting_name, greeting_cron, email, `result`) values(?, ?, ?, ?, ?)";
    const values = [log.greeting_id, log.greeting_name, log.greeting_cron, log.email, log.result];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const queryList = () => exec(`SELECT
	t.create_time,
	t.result,
	t2.memo,
	t2.email,
	t2.province,
	t2.city,
	t2.district,
	t2.open_greeting,
	t2.greetings_number 
FROM
	greeting_log t
	LEFT JOIN person t2 ON t.email = t2.email 
ORDER BY
	t.create_time DESC
LIMIT 100`);

module.exports = {
    add,
    queryList
}