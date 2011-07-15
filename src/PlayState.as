package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
        private var _player:Player;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        
        private var _doorAppeared:Boolean = false; 

        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _door = new DoorSprite();
            add(_door);

            _player = new Player(58, 136);
            _player.heading = FlxObject.RIGHT;
            add(_player);
        }

        override public function update():void
        {
            super.update();
        }
	}
}
