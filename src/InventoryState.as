package
{
	import org.flixel.*;
    import flash.utils.getDefinitionByName;

	public class InventoryState extends FlxState
	{
        [Embed(source='../data/Sounds_package.swf', symbol='select.wav')] public var SelectSound:Class;
        private var selector:int = 0;
        private var _background:BackgroundSprite;
        private var _selectorSprite:SelectorSprite;
        private var _numItems:int = 7;
        private var _itemList:Array = [];

        private var _timer:FlxText;
        private var _lives:FlxText;
        private var _keys:FlxText;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);

            _timer = new FlxText(222, 38+184, 20, PlayState.zeroPad(GameTracker.timeRemaining, 2));
            _timer.alignment = "right";
            _timer.setFormat("NES");
            add(_timer); 
            
            _lives = new FlxText(110, 38+184, 20, "1");
            _lives.alignment = "left";
            _lives.setFormat("NES");
            add(_lives); 

            _keys = new FlxText(110, 22+184, 20, "0");
            _keys.alignment = "left";
            _keys.setFormat("NES");
            add(_keys); 

            _selectorSprite = new SelectorSprite();
            add(_selectorSprite);

            var currentSlot:int = 0;
            for each (var itemClass:Class in GameTracker.items) {
                var item:InventoryItem = new itemClass(currentSlot);
                _itemList[currentSlot] = item;
                add(item);
                currentSlot++;
            }
        }

        override public function update():void
        {
            if(FlxG.keys.justPressed("DOWN")) {
                if(selector + 4 <= _numItems)
                    doSelect(selector + 4);
            }
            if(FlxG.keys.justPressed("UP")) {
                if(selector - 4 >= 0)
                    doSelect(selector - 4);
            }
            if(FlxG.keys.justPressed("RIGHT")) {
                if(selector < _numItems && selector != 3)
                    doSelect(selector+1);
            }
            if(FlxG.keys.justPressed("LEFT")) {
                if(selector > 0 && selector != 4)
                    doSelect(selector-1);
            }

            _selectorSprite.slot = selector;

            //Yes, son; now we are a family again.
            if(FlxG.keys.SPACE)
                FlxG.switchState(new SlideDownState());

            super.update();
        }

        public function doSelect(newPosition:Number):void {
            selector = newPosition;
            FlxG.play(SelectSound);
        }
	}
}
