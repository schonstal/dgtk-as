package
{
    import org.flixel.*;

    public class ItemRope extends InventoryItem
    {
        [Embed(source = "../data/item_rope.png")] private var ImgRope:Class;

        public function ItemRope(slot:int) {
            super(slot);
            loadGraphic(ImgRope, true, true, 16, 16);
            description = "IT'S LOCKED";
            name = "ROPE";
        }
    }
}
