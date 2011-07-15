package
{
    import org.flixel.*;

    public class DoorSprite extends FlxSprite
    {
        [Embed(source = "../data/door.png")] private var ImgDoor:Class;
        public function DoorSprite() {
            super(0, 0);
            loadGraphic(ImgDoor, true, true, 16, 32);
            addAnimation("close", [0, 1, 1], 15, false);
        }
        
        override public function update():void {
            play("close");
        }
    }
}
