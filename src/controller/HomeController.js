const serviceDb = require("../db/service");
const greetingCardDb = require("../db/greetingCard");

async function showAllCards(ctx) {
    let serviceList = await serviceDb.queryList();
    let greetingCards = await greetingCardDb.queryList();
    let greetingTasks = [];
    for (let data of greetingCards) {
        let gt = {
            id: '',
            card_name: data.card_name,
            card_type: data.card_type,
            card_desc: data.card_desc,
            greetings_number: 0,
            open: true,
            subscribe: [],
        }
        greetingTasks.push(gt);
    }
    await ctx.render('greetingCard', {
        greetingTasks,
        serviceList
    })
}

module.exports = {
    showAllCards
}

