package
{
    import org.flixel.*;

    public class LogoState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _rate:Number = 0.5;//2;

        override public function create():void
        {
          var logoSprite:LogoSprite = new LogoSprite();
          add(logoSprite);

          //Should play a sound here ("ba-ding!")
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _rate) {
              FlxG.switchState(new BlackState());
            }
            super.update();
        }
    }
}
