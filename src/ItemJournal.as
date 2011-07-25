package
{
    import org.flixel.*;

    public class ItemJournal extends InventoryItem
    {
        [Embed(source = "../data/item_journal.png")] private var ImgJournal:Class;

        public function ItemJournal(slot:int) {
            super(slot);
            loadGraphic(ImgJournal, true, true, 16, 16);
            description = "IT WON'T OPEN WITHOUT A KEY.";
            name = "JOURNAL";
        }
    }
}
