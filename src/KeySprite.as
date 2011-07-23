package
{
    import org.flixel.*;

    public class KeySprite extends FlxSprite
    {
        [Embed(source='../data/key.png')] private var ImgKey:Class;
        [Embed(source="../data/Sounds_package.swf", symbol="pickup_key.wav")] public var Ding:Class;

        public var floating:Boolean = true;

        private var _player:Player;
        private var _frame:uint;
        private var _elapsed:Number = 0;
        
        public const VELOCITY:Number = 0.5;
        
        public function KeySprite(X:Number, Y:Number, ThePlayer:Player):void {
            super(X+4,Y+10);
            _player = ThePlayer;
            loadGraphic(ImgKey, true, true, 16, 16);
            width = 8;
            height = 6;
            offset.x = 4;
            offset.y = 10;
        }

        override public function update():void {
            _elapsed += FlxG.elapsed;

            if (_elapsed >= VELOCITY && floating) {
                if (_frame <= 1)
                    y++;
                else if (_frame <= 3)
                    y--;

                _frame = (_frame + 1) % 4;
                _elapsed = 0;
            }

            if(overlaps(_player)) {
                FlxG.play(Ding);
                FlxG.switchState(new GameOverState());
            }
        }
    }
}
