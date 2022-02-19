const exec = require("./dbConfig");
const { v4: uuidv4 } = require('uuid');

const add = (greetingService) => {
    const sql = "INSERT INTO `greeting_service`(`id`, `greeting_id`, `service_id`) VALUES (?, ?, ?)";
    const values = [uuidv4().replace(/-/g, ''), greetingService.greeting_id, greetingService.service_id, (greetingService.topic ?? 0)];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const delByGreetingId = (greetingId, personId) => {
    const sql = "delete from greeting_service where greeting_id = ? and exists (select 1 from person_greeting where id = greeting_id and person_id = ?)";
    return exec(sql, [greetingId, personId]).then(delRes => delRes.affectedRows);
}

module.exports = {
    add,
    delByGreetingId
}