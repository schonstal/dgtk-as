package
{
    import org.flixel.*;

    public class ItemBinoculars extends InventoryItem
    {
        [Embed(source = "../data/item_binoculars.png")] private var ImgBinoculars:Class;

        public function ItemBinoculars(slot:int) {
            super(slot);
            loadGraphic(ImgBinoculars, true, true, 16, 16);
            description = "THE LENS COVERS ARE LOCKED IN PLACE";
        }
    }
}
