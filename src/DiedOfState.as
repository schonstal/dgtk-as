package
{
	import org.flixel.*;

	public class DiedOfState extends FlxState
	{
        private var _t:FlxText;

        private var _continue:FlxText;

        private var _continueTimer:Number = -2.5;
        private var _continueThreshold:Number = 0.5;

        private var _continueText:String = "PUSH X TO CONTINUE";
        
        override public function create():void
        {
            _t = new FlxText(0,94,256, "YOU HAVE DIED OF DYSENTERY");
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);

            _continue = new FlxText(0,186,256, "");
            _continue.alignment = "center";
            _continue.setFormat("NES");
            add(_continue);
        }

        override public function update():void
        {
            _continueTimer += FlxG.elapsed;
            if(_continueTimer > _continueThreshold) {
                _continueTimer = 0;
                _continue.text = _continue.text == "" ? _continueText : "";
            }
            if(FlxG.keys.justPressed("X") || FlxG.keys.justPressed("SPACE")){
                FlxG.switchState(new MenuState());
            }
            super.update();
        } 
	}
}
