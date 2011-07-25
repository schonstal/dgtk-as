package
{
    import org.flixel.*;

    public class ItemGoldpouch extends InventoryItem
    {
        [Embed(source = "../data/item_goldpouch.png")] private var ImgGoldpouch:Class;

        public function ItemGoldpouch(slot:int) {
            super(slot);
            loadGraphic(ImgGoldpouch, true, true, 16, 16);
            description = "I CAN'T OPEN THIS WITHOUT A KEY.";
            name = "GOLD POUCH";
        }
    }
}
