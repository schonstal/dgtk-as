package
{
    import org.flixel.*;

    public class BlackState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _rate:Number = 0.25;//1;

        override public function create():void
        {
          //Just a black screen that waits...
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _rate) {
              FlxG.switchState(new ControlsState());
            }
            super.update();
        }
    }
}
