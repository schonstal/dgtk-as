package
{
    import org.flixel.*;

    public class ItemPadLock extends InventoryItem
    {
        [Embed(source = "../data/item_padlock.png")] private var ImgPadLock:Class;

        public function ItemPadLock(slot:int) {
            super(slot);
            loadGraphic(ImgPadLock, true, true, 16, 16);
            description = "YOU NEED AT LEAST ONE KEY TO USE THIS";
            name = "PAD LOCK";
        }
    }
}
