package
{
    import org.flixel.*;

    public class DoorSprite extends FlxSprite
    {
        [Embed(source = "../data/door.png")] private var ImgDoor:Class;
        public function DoorSprite() {
            super(16, 128);
            loadGraphic(ImgDoor, true, true, 16, 32);

            addAnimation("close", [0, 1], 15, false);
            addAnimation("closed", [1], 15, false);

            play("close");
        }
        
        override public function update():void {
        }
    }
}
