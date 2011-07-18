package
{
    import org.flixel.*;

    public class MenuState extends FlxState
    {
        private var _elapsed:Number = 0;
        private var _startFlashRate:Number = 1;
        private var _startText:String = "PUSH SPACE BUTTON";
        private var _t:FlxText;

        private var _startTimer:Number = 0;
        private var _startThreshold:Number = 1;

        private var _flickerTimer:Number = 0;
        private var _flickerThreshold:Number = 1;

        private var _title:TitleSprite;
        private var _player:Player;
        private var _background:BackgroundSprite;

        private var _started:Boolean = false;
        private var _flashing:Boolean = false;
        private var _spacePressed:Boolean = false;

        override public function create():void
        {
            _background = new BackgroundSprite();
            add(_background);

            _player = new Player(128, 136);
            _player.mobile = false;
            _player.got_key = true;
            add(_player);
            
            _title = new TitleSprite();
            add(_title);

            _t = new FlxText(0,186,256, _startText);
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);

            FlxG.flash(0xffffffff, 0.25);
            FlxG.shake(0.01, 0.4);
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _startFlashRate && !_flashing) {
                _elapsed = 0;
                _t.text = (_t.text == "" ? _startText : "");
            }
            if(FlxG.keys.SPACE) {
                _t.text = _startText; //Just in case...
                _t.flicker(_flickerThreshold);
                remove(_title);
                if(!_flashing) {
                    var flashingTitle:FlashingTitleSprite = new FlashingTitleSprite();
                    add(flashingTitle);
                    _spacePressed = true;
                }
                _flashing = true;
            }

            if(_spacePressed) {
                _flickerTimer += FlxG.elapsed;
                if(_flickerTimer >= _flickerThreshold)
                    FlxG.switchState(new WalkRightState());
            }
            super.update();
		    //FlxG.switchState(new PlayState());
        }
    }
}
