package
{
	import org.flixel.*;

	public class GameOverState extends FlxState
	{
        private var _player:Player;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        private var _key:KeySprite;
        private var _t:FlxText;
        
        private var _barLeft:BlackBarSprite;
        private var _barRight:BlackBarSprite;
        
        private var _swipeTimer:Number = 0;
        private var _swipeThreshold:Number = 1;
        
        private var _doorAppeared:Boolean = false; 

        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _door = new DoorSprite();
            _door.play("closed");
            add(_door);

            _t = new FlxText(0,64,256, "YOU GOT THE KEY");
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);
            
            _barLeft = new BlackBarSprite(-128, 48);
            add(_barLeft);
            _barRight = new BlackBarSprite(256, 48);
            add(_barRight);

            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = FlxObject.RIGHT;
            _player.y -= 2;
            _player.got_key = true;
            _player.mobile = false;
            add(_player);

            _key = new KeySprite(_player.x - 4, _player.y - 16, _player);
            _key.floating = false;
            add(_key);
        }

        override public function update():void
        {
            _swipeTimer += FlxG.elapsed;
            if(_swipeTimer >= _swipeThreshold) {
                _barLeft.swipe(false);  
                _barRight.swipe(true);
            }
            super.update();
       } 
	}
}
