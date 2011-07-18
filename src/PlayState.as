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
        private var _timer:FlxText;
        private var _lives:FlxText;
        private var _keys:FlxText;

        private var _activeMessage:FlxText;
        private var _activeMessageKey:FlxText;
        private var _passiveMessage:FlxText;

        private var _chestPad:Array = [];
        private var _doorPad:FlxObject;

        private var _walls:FlxGroup;
        
        private var _doorAppeared:Boolean = false; 
        private var _messageActive:Boolean = false;

        override public function create():void
        {
            //Add bg
            _background = new BackgroundSprite();
            _background.x = -256;
            add(_background);

            //Add door
            _door = new DoorSprite();
            _door.play("closed");
            add(_door);

            _doorPad = new FlxObject(_door.x + 16, _door.y + 8, 4, 16);
            add(_doorPad);

            //add Chest            
            _chest = new ChestSprite();
            add(_chest);

            _chestPad['left'] = new FlxObject(_chest.x - 4, _chest.y, 4, 16);
            _chestPad['top'] = new FlxObject(_chest.x, _chest.y - 4, 16, 4);
            _chestPad['bottom'] = new FlxObject(_chest.x, _chest.y + 16, 16, 4);

            add(_chestPad['left']);
            add(_chestPad['top']);
            add(_chestPad['bottom']);

            //Add player
            _player = new Player(GameTracker.playerPos.x, GameTracker.playerPos.y);
            _player.heading = GameTracker.heading;
            add(_player);

            //Define boundaries
            _walls = new FlxGroup();
            addWall(0,0,32,256);
            addWall(224,0,32,256);
            addWall(0,0,240,80);
            addWall(0,200,240,40);
            add(_walls); 
            
            //Add messages
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

            _timer = new FlxText(222, 38, 20, "30");
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

            //Add key
            _key = new KeySprite(120, 129, _player);
            add(_key);
        }

        override public function update():void
        {
            GameTracker.timeRemaining -= FlxG.elapsed;
            _timer.text = zeroPad(GameTracker.timeRemaining, 2);

            if(GameTracker.timeRemaining <= 0) {
                FlxG.switchState(new WinState());
            }

            FlxG.collide(_player, _chest);
            FlxG.collide(_player, _walls);

            if(!_messageActive) {
                if(!checkInteractable(FlxObject.RIGHT, 'left') &&
                    !checkInteractable(FlxObject.DOWN, 'top') &&
                    !checkInteractable(FlxObject.UP, 'bottom') &&
                    !checkInteractable(FlxObject.LEFT, 'right', "DOOR")) {
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

        public function checkInteractable(heading:uint, side:String, msg:String = "CHEST"):Boolean {
            if(_player.heading == heading && FlxG.overlap(_player, (msg == "CHEST"?_chestPad[side]:_doorPad))) {
                _passiveMessage.text = "PUSH X TO OPEN";
                if(FlxG.keys.justPressed('X')) {
                    _activeMessage.text = "THIS "+msg+" IS LOCKED!\n" +
                        "YOU NEED A     TO OPEN IT";
                    _activeMessageKey.text = "           KEY           ";
                    _messageActive = true;
                }
                return true;
            } else {
                return false;
            }
        }

        public function addWall(X:Number, Y:Number, w:Number, h:Number):void {
            var wall:FlxObject = new FlxObject(X,Y,w,h);
            wall.immovable = true;
            _walls.add(wall);
        }

        public function zeroPad(number:int, width:int):String {
           var ret:String = ""+number;
           while( ret.length < width )
               ret="0" + ret;
           return ret;
        }
	}
}
