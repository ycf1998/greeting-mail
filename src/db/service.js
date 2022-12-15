const exec = require("./dbConfig");

const queryList = () => exec("select id, service_name, service_class from service where display = 1 order by sort");

module.exports = {
    queryList
}