const router = require('koa-router')()
const personController = require("../controller/PersonController");
const HomeController = require("../controller/HomeController");


router.get('/personGreeting/:id', personController.loadPersonGreeting);
router.get('/showAllCards', HomeController.showAllCards);

module.exports = router;
