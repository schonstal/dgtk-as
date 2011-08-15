package
{
	import org.flixel.*;

	public class GameOverState extends FlxState
	{
        [Embed(source="../data/Sounds_package.swf", symbol="pickup_key.wav")] public var Ding:Class;
        [Embed(source="../data/Sounds_package.swf", symbol="game_over.wav")] public var GameOverSound:Class;

        private var _player:Player;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        private var _key:KeySprite;
        private var _t:FlxText;
        private var _gt:FlxText;
        private var _ps:FlxText;

        private var _lives:FlxText;
        private var _keys:FlxText;

        private var _timer:TimerText;

        private var _barLeft:BlackBarSprite;
        private var _barRight:BlackBarSprite;
        
        private var _swipeTimer:Number = 0;
        private var _swipeThreshold:Number = 1;
        
        private var _doorAppeared:Boolean = false; 
        private var _gameOverPlayed:Boolean = false;
        
        private var _elapsed:Number = 0;
        private var _flashRate:Number = 1;

        private var _gameOverSoundInstance:FlxSound;

        override public function create():void
        {
            FlxG.play(Ding);
            FlxG.music.stop();
            FlxG.music.destroy();

            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _door = new DoorSprite();
            _door.play("closed");
            add(_door);

            var chest:ChestSprite = new ChestSprite();
            add(chest);

            _barLeft = new BlackBarSprite(-138, 48);
            add(_barLeft);
            _barRight = new BlackBarSprite(256, 48);
            add(_barRight);

            _t = new FlxText(0,94,256, "YOU GOT THE KEY!");
            _t.alignment = "center";
            _t.setFormat("NES");
            _t.shadow = 0xff000000;
            add(_t);            

            _timer = new TimerText();
            add(_timer); 
            
            _lives = new FlxText(110, 38, 20, "1");
            _lives.alignment = "left";
            _lives.setFormat("NES");
            add(_lives); 

            _keys = new FlxText(110, 22, 20, "1");
            _keys.alignment = "left";
            _keys.setFormat("NES");
            add(_keys); 

            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = FlxObject.RIGHT;
            _player.y -= 2;
            _player.got_key = true;
            _player.mobile = false;
            add(_player);

            _key = new KeySprite(_player.x - 4, _player.y - 16, _player);
            _key.floating = false;
            add(_key);

            _ps = new FlxText(0,170,256, "");
            _ps.alignment = "center";
            _ps.setFormat("NES");
            add(_ps);
        }

        override public function update():void
        {
            _swipeTimer += FlxG.elapsed;
            if(_swipeTimer >= _swipeThreshold) {
                _barLeft.swipe(false);  
                _barRight.swipe(true);
            }

            if(_barLeft.x >= -10) {
                if(!_gameOverPlayed) {
                    _gameOverSoundInstance = FlxG.play(GameOverSound);
                    _gameOverPlayed = true;
                }
                _t.text = "GAME OVER";
                _elapsed += FlxG.elapsed;
                if(_elapsed >= _flashRate && !_gameOverSoundInstance.active) {
                    _elapsed = 0;
                    _ps.text = "PUSH X TO RETRY";
                }

                if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("SPACE"))
                    FlxG.switchState(new MenuState());
            }
    
            super.update();
       } 
	}
}
