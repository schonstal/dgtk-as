package
{
    import org.flixel.*;

    public class LogoState extends FlxState
    {
        [Embed(source="../data/Sounds_package.swf", symbol="pickup_key.wav")] public var Ding:Class;

        private var _elapsed:Number = 0;
        private var _rate:Number = 2;

        override public function create():void
        {
          FlxG.level = 1;
          var logoSprite:LogoSprite = new LogoSprite();
          add(logoSprite);

          //Should play a sound here ("ba-ding!")
          FlxG.play(Ding);
        }

        override public function update():void
        {
            if(!GameTracker.api)
                (GameTracker.api = FlxG.stage.addChild(new KongApi()) as KongApi).init();

            _elapsed += FlxG.elapsed;
            if(_elapsed >= _rate) {
              FlxG.switchState(new BlackState());
            }
            super.update();
        }
    }
}
