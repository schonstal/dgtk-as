package
{
	import org.flixel.*;

	public class PlayState extends FlxState
	{
        private var _player:Player;
        private var _key:KeySprite;
        private var _background:BackgroundSprite;
        private var _door:DoorSprite;
        private var _chest:ChestSprite;

        private var _activeMessage:FlxText;
        private var _activeMessageKey:FlxText;
        private var _passiveMessage:FlxText;

        private var _chestPad:Array = [];
        
        private var _doorAppeared:Boolean = false; 
        private var _messageActive:Boolean = false;

        override public function create():void
        {
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            _door = new DoorSprite();
            _door.play("closed");
            add(_door);
            
            _chest = new ChestSprite();
            add(_chest);

            _chestPad['left'] = new FlxObject(_chest.x - 4, _chest.y, 4, 16);
            _chestPad['top'] = new FlxObject(_chest.x, _chest.y - 4, 16, 4);
            _chestPad['bottom'] = new FlxObject(_chest.x, _chest.y + 16, 16, 4);

            add(_chestPad['left']);
            add(_chestPad['top']);
            add(_chestPad['bottom']);

            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = GameTracker.heading;
            add(_player);
            
            _passiveMessage = new FlxText(0,205,256, "");
            _passiveMessage.alignment = "center";
            _passiveMessage.setFormat("NES");
            _passiveMessage.shadow = 0xff000000;
            add(_passiveMessage);

            _activeMessage = new FlxText(0,90,256, "");
            _activeMessage.alignment = "center";
            _activeMessage.setFormat("NES");
            _activeMessage.shadow = 0xff000000;
            add(_activeMessage);
            
            _activeMessageKey = new FlxText(0,_activeMessage.y+8,256, "");
            _activeMessageKey.alignment = "center";
            _activeMessageKey.setFormat("NES");
            _activeMessageKey.color = 0xfffeff33;
            _activeMessageKey.shadow = 0xff000000;
            add(_activeMessageKey);

            _key = new KeySprite(120, 132, _player);
            add(_key);
        }

        override public function update():void
        {
            FlxG.collide(_player, _chest);

            if(!_messageActive) {
                if(!checkChest(FlxObject.RIGHT, 'left') &&
                    !checkChest(FlxObject.DOWN, 'top') &&
                    !checkChest(FlxObject.UP, 'bottom')) {
                        _passiveMessage.text = "";
                }
            } else {
                _player.mobile = false;
                _passiveMessage.text = "PUSH X TO CONTINUE";
                if(FlxG.keys.justPressed('X')) {
                    _messageActive = false;
                    _activeMessage.text = "";
                    _activeMessageKey.text = "";
                    _player.mobile = true;
                }
            }

            //Dad, are you space?
            if(FlxG.keys.SPACE)
                FlxG.switchState(new SlideUpState());

            super.update();
        }

        public function checkChest(heading:uint, side:String):Boolean {
            if(_player.heading == heading && FlxG.overlap(_player, _chestPad[side])) {
                _passiveMessage.text = "PUSH X TO OPEN";
                if(FlxG.keys.justPressed('X')) {
                    _activeMessage.text = "THIS CHEST IS LOCKED!\n" +
                        "YOU NEED A     TO OPEN IT";
                    _activeMessageKey.text = "           KEY           ";
                    _messageActive = true;
                }
                return true;
            } else {
                return false;
            }
        }
	}
}
