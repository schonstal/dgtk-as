package
{
    import org.flixel.*;

    public class BlackBarSprite extends FlxSprite
    {
        [Embed(source = "../data/swipe.png")] private var ImgBar:Class;
        private var _move:Boolean = false;
        private var _direction:Boolean = false; //false:Right, true:Left
        private var _velocity:Number = 85;

        public function BlackBarSprite(X:Number, Y:Number) {
            super(X, Y);
            loadGraphic(ImgBar, true, true, 138, 192);
        }
        
        override public function update():void {
            if(_move) {
                if (_direction) {
                    if(x > 128)
                        x -= FlxG.elapsed * _velocity; 
                    else
                        x = 128;
                } else {
                    if(x < 0)
                        x += FlxG.elapsed * _velocity;
                    else
                        x = 0;
                }
            }
        }

        public function swipe(goLeft:Boolean):void {
            _move = true;
            _direction = goLeft;
        }
    }
}
