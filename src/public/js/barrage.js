// 弹幕效果
const $barrage = {
    send: function (content) {
        let barrageArr = [];
        for (let i = 0; i < this.random.count(); i++) {
            barrageArr.push(this.generateBarrage(content));
        }
        barrageArr.forEach(barrage => {
            document.body.insertAdjacentElement("afterbegin", barrage);
            let duration = this.random.duration();
            barrage.animate([
                { left: '100%'},
                { left: '-100%'}
            ], {
                duration
            });
            setTimeout(() => barrage.remove(), duration + 200);
        })
    },
    generateBarrage: function (content) {
        let $p = document.createElement("p");
        $p.textContent = content;
        $p.style.position = 'fixed';
        $p.style.fontSize = this.random.fontSize();
        $p.style.color = this.random.color();
        $p.style.top = this.random.top();
        $p.style.fontWeight = this.random.fontWeight();
        $p.style.whiteSpace = 'nowrap';
        $p.style.left = '110%';
        $p.style.zIndex = '1024';
        return $p;
    },
    random: {
        count() {
            if ((navigator.userAgent.match(/(iPhone|iPod|Android|ios|iOS|iPad|Backerry|WebOS|Symbian|Windows Phone|Phone)/i))) {
                return Math.floor(Math.random() * (10 - 5)) + 5;
            }
            return Math.floor(Math.random() * (25 - 20)) + 20;
        },
        fontWeight() {
            return Math.floor(Math.random() * (800 - 300)) + 300;
        },
        fontSize() {
            return Math.floor(Math.random() * (3.5 - 1)) + 1 + 'rem';
        },
        duration() {
            return (Math.floor(Math.random() * (12 - 5)) + 5) * 1000;
        },
        top() {
            return Math.floor(Math.random() * (document.body.clientWidth - 20)) + 20 + 'px';
        },
        color() {
            return '#' + Math.floor(Math.random() * 0xffffff).toString(16);
        },
    },
}