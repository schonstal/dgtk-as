package
{
    import org.flixel.*;

    public class ItemLocket extends InventoryItem
    {
        [Embed(source = "../data/item_locket.png")] private var ImgLocket:Class;

        public function ItemLocket(slot:int) {
            super(slot);
            loadGraphic(ImgLocket, true, true, 16, 16);
            description = "IT'S LOCKED SHUT";
            name = "LOCKET";
        }
    }
}
