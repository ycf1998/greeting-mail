const exec = require("./dbConfig");

const add = (person) => {
    const sql = "insert into person(`username`, `password`, `email`, `phone`, `province`, `city`, `district`, `district_id`) values(?, ?, ?, ?, ?, ?, ?, ?)";
    const values = [person.email, person.password, person.email, person.phone || '', person.province, person.city, person.district, person.district_id];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const addGreetingsNumber = (id) => exec("update person set greetings_number = greetings_number + 1 where id = ?", id)


const del = (id) => {
    const sql = "delete from person where id = ?";
    return exec(sql, id).then(delRes => delRes.affectedRows);
}

const update = (person) => {
    let updateCol = '';
    let values = [];
    Object.keys(person).forEach(k => {
        if (k !== 'id' && person[k] != null) {
            updateCol += `${k} = ?`;
            values.push(person[k]);
        }
    })
    values.push(person.id);
    const sql = `update person set ${updateCol} where id = ?`;
    return exec(sql, values).then(delRes => delRes.affectedRows);
}

const queryById = (id) => exec("select `id`, `username`, `email`, `phone`, `province`, `city`, `district`, `district_id`, `greetings_number`, `create_time` from person where id = ?", id);

const queryByEmail = (email) => exec("select `id`, `username`, `email`, `phone`, `province`, `city`, `district`, `district_id`, `greetings_number`, `create_time`, `locked` from person where email = ?", email);


const login = ({email, password}) => exec("select `id`, `username`, `email`, `phone`, `province`, `city`, `district`, `district_id`, `greetings_number`, `create_time`, `locked` from person where email = ? and password = ?", [email, password]);


module.exports = {
    add,
    del,
    update,
    queryById,
    queryByEmail,
    addGreetingsNumber,
    login
}