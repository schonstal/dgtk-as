package
{
    import org.flixel.*;

    public class WalkInState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _startFlashRate:Number = 1;
        private var _startText:String = "PUSH SPACE BUTTON";
        private var _t:FlxText;

        private var _title:TitleSprite;
        private var _player:Player;

        override public function create():void
        {
            _title = new TitleSprite();
            add(_title);
    

            _t = new FlxText(0,186,256, _startText);
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);
            
            add(_player);
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _startFlashRate) {
                _elapsed = 0;
                _t.text = (_t.text == "" ? _startText : "");
            } 
            super.update();
		    //FlxG.switchState(new PlayState());
        }
    }
}
