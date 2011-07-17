package
{
    import org.flixel.*;

    public class GameTracker
    {
        public var _playerPos:FlxPoint;
        public var _timeRemaining:Number;

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
    }
}
