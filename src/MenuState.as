package
{
    import org.flixel.*;

    public class MenuState extends FlxState
    {
        [Embed(source="../data/Sounds_package.swf", symbol="menu.wav")] public var MenuSound:Class;
        [Embed(source="../data/Sounds_package.swf", symbol="start.wav")] public var StartSound:Class;
        [Embed(source="../data/Music_package.swf", symbol="title.wav")] public var TitleMusic:Class;

        private var _elapsed:Number = 0;
        private var _startFlashRate:Number = 8;
        private var _startText:String = "PUSH SPACE BUTTON";
        private var _t:FlxText;

        private var _startTimer:Number = -1;
        private var _startThreshold:Number = 1;

        private var _flickerTimer:Number = 0;
        private var _flickerThreshold:Number = 1;

        private var _title:TitleSprite;
        private var _player:Player;
        private var _background:BackgroundSprite;

        private var _started:Boolean = false;
        private var _flashing:Boolean = false;
        private var _spacePressed:Boolean = false;

        private var _startSoundInstance:FlxSound;

        private var _sparkles:FlxGroup;

        override public function create():void
        {
            FlxG.play(MenuSound);
            FlxG.playMusic(TitleMusic);
            FlxG.music.volume = 0.75;

            _background = new BackgroundSprite();
            add(_background);

            _player = new Player(116, 134);
            _player.mobile = false;
            _player.got_key = true;
            add(_player);
            
            _title = new TitleSprite();
            add(_title);

            //Add sparkles :3
            _sparkles = new FlxGroup();
            //Key
            var twinkle:TwinkleSprite = new TwinkleSprite(19, 9, 20);
            _sparkles.add(twinkle);
            //E
            twinkle = new TwinkleSprite(127, 63, 38);
            _sparkles.add(twinkle);
            //K
            twinkle = new TwinkleSprite(47, 51, 49);
            _sparkles.add(twinkle);
            //!
            twinkle = new TwinkleSprite(220, 53, 75);
            _sparkles.add(twinkle);
            //Y
            twinkle = new TwinkleSprite(146, 51, 92);
            _sparkles.add(twinkle);

            add(_sparkles);

            _t = new FlxText(0,186,256, "");
            _t.alignment = "center";
            _t.setFormat("NES");
            add(_t);

            FlxG.flash(0xffffffff, 0.25);
            FlxG.shake(0.01, 0.4);
        }

        override public function update():void
        {
            _elapsed += FlxG.elapsed;
            if(_elapsed >= _startFlashRate) {
                _t.text = _startText;
            }
            if(FlxG.keys.SPACE) {
                remove(_sparkles);
                FlxG.music.stop();
                FlxG.music.destroy();
                _t.text = _startText; //Just in case...
                _t.flicker(_flickerThreshold);
                remove(_title);
                if(!_flashing) {
                    _startSoundInstance = FlxG.play(StartSound);
                    var flashingTitle:FlashingTitleSprite = new FlashingTitleSprite();
                    add(flashingTitle);
                    _spacePressed = true;
                }
                _flashing = true;
            }

            if(_spacePressed) {
                if(!_startSoundInstance.active)
                    FlxG.switchState(new WalkRightState());
            }
            super.update();
		    //FlxG.switchState(new PlayState());
        }
    }
}
