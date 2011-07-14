package
{
    import org.flixel.*;

    public class BackgroundSprite extends FlxSprite
    {
        [Embed(source = "../data/background.png")] private var ImgBackground:Class;
        public function BackgroundSprite(X:Number = 0, Y:Number = -184) {
            super(X, Y);
            loadGraphic(ImgBackground, true, true, 512, 424);
        }
    }
}
