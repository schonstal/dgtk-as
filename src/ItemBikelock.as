package
{
    import org.flixel.*;

    public class ItemBikelock extends InventoryItem
    {
        [Embed(source = "../data/item_bikelock.png")] private var ImgBikelock:Class;

        public function ItemBikelock(slot:int) {
            super(slot);
            loadGraphic(ImgBikelock, true, true, 16, 16);
            description = "WON'T OPEN WITHOUT A KEY";
            name = "BIKE LOCK";
        }
    }
}
