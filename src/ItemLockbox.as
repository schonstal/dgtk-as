package
{
    import org.flixel.*;

    public class ItemLockbox extends InventoryItem
    {
        [Embed(source = "../data/item_lockbox.png")] private var ImgLockbox:Class;

        public function ItemLockbox(slot:int) {
            super(slot);
            loadGraphic(ImgLockbox, true, true, 16, 16);
            description = "IT'S LOCKED. I NEED A KEY TO OPEN IT.";
            name = "LOCK BOX";
        }
    }
}
