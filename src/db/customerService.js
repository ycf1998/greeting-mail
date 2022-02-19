const exec = require("./dbConfig");
const { v4: uuidv4 } = require('uuid');

const add = (cutomerService) => {
    const sql = "INSERT INTO `cutomer_service`(`id`, `title`, `content`, `person_id`, `greeting_id`) VALUES (?, ?, ?, ?, ?)";
    const values = [uuidv4().replace(/-/g, ''), cutomerService.title, cutomerService.content, cutomerService.person_id, cutomerService.greeting_id];
    return exec(sql, values).then(insertRes => insertRes.insertId);
}

const delCustomerService = (greetingId, personId) => {
    const sql = "delete from cutomer_service where greeting_id = ? and person_id = ?";
    return exec(sql, [greetingId, personId]).then(delRes => delRes.affectedRows);
}

const getCustomerService = (greetingId, personId) => {
    const sql = "select title, content from cutomer_service where greeting_id = ? and person_id = ?";
    return exec(sql, [greetingId, personId]);
}

module.exports = {
    add,
    delCustomerService,
    getCustomerService
}