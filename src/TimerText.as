package
{
    import org.flixel.*;

    public class TimerText extends FlxText
    {
        public static const RED_TIME:Number = 5;

        public var tick:Boolean = false;

        private var _redTimer:Number = 0;
        private var _redThreshold:Number = 0.25;

        private var _colors:Array = [0xffff0000, 0xff000000];
        private var _colorIndex:Number = 0;

        public function TimerText(X:Number = 222, Y:Number = 38) {
            super(X, Y, 20, zeroPad(GameTracker.timeRemaining, 2));
            alignment = "right";
            setFormat("NES");

            if(GameTracker.timeRemaining <= RED_TIME)
                color = _colors[0];
        }

        override public function update():void {
            if(GameTracker.timeRemaining <= RED_TIME) {
                if(tick) {
                    //Consider making a timedEvent or something?
                    _redTimer += FlxG.elapsed;
                    if(_redTimer > _redThreshold) {
                        _colorIndex = (_colorIndex == 0 ? 1 : 0);
                        color = _colors[_colorIndex];
                        _redTimer = 0;
                    }
                } else {
                    color = _colors[0];
                }
            }

            text = zeroPad(Math.ceil(GameTracker.timeRemaining), 2);
        }

        public static function zeroPad(number:int, width:int):String {
           var ret:String = ""+number;
           while( ret.length < width )
               ret="0" + ret;
           return ret;
        }
    }
}
