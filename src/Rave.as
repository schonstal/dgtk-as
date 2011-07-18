package
{
    import org.flixel.*;

    public class Rave extends FlxSprite
    {
        private var _timer:Number = 0;
        private var _threshold:Number = 0.3;
        private var _colorIndex:Number = 0;

        private var _colors:Array = [
            0xffff0000,
            0xff00ff00,
            0xff0000ff
        ];

        private var _mask:uint = _colors[0];

        public function Rave() {
            super(0,56);
            makeGraphic(256, 184, 0xff000000);
            blend = "add";
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
