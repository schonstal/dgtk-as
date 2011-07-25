package
{
    import org.flixel.*;

    public class ItemLockPicks extends InventoryItem
    {
        [Embed(source = "../data/item_lockpicks.png")] private var ImgLockPicks:Class;

        public function ItemLockPicks(slot:int) {
            super(slot);
            loadGraphic(ImgLockPicks, true, true, 16, 16);
            description = "I DON'T HAVE ENOUGH SKILL TO USE THESE. I SHOULD JUST USE A KEY.";
            name = "LOCK PICKS";
        }
    }
}
