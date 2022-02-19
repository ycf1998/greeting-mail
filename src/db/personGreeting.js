const exec = require("./dbConfig");

const add = (personGreeting) => {
    const sql = "insert into person_greeting(`person_id`, `greeting_name`, `greeting_cron`, `card_type`) values(?, ?, ?, ?)";
    const values = [personGreeting.person_id, personGreeting.greeting_name, personGreeting.greeting_cron, personGreeting.card_type];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const del = (id) => exec("delete from person_greeting where id = ?", id)

const addGreetingsNumber = (id) => exec("update person_greeting set greetings_number = greetings_number + 1 where id = ?", id)

const update = (personGreeting) => {
    let updateCol = '';
    let values = [];
    Object.keys(personGreeting).forEach(k => {
        if (k !== 'id' && personGreeting[k] != null) {
            updateCol += `${k} = ?`;
            values.push(personGreeting[k]);
        }
    })
    values.push(personGreeting.id);
    const sql = `update person_greeting set ${updateCol} where id = ?`;
    return exec(sql, values).then(delRes => delRes.affectedRows);
}

const queryByPerson = (person_id) => {
    const sql = "select t.id, t.greeting_name, t.greetings_number, t.card_type, t2.service_id, t.open\n" +
        "from person_greeting t\n" +
        "left join greeting_service t2 on t.id = t2.greeting_id\n" +
        "where t.person_id = ? order by t.id";
    return exec(sql, person_id);
}

const queryList = () => exec("select t2.person_id, t4.email, t.greeting_id, t2.greeting_name, t2.greeting_cron,t4.province, t4.city, t4.district, t4.district_id, t4.phone, t4.greetings_number,\n" +
    "t3.service_name, t3.service_class\n" +
    "from greeting_service t\n" +
    "left join person_greeting t2 on t2.id = t.greeting_id and open = '1'\n" +
    "left join service t3 on t3.id = t.service_id\n" +
    "left join person t4 on t4.id = t2.person_id\n" +
    "where t4.open_greeting = '1' and t4.locked = 0 order by t2.greeting_cron, t2.person_id, t3.sort");

const toggleGreeting = ({open, person_id, id}) => exec("update person_greeting set open = ? where person_id = ? and id = ?", [open, person_id, id]).then(delRes => delRes.affectedRows);

module.exports = {
    add,
    del,
    addGreetingsNumber,
    update,
    queryByPerson,
    queryList,
    toggleGreeting
}