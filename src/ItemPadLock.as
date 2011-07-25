package
{
    import org.flixel.*;

    public class ItemPadLock extends InventoryItem
    {
        [Embed(source = "../data/item_padlock.png")] private var ImgPadLock:Class;

        public function ItemPadLock(slot:int) {
            super(slot);
            loadGraphic(ImgPadLock, true, true, 16, 16);
            description = "I CAN'T USE THIS UNLESS I HAVE A KEY.";
            name = "PAD LOCK";
        }
    }
}
