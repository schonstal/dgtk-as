package
{
	import org.flixel.*;

	public class DoorCloseState extends FlxState
	{
        [Embed(source="../data/Sounds_package.swf", symbol="door_close.wav")] public var DoorClose:Class;
        
        private var _player:Player;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        
        private var _doorAppeared:Boolean = false; 
        private var _shaking:Boolean = false;

        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _player = new Player(23, 136);
            _player.automated = true;
            _player.velocity.x = _player.move_speed;
            _player.heading = FlxObject.RIGHT;
            _player.mobile = false;
            add(_player);

            GameTracker.timeRemaining = 30;
            GameTracker.generateItems();
        }

        override public function update():void
        {
            if(_player.x >= 48) {
                _player.automated = false;
                _player.velocity.x = 0;
                
                if(!_doorAppeared) {
                    _doorAppeared = true;
                    _door = new DoorSprite();
                    add(_door);
                    
                    FlxG.shake(0.005, 0.3, function():void { FlxG.switchState(new PlayState()) });
                    FlxG.play(DoorClose, 1);
                }
            }
            super.update();
        }
	}
}
