package
{
	import org.flixel.*;

	public class SlideDownState extends FlxState
	{
        [Embed(source="../data/Sounds_package.swf", symbol="sad_pause.wav")] public var SadPauseSound:Class;
        private var _background:BackgroundSprite;
        private var _velocity:Number = 150;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);
            
            FlxG.play(SadPauseSound, 1);
        }

        override public function update():void
        {
            if(_background.y > -184) {
                _background.y -= FlxG.elapsed * _velocity;
            } else {
                FlxG.switchState(new PlayState());
            } 
            super.update();
        }
	}
}
