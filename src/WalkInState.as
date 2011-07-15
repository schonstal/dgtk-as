package
{
    import org.flixel.*;

    public class WalkInState extends FlxState
    {
        private var _startTimer:Number = 0;
        private var _startThreshold:Number = 1;

        private var _background:BackgroundSprite;
        private var _player:Player;

        override public function create():void
        {
            FlxG.flash(0xff000000, 1);

            _background = new BackgroundSprite();
            add(_background);

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
                _player.velocity.x = 0;
                _startTimer += FlxG.elapsed;
                if(_startTimer > _startThreshold)
                    FlxG.switchState(new MenuState());
            }
            super.update();
        }
    }
}
