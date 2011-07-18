package
{
    import org.flixel.*;

    public class Rave extends FlxSprite
    {
        private var _timer:Number = 0;
        private var _threshold:Number = 0.15;
        private var _colorIndex:Number = 0;

        private var _colors:Array = [
            0xffffff00,
            0xff222222,
            0xff00ffff,
            0xff222222,
            0xffff00ff,
            0xff222222,
            0xffff2200,
            0xff222222
        ];

        private var _mask:uint = _colors[0];

        public function Rave() {
            super(0,56);
            makeGraphic(256, 184, 0xff000000);
            blend = "multiply";
        }
        
        override public function update():void {
            _timer += FlxG.elapsed;
            if(_timer >= _threshold) {
                _timer = 0;
                _colorIndex = ++_colorIndex % _colors.length;
                _mask = _colors[_colorIndex];
                fill(_mask);
            }

            super.update();
        }
    }
}
