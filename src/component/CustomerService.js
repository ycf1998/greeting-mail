const customerServiceDb = require("../db/customerService");

function CustomerService() {}

CustomerService.prototype = {
    constructor: CustomerService,
    doService: async function (args) {
        return (await customerServiceDb.getCustomerService(args.greeting_id, args.person_id))?.[0];
    }
}

module.exports = new CustomerService();
