package
{
    import org.flixel.*;

    public class ControlsSprite extends FlxSprite
    {
        [Embed(source = "../data/controls.png")] private var ImgControls:Class;
        public function ControlsSprite() {
            super(0, 0);
            loadGraphic(ImgControls, true, true, 320, 240);
        }
    }
}
