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
        private var _itemLogoList:Array = [];

        private var _timer:FlxText;
        private var _lives:FlxText;
        private var _keys:FlxText;
        private var _itemName:FlxText;

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
                var itemLogo:InventoryItem = new itemClass(1);
                itemLogo.x = 192;
                itemLogo.y = 44;
                itemLogo.alpha = 0;
                _itemLogoList[currentSlot] = itemLogo;
                add(itemLogo);
                currentSlot++;
            }

            _itemName = new FlxText(154, 63, 88, '');
            _itemName.alignment = "center";
            _itemName.setFormat("NES");
            add(_itemName); 

            doSelect(0);
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
            if(_itemList[selector] != null)
                _itemLogoList[selector].alpha = 0;
            selector = newPosition;
            if(_itemList[selector] != null) {
                _itemLogoList[selector].alpha = 1;
                _itemName.text = _itemList[selector].name;
            } else {
                _itemName.text = '';
            }
            FlxG.play(SelectSound);
        }
	}
}
