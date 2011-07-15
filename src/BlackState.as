package
{
    import org.flixel.*;

    public class BlackState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _rate:Number = 0.5;

        override public function create():void
        {
          //Just a black screen that waits...
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _rate) {
                switch(FlxG.level) {
                    case 1:
                        go(new PigState());
                        break;
                    case 2:
                        go(new ControlsState());
                        break;
                    case 3:
                        go(new WalkInState());
                        break;
                }
            }
            super.update();
        }

        private function go(state:FlxState):void {
            FlxG.level++;
            FlxG.switchState(state);
        }
    }
}
