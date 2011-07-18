package
{
	import org.flixel.*;

	public class SlideUpState extends FlxState
	{
        [Embed(source="../data/Sounds_package.swf", symbol="pause.wav")] public var PauseSound:Class;
        private var _background:BackgroundSprite;
        private var _velocity:Number = 150;

        override public function create():void
        {
            _background = new BackgroundSprite(-256);
            add(_background);

            FlxG.play(PauseSound, 1);
        }

        override public function update():void
        {
            if(_background.y < 0) {
                _background.y += FlxG.elapsed * _velocity;
            } else {
                FlxG.switchState(new InventoryState());
            } 
            super.update();
        }
	}
}
