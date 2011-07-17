package
{
    import org.flixel.*;

    public class GameTracker
    {
        //Persist player position between states
        public var _playerPos:FlxPoint;

        //Persist the time remaining between states
        public var _timeRemaining:Number;

        //Persist the player heading between states
        public var _heading:uint;

        private static var _instance:GameTracker = null;

		public function GameTracker() {
        }

        private static function get instance():GameTracker {
            if(_instance == null) {
                _instance = new GameTracker();
                _instance._playerPos = new FlxPoint(0,0);
                _instance._timeRemaining = 30;
            }

            return _instance;
        }

        public static function get playerPos():FlxPoint {
            return instance._playerPos;
        }
        
        public static function set playerPos(value:FlxPoint):void {
            instance._playerPos = value;
        }

        public static function get timeRemaining():Number {
            return instance._timeRemaining;
        }

        public static function set timeRemaining(value:Number):void {
            instance._timeRemaining = value;
        }

        public static function get heading():uint {
            return instance._heading;
        }

        public static function set heading(value:uint):void {
            instance._heading = value;
        }
    }
}
