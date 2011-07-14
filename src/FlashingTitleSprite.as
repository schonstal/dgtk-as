package
{
    import org.flixel.*;

    public class FlashingTitleSprite extends FlxSprite
    {
        [Embed(source = "../data/title_flash.png")] private var ImgFlashingTitle:Class;
        public function FlashingTitleSprite() {
            super(0, 0);
            loadGraphic(ImgFlashingTitle, true, true, 256, 128);
            addAnimation("flash", [0]);
        }
        
        override public function update():void {
            play("flash");
            flicker();
        }
    }
}
