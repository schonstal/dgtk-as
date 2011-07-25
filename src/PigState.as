
package
{
    import org.flixel.*;

    public class PigState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _rate:Number = 3;

        override public function create():void
        {
            var pigSprite:PigSprite = new PigSprite();
            add(pigSprite);
          
            FlxG.flash(0xff000000, 1);
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _rate) {
                FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new BlackState()); });
            }
            super.update();
        }
    }
}
