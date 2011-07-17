package
{
	import org.flixel.*;

	public class SlideDownState extends FlxState
	{
        private var _background:BackgroundSprite;
        private var _velocity:Number = 150;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);
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
