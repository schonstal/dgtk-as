package
{
    import org.flixel.*;

    public class KeySprite extends FlxSprite
    {
        [Embed(source='../data/key.png')] private var ImgKey:Class;

        public var floating:Boolean = true;

        private var _player:Player;
        private var _frame:uint;
        private var _elapsed:Number = 0;
        
        public const VELOCITY:Number = 0.5;
        
        public function KeySprite(X:Number, Y:Number, ThePlayer:Player):void {
            super(X+6,Y+4);
            _player = ThePlayer;
            loadGraphic(ImgKey, true, true, 16, 16);
            width = 4;
            height = 8;
            offset.x = 6;
            offset.y = 4;
        }

        override public function update():void {
            _elapsed += FlxG.elapsed;

            if (_elapsed >= VELOCITY) {
                if (_frame <= 1)
                    y++;
                else if (_frame <= 3)
                    y--;

                _frame = (_frame + 1) % 4;
                _elapsed = 0;
            }

            if(overlaps(_player)) {
                FlxG.switchState(new GameOverState());
            }
        }
    }
}
