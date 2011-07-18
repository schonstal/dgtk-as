package
{
    import org.flixel.*;

    public class ItemLockOfHair extends InventoryItem
    {
        [Embed(source = "../data/item_lockofhair.png")] private var ImgLockOfHair:Class;

        public function ItemLockOfHair(slot:int) {
            super(slot);
            loadGraphic(ImgLockOfHair, true, true, 16, 16);
            description = "IT'S A PUN";
            name = "HAIR LOCK";
        }
    }
}
