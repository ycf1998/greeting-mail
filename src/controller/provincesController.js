const provincesDb = require("../db/provinces");

async function loadProvince(ctx) {
    await provincesDb.loadProvince().then(result => ctx.body = result);
}

async function loadCity(ctx) {
    await provincesDb.loadCity(ctx.query.province).then(result => ctx.body = result);
}

async function loadDistrict(ctx) {
    await provincesDb.loadDistrict(ctx.query.city).then(result => ctx.body = result);
}

module.exports = {
    loadProvince,
    loadCity,
    loadDistrict
}