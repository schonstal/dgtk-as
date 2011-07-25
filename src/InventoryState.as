package
{
	import org.flixel.*;
    import flash.utils.getDefinitionByName;

	public class InventoryState extends FlxState
	{
        [Embed(source='../data/Sounds_package.swf', symbol='select.wav')] public var SelectSound:Class;
        [Embed(source='../data/Sounds_package.swf', symbol='typing.wav')] public var TypeSound:Class;
        private var selector:int = 0;
        private var _background:BackgroundSprite;
        private var _selectorSprite:SelectorSprite;
        private var _numItems:int = 7;
        private var _itemList:Array = [];
        private var _itemLogoList:Array = [];

        private var _lives:FlxText;
        private var _keys:FlxText;
        private var _itemName:FlxText;
        private var _description:FlxText;
        private var _hilight:FlxText;

        private var _timer:TimerText;

        //This wouldn't be necessary if actionscript just supported continuations...
        private var _index:uint = 0;
        private var _msgTimer:Number = 0;
        private var _msgThreshold:Number = 0.032;
        private var _typeMessage:Boolean = false;
        private var _words:Array = [];
        private var _wordIndex:uint = 0;
        private var _lineNo:uint = 1;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);

            _timer = new TimerText(222, 38+184);
            add(_timer); 
            
            _lives = new FlxText(110, 38+184, 20, "1");
            _lives.alignment = "left";
            _lives.setFormat("NES");
            add(_lives); 

            _keys = new FlxText(110, 22+184, 20, "0");
            _keys.alignment = "left";
            _keys.setFormat("NES");
            add(_keys); 

            _description = new FlxText(32, 132, 192, "");
            _description.alignment = "left";
            _description.setFormat("NES");
            add(_description); 

            _hilight = new FlxText(32, 132, 192, "");
            _hilight.alignment = "left";
            _hilight.setFormat("NES");
            _hilight.color = 0xfffeff33; 
            add(_hilight); 

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

            doSelect(0, false);
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

            _msgTimer += FlxG.elapsed;
            if(_typeMessage && _msgTimer >= _msgThreshold) {
                var c:String = _itemList[selector].description.charAt(_index);
                var w:String = _words[_wordIndex];
                _description.text += c;
                
                if(w == "KEY" || w == "KEYS" || w == "KEYS." || w == "KEY.")
                    _hilight.text += (c == '.' ? ' ' : c);
                else
                    _hilight.text += ' ';

                if(_itemList[selector].description.charAt(_index) == ' ') {
                    _wordIndex++;
                    if(_words[_wordIndex].length + _description.text.length >= (24 * _lineNo)) {
                        _description.text += "\n";
                        _hilight.text += "\n";
                        _lineNo++;
                    }
                }
                FlxG.play(TypeSound);
                _index++;
                _msgTimer = 0;

                if(_index >= _itemList[selector].description.length)
                    _typeMessage = false;
            }

            //Yes, son; now we are a family again.
            if(FlxG.keys.SPACE)
                FlxG.switchState(new SlideDownState());

            if(FlxG.keys.justPressed("X")) {
                if(_description.text == "" && _itemList[selector] != null) {
                    _typeMessage = true;
                } else if(_typeMessage) {
                    resetDescription();
                    _description.text = _itemList[selector].description;
                } else {
                    resetDescription();
                }
            }

            super.update();
        }

        public function doSelect(newPosition:Number, playSound:Boolean = true):void {
            resetDescription();

            if(_itemList[selector] != null)
                _itemLogoList[selector].alpha = 0;
            selector = newPosition;
            if(_itemList[selector] != null) {
                _itemLogoList[selector].alpha = 1;
                _itemName.text = _itemList[selector].name;
                _words = _itemList[selector].description.split(' ');
            } else {
                _itemName.text = '';
            }
            
            if(playSound)
                FlxG.play(SelectSound);
        }

        public function resetDescription():void {
            _typeMessage = false;
            _description.text = "";
            _hilight.text = "";
            _index = 0;
            _wordIndex = 0;
            _lineNo = 1;
        }
	}
}
