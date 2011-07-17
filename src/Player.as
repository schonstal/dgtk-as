package
{
    import org.flixel.*;

    public class Player extends FlxSprite
    {
        [Embed(source="../data/Sounds_package.swf", symbol="walk1.wav")] public var Walk1:Class;
        [Embed(source="../data/Sounds_package.swf", symbol="walk2.wav")] public var Walk2:Class;

        public var mobile:Boolean = true;
        public var heading:uint = RIGHT;
        public var automated:Boolean = true;
        public var got_key:Boolean = false;

        [Embed(source='../data/character.png')] private var ImgPlayer:Class;
        private var _move_speed:int = 50;
        private var _walkFPS:int = 3;

        private var _walkFrame:int = 0;
        private var _walkSounds:Array;

        public function get move_speed():int {
            return _move_speed; 
        } 

        public function Player(X:Number,Y:Number):void
        {
            super(X,Y);
            loadGraphic(ImgPlayer, true, true, 16, 16); 

            addAnimation("walk_left", [8, 7], _walkFPS);
            addAnimation("walk_right", [1, 0], _walkFPS);
            addAnimation("walk_down", [5, 4], _walkFPS);
            addAnimation("walk_up", [3, 2], _walkFPS);
            
            addAnimation("stop_left", [7]);
            addAnimation("stop_right", [0]);
            addAnimation("stop_down", [4]);
            addAnimation("stop_up", [2]);
            
            addAnimation("got_key", [6]);

            _walkSounds = [Walk1, Walk2];

            width = 8;
            height = 16;

            offset.x = 4;
            offset.y = 0;

            heading = RIGHT;

            addAnimationCallback(function(id:String, frameNumber:uint, frameIndex:uint):void {
                if(frameIndex != 6 && (FlxG.keys.UP || FlxG.keys.DOWN || FlxG.keys.RIGHT || FlxG.keys.LEFT)) {
                    _walkFrame = ++_walkFrame % 2;
                    FlxG.play(_walkSounds[_walkFrame]);
                }
            });
        }

        override public function update():void
        {           
            //Check input for player movement
            if (mobile) {
                if (FlxG.keys.LEFT) {
                    heading = LEFT;
                    velocity.x = -_move_speed;
                } else if (FlxG.keys.RIGHT) {
                    heading = RIGHT;
                    velocity.x = _move_speed;                
                } else {
                    velocity.x = 0;
                } 
                
                if (FlxG.keys.UP) {
                    heading = UP;
                    velocity.y = -_move_speed;
                } else if (FlxG.keys.DOWN) {
                    heading = DOWN;
                    velocity.y = _move_speed;
                } else {
                    velocity.y = 0;
                }
            } else if(!automated) {
                velocity.x = 0;
                velocity.y = 0;
            }
            
            if(velocity.x != 0 || velocity.y != 0) {
                switch(heading) {
                    case LEFT:
                        play("walk_left");
                        break;
                    case RIGHT:
                        play("walk_right");
                        break;
                    case UP:
                        play("walk_up");
                        break;
                    case DOWN:
                        play("walk_down");
                        break;
                }
            } else {
                if(!got_key) {
                    switch(heading) {
                        case LEFT:
                            play("stop_left");
                            break;
                        case RIGHT:
                            play("stop_right");
                            break;
                        case UP:
                            play("stop_up");
                            break;
                        case DOWN:
                            play("stop_down");
                            break;
                    }
                } else {
                  play("got_key");
                }
            }

            GameTracker.playerPos.x = x;
            GameTracker.playerPos.y = y;

            super.update();
        }
  
    }
}
