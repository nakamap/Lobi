var CCBMainScene = cc.Scene.extend({
    ctor:function () {
        this._super();

        cc.BuilderReader.setResolutionScale(1);
        var node = cc.BuilderReader.load("MainScene.ccbi");

        this.addChild(node);
        this.setPosition(0, 0);
    }
});
