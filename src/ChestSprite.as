package
{
    import org.flixel.*;

    public class ChestSprite extends FlxSprite
    {
        [Embed(source = "../data/chest.png")] private var ImgChest:Class;
        public function ChestSprite() {
            super(208, 136);
            loadGraphic(ImgChest, true, true, 16, 16);

            immovable = true;
        }
        
        override public function update():void {
        }
    }
}
