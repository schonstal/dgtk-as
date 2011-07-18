package
{
    import org.flixel.*;

    public class InventoryItem extends FlxSprite
    {
        public var description:String;
        public var name:String;

        public function InventoryItem(slot:int) {
            super(24 + ((slot%4)*32), (slot>=4?80:48));
        }
    }
}
