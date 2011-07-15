package
{
    import org.flixel.*;

    public class WalkRightState extends FlxState
    {
        private var _startTimer:Number = 0;
        private var _startThreshold:Number = 0.5;

        private var _player:Player;
        private var _background:BackgroundSprite;

        override public function create():void
        {
            _background = new BackgroundSprite();
            add(_background);

            _player = new Player(128, 136);
            _player.automated = true;
            _player.heading = FlxObject.RIGHT;
            _player.velocity.x = _player.move_speed;
            _player.mobile = false;
            add(_player);
        }

        override public function update():void
        {
            if(_player.x >= 208) {
                remove(_player);
                _startTimer += FlxG.elapsed;
                if(_startTimer > _startThreshold) {
                    _background.velocity.x = -170;
                }
            }

            if(_background.x <= -256) {
                _background.velocity.x = 0;
                FlxG.switchState(new DoorCloseState());
            }
            super.update();
        }
    }
}
