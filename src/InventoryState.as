package
{
	import org.flixel.*;

	public class InventoryState extends FlxState
	{
        private var selector:int = 0;
        private var _background:BackgroundSprite;
        private var _selectorSprite:SelectorSprite;
        private var _numItems:int = 7;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);

            _selectorSprite = new SelectorSprite();
            add(_selectorSprite);
        }

        override public function update():void
        {
            if(FlxG.keys.justPressed("DOWN")) {
                if(selector + 4 <= _numItems)
                    selector = (selector + 4);
            }
            if(FlxG.keys.justPressed("UP")) {
                if(selector - 4 >= 0)
                    selector = selector - 4;
            }
            if(FlxG.keys.justPressed("RIGHT")) {
                if(selector < _numItems && selector != 3)
                    selector++;
            }
            if(FlxG.keys.justPressed("LEFT")) {
                if(selector > 0 && selector != 4)
                    selector--;
            }

            _selectorSprite.slot = selector;

            //Yes, son; now we are a family again.
            if(FlxG.keys.SPACE)
                FlxG.switchState(new SlideDownState());

            super.update();
        }
	}
}
