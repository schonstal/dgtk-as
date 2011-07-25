package
{
    import org.flixel.*;

    public class TwinkleSprite extends FlxSprite
    {
        [Embed(source = "../data/twinkle.png")] private var ImgTwinkle:Class;
        public function TwinkleSprite(X:Number, Y:Number, Offset:Number) {
            super(X, Y);
            loadGraphic(ImgTwinkle, true, true, 16, 16);
            var animationList:Array = [];
            for(var i:int = 0; i < Offset; i++) {
                animationList.push(0);
            }
            animationList.push(1, 2, 3, 4, 4, 3, 2, 1);
            while(animationList.length < 100) {
                animationList.push(0);
            }
            addAnimation("sparkle", animationList, 10);
        }
        
        override public function update():void {
            play("sparkle");
        }
    }
}
