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
        private var _timer:FlxText;
        private var _lives:FlxText;
        private var _keys:FlxText;
        
        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);
            
            _timer = new FlxText(222, 38, 20, "00");
            _timer.alignment = "right";
            _timer.setFormat("NES");
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
            
            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = FlxObject.RIGHT;
            _player.y -= 2;
            _player.mobile = false;
            _player.dance = true;
            add(_player);

            _key = new KeySprite(120, 129, _player);
            _key.floating = false;
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
            super.update();
        } 
	}
}
