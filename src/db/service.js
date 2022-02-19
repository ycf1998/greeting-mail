const exec = require("./dbConfig");

const queryList = () => exec("select id, service_name from service where display = 1 order by sort");

module.exports = {
    queryList
}