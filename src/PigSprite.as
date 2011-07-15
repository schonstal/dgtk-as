package
{
    import org.flixel.*;

    public class PigSprite extends FlxSprite
    {
        [Embed(source = "../data/PIGSLogo.png")] private var ImgLogo:Class;
        public function PigSprite() {
            super(0, 0);
            loadGraphic(ImgLogo, true, true, 256, 240);
        }
    }
}
