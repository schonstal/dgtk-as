package
{
	import org.flixel.*;

	public class WinState extends FlxState
	{
        private var _player:Player;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        private var _key:KeySprite;
        private var _t:FlxText;
        private var _chest:ChestSprite;
        private var _rave:Rave;
        private var _darken:Darken;

        private var _lives:FlxText;
        private var _keys:FlxText;
        private var _continue:FlxText;

        private var _timer:FlxText;

        private var _continueTimer:Number = -2.5;
        private var _continueThreshold:Number = 0.5;

        private var _continueText:String = "PUSH X TO CONTINUE";
        
        override public function create():void
        {
            GameTracker.api.kongregate.stats.submit("did_not_get_key", 1);

            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);
            
            _timer = new TimerText();
            add(_timer); 

            _lives = new FlxText(110, 38, 20, "1");
            _lives.alignment = "left";
            _lives.setFormat("NES");
            add(_lives); 

            _keys = new FlxText(110, 22, 20, "0");
            _keys.alignment = "left";
            _keys.setFormat("NES");
            add(_keys); 

            _door = new DoorSprite();
            _door.play("closed");
            add(_door);

            _t = new FlxText(0,94,256, "CONGRATULATIONS!");
            _t.alignment = "center";
            _t.setFormat("NES");
            _t.shadow = 0xff000000;
            add(_t);

            _continue = new FlxText(0,205,256, "");
            _continue.alignment = "center";
            _continue.setFormat("NES");
            add(_continue);
            
            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = FlxObject.RIGHT;
            _player.y -= 2;
            _player.mobile = false;
            _player.dance = true;
            add(_player);

            _key = new KeySprite(120, 129, _player);
            var keyShadow:KeyShadowSprite = new KeyShadowSprite(_key.x-4, _key.y-2);
            add(keyShadow);
            add(_key);
            
            _chest = new ChestSprite();
            add(_chest);

            _darken = new Darken();
            add(_darken);

            _rave = new Rave();
            add(_rave);

        }

        override public function update():void
        {
            _continueTimer += FlxG.elapsed;
            if(_continueTimer > _continueThreshold) {
                _continueTimer = 0;
                _continue.text = _continueText;
            }
            if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("SPACE")){
                FlxG.switchState(new DiedOfState());
            }
            super.update();
        } 
	}
}
