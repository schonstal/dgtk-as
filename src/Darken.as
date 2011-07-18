package
{
    import org.flixel.*;

    public class Darken extends FlxSprite
    {
        public function Darken() {
            super(0,56);
            makeGraphic(256, 184, 0xff000000);
            blend = "overlay";
        }
        
        override public function update():void {
            super.update();
        }
    }
}
