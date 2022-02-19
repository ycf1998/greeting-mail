const serviceDb = require("../db/service");

async function list(ctx) {
    await serviceDb.queryList().then(result => ctx.body = result);
}

module.exports = {
    list
}