package
{
    import org.flixel.*;

    public class ControlsState extends FlxState
    {
        private var _initialElapsed:Number = 0;
        private var _initialRate:Number = 3;        

        private var _elapsed:Number = 0;
        private var _startFlashRate:Number = 1;
        private var _startText:String = "CLICK TO CONTINUE";
        private var _t:FlxText;

        override public function create():void
        {
            var controlsSprite:ControlsSprite = new ControlsSprite();
            add(controlsSprite);

            _t = new FlxText(0,214,256, "");
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);

            FlxG.flash(0xff000000, 1);
        }

        override public function update():void
        {
            _initialElapsed += FlxG.elapsed;
            if(_initialElapsed >= _initialRate) {
                _elapsed += FlxG.elapsed;
                if(_elapsed >= _startFlashRate) {
                    _elapsed = 0;
                    _t.text = _startText;
                } 
            }
            super.update();
            
            if(FlxG.keys.justPressed("X") || FlxG.mouse.justPressed()) {
                FlxG.fade(0xff000000, 1, function():void { FlxG.switchState(new BlackState()); });
            }
        }
    }
}
