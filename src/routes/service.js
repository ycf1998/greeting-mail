const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const app = new Koa();
app.use(bodyParser());
const router = require('koa-router')()

const WeatherService = require("../component/WeatherService")
const DogDiaryService = require("../component/DogDiaryService")
const NegativeEnergyService = require("../component/NegativeEnergyService")
const EveryDaySentenceService = require("../component/EveryDaySentenceService")
const PositiveEnergyService = require("../component/PositiveEnergyService")


router.get("/WeatherService", async (ctx) => {
    ctx.body = await WeatherService.doService({district_id: ctx.query['district_id']});
})

router.get("/DogDiaryService", async (ctx) => {
    ctx.body = await DogDiaryService.doService();
})

router.get("/EveryDaySentenceService", async (ctx) => {
    ctx.body = await EveryDaySentenceService.doService();
})

router.get("/NegativeEnergyService", async (ctx) => {
    ctx.body = await NegativeEnergyService.doService();
})

router.get("/PositiveEnergyService", async (ctx) => {
    ctx.body = await PositiveEnergyService.doService();
})

module.exports = router;
