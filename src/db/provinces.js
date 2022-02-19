const exec = require("./dbConfig");

const loadProvince = () => exec("select distinct province val from provinces");

const loadCity = (province) => exec("select distinct city val from provinces where province = ?", province);

const loadDistrict = (city) => exec("select distinct district val from provinces where city = ?", city);

const getDistrictId = (district) => exec("select district_id from provinces where district = ?", district)

module.exports = {
    loadProvince,
    loadCity,
    loadDistrict,
    getDistrictId
}