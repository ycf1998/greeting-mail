const router = require('koa-router')()

const personController = require("../controller/PersonController");
const {list: listService} = require("../controller/ServiceController");
const provincesController = require("../controller/provincesController");
const monitorController = require("../controller/MonitorController");

router.get("/personGreeting/:id", personController.getPersonGreeting)
router.post("/personGreeting", personController.updatePersonGreeting)
router.post("/toggleGreeting", personController.toggleGreeting)

router.get("/services", listService)

router.get("/province", provincesController.loadProvince)
router.get("/city", provincesController.loadCity)
router.get("/district", provincesController.loadDistrict)

router.get("/log", monitorController.showLog)

module.exports = router;
