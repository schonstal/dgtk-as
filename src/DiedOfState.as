package
{
	import org.flixel.*;

	public class DiedOfState extends FlxState
	{
        private var _continue:FlxText;

        private var _continueTimer:Number = -2.5;
        private var _continueThreshold:Number = 0.5;

        private var _continueText:String = "PUSH X TO CONTINUE";
        
        override public function create():void
        {
            var t:FlxText = new FlxText(0,70,256, "YOU HAVE DIED OF");
            t.alignment = "center";
            t.setFormat("NES");
            add(t);

            t = new FlxText(0,t.y+10,256, "DYSENTERY");
            t.alignment = "center";
            t.setFormat("NES");
            add(t);

            var grave:GraveSprite = new GraveSprite(112, 104);
            add(grave);

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
