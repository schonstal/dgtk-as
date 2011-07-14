package
{
    import org.flixel.*;

    public class LogoSprite extends FlxSprite
    {
        [Embed(source = "../data/logo.png")] private var ImgLogo:Class;
        public function LogoSprite() {
            super(0, 0);
            loadGraphic(ImgLogo, true, true, 256, 240);
        }
    }
}
