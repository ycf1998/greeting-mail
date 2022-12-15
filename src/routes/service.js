const Koa = require('koa');
const bodyParser = require('koa-bodyparser');
const app = new Koa();
app.use(bodyParser());
const router = require('koa-router')()


const CircleOfFriendsService = require("../component/CircleOfFriendsService")
const DogDiaryService = require("../component/DogDiaryService")
const EveryDaySentenceService = require("../component/EveryDaySentenceService")
const NegativeEnergyService = require("../component/NegativeEnergyService")
const NeteaseCloudService = require("../component/NeteaseCloudService")
const PositiveEnergyService = require("../component/PositiveEnergyService")
const RainbowFartService = require("../component/RainbowFartService")
const WeatherService = require("../component/WeatherService")

// 朋友圈
router.get("/CircleOfFriendsService", async (ctx) => {
    ctx.body = await CircleOfFriendsService.doService();
})
// 舔狗日记
router.get("/DogDiaryService", async (ctx) => {
    ctx.body = await DogDiaryService.doService();
})
// 每日一语
router.get("/EveryDaySentenceService", async (ctx) => {
    ctx.body = await EveryDaySentenceService.doService();
})
// 负能量
router.get("/NegativeEnergyService", async (ctx) => {
    ctx.body = await NegativeEnergyService.doService();
})
// 网易云
router.get("/NeteaseCloudService", async (ctx) => {
    ctx.body = await NeteaseCloudService.doService();
})
// 正能量
router.get("/PositiveEnergyService", async (ctx) => {
    ctx.body = await PositiveEnergyService.doService();
})
// 彩虹屁
router.get("/RainbowFartService", async (ctx) => {
    ctx.body = await RainbowFartService.doService();
})
// 天气预报
router.get("/WeatherService", async (ctx) => {
    ctx.body = await WeatherService.doService({ district_id: ctx.query['district_id'] });
})

module.exports = router;
