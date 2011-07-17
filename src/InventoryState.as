package
{
	import org.flixel.*;

	public class InventoryState extends FlxState
	{
        private var _background:BackgroundSprite;

        override public function create():void
        {
            _background = new BackgroundSprite(-256, 0);
            add(_background);
        }

        override public function update():void
        {
            //Yes, son; now we are a family again.
            if(FlxG.keys.SPACE)
                FlxG.switchState(new SlideDownState());

            super.update();
        }
	}
}
