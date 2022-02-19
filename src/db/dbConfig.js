const mysql = require("mysql");
const {db} = require("../config")

const config = {
    host: db.host,
    port: db.port,
    user: db.user,
    password: db.password,
    database: 'greetingdb',
    timezone: 'SYSTEM'
}

const pool = mysql.createPool(config);

function exec(sql, values) {
    return new Promise((resolve, reject) => {
        pool.getConnection(function (err, connection) {
            if (err) throw err;
            connection.query(sql, values, (err, result) => {
                if (err) {
                    reject(err);
                    return;
                }
                resolve(result);
                connection.release();
            })
        });
    })

}

module.exports = exec;


