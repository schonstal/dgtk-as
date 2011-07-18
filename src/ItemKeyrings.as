package
{
    import org.flixel.*;

    public class ItemKeyrings extends InventoryItem
    {
        [Embed(source = "../data/item_keyrings.png")] private var ImgKeyrings:Class;

        public function ItemKeyrings(slot:int) {
            super(slot);
            loadGraphic(ImgKeyrings, true, true, 16, 16);
            description = "YOU DON'T HAVE ANY KEYS";
            name = "KEY RINGS";
        }
    }
}
