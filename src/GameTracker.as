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

        //Items for this playthough in the inventory
        public var _items:Array;

        private static var _instance:GameTracker = null;
        private static var _allItems:Array = [
            ItemBikelock,
            ItemBinoculars,
            ItemGoldpouch,
            ItemJournal,
            ItemKeyrings,
            ItemLockbox,
            ItemLocket,
            ItemLockOfHair,
            ItemLockPicks,
            ItemPadLock,
            ItemRope
        ]

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

        public static function get items():Array {
            return instance._items;
        }

        public static function set items(value:Array):void {
            instance._items = value;
        }

        public static function generateItems():void {
            var newItems:Array = [];
            for each (var it:Class in _allItems) { 
                if(Math.random() > 0.3) {
                    newItems.push(it);
                }
            }
            newItems = newItems.sort(function(a:Class, b:Class):int {
                return Math.round(Math.random()*2)-1;
            });

            if(newItems.length > 8) {
                newItems.splice(8, 100);
            }

            items = newItems;
        } 
    }
}
