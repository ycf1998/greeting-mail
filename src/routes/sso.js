const router = require('koa-router')()

const personController = require("../controller/PersonController");

router.post("/register", personController.register)
router.post("/login", personController.login)

router.get("/getUserInfo", personController.getUserInfo)

module.exports = router;