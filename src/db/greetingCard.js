const exec = require("./dbConfig");

const queryList = () => exec("select * from greeting_card");

module.exports = {
    queryList
}