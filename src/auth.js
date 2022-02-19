// 放行白名单
const witheList = ['/',
    '/sso/login',
    '/sso/register',
    '/favicon.ico',
    '/api/services',
    '/api/province',
    '/api/city',
    '/api/district',
    '/views/showAllCards']

async function auth(ctx, next) {
    if (!witheList.includes(ctx.path)) {
        if (ctx.session.USERID === undefined) {
            ctx.body = {
                code: 401,
                message: "未登录"
            };
            return;
        }
    }
    // console.log(ctx.path, ctx.session)
    await next();
}

module.exports = auth;