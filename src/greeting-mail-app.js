const path = require('path');
const fs = require('fs');
const Koa = require('koa')
const greetingApp = new Koa()
const Router = require('koa-router');
const static = require('koa-static')
const cors = require('koa2-cors')
const bodyParser = require('koa-bodyparser');
const render = require('koa-art-template')

// 参数解析
greetingApp.use(bodyParser());
// 跨域
greetingApp.use(cors({
    origin: () => '*',
    maxAge: 5, //指定本次预检请求的有效期，单位为秒。
    credentials: true, //是否允许发送Cookie
    allowMethods: ['GET', 'POST', 'OPTIONS'], //设置所允许的HTTP请求方法
    allowHeaders: ['Content-Type', 'Authorization', 'Accept'], //设置服务器支持的所有头信息字段
}));
// 配置session
const session = require('koa-session');
greetingApp.keys = ['money'];
const CONFIG = {
    key: 'koa:sess',   //cookie key (default is koa:sess)
    maxAge: 28800000,  // cookie的过期时间 maxAge in ms (default is 1 days)
    overwrite: true,  //是否可以overwrite    (默认default true)
    httpOnly: true, //cookie是否只有服务器端可以访问 httpOnly or not (default true)
    signed: true,   //签名默认true
    rolling: true,  //在每次请求时强行设置cookie，这将重置cookie过期时间（默认：false）
    renew: false,  //(boolean) renew session when session is nearly expired,
};
greetingApp.use(session(CONFIG, greetingApp));
// 配置模板引擎
render(greetingApp, {
    root: path.join(__dirname, 'views'),   // 视图的位置
    extname: '.html',  // 后缀名
});

const auth = require("./auth");
const sso = require("./routes/sso")
const service = require("./routes/service")
const api = require("./routes/api");
const views = require("./routes/views");

// 静态资源配置
greetingApp.use(static(path.join(__dirname, './public')))
// 登录认证
greetingApp.use(auth);

// 路由
let router = new Router();
router.get('/', async (ctx) => {
    ctx.body = fs.readFileSync(path.join(__dirname, 'views/index.html')).toString();
})
router.get('/emailTemplate', async (ctx) => {
    ctx.body = fs.readFileSync(path.join(__dirname, 'views/mailTemplate.html')).toString();
})

router.use('/sso', sso.routes());
router.use('/api', api.routes());
router.use('/service', service.routes());
router.use('/views', views.routes());

greetingApp.use(router.routes()).use(router.allowedMethods());

greetingApp.listen(3002)


const {reloadServiceSchedule} = require('./component/index');
// reloadServiceSchedule();