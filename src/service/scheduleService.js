const nodeSchedule = require('node-schedule');

class ScheduleService {

    schedules = []
    /**
     * 添加定时任务
     * @param cron
     * @param func
     */
    addSchedule(cron, func) {
        console.log(`开启定时任务：${cron}`);
        this.schedules.push(nodeSchedule.scheduleJob(cron, func));
    }

    /**
     * 关闭所有定时任务
     * @param name
     */
    closeAllSchedule() {
        this.schedules.forEach(s => s.cancel());
    }
}

module.exports = new ScheduleService();

