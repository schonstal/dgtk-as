package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
        private var _player:Player;
        private var _key:KeySprite;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        
        private var _doorAppeared:Boolean = false; 

        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _door = new DoorSprite();
            _door.play("closed");
            add(_door);

            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = FlxObject.RIGHT;
            add(_player);

            _key = new KeySprite(120, 132, _player);
            add(_key);
        }

        override public function update():void
        {
            super.update();
        }
	}
}
