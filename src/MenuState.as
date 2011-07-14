package
{
    import org.flixel.*;

    public class MenuState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _startFlashRate:Number = 1;
        private var _startText:String = "PUSH SPACE BUTTON";
        private var _t:FlxText;

        private var _title:TitleSprite;
        private var _player:Player;

        private var _started:Boolean = false;

        override public function create():void
        {
            _player = new Player(-150, 136);
            _player.automated = true;
            _player.heading = FlxObject.RIGHT;
            _player.velocity.x = _player.move_speed;
            _player.mobile = false;
            add(_player);
        }

        override public function update():void
        {
            if(_player.x >= 128) {
                if(!_started) {
                    _player.velocity.x = 0;
                    _player.got_key = true;
                    _title = new TitleSprite();
                    add(_title);

                    _t = new FlxText(0,186,256, _startText);
                    _t.alignment = "center";
                    _t.setFormat("NES");
                    add(_t);

                    FlxG.flash(0xffffffff, 0.25);

                    _started = true;
                }
                
                _elapsed += FlxG.elapsed;
                if(_elapsed >= _startFlashRate) {
                    _elapsed = 0;
                    _t.text = (_t.text == "" ? _startText : "");
                }
            }
            super.update();
		    //FlxG.switchState(new PlayState());
        }
    }
}
