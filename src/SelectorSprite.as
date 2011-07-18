package
{
    import org.flixel.*;

    public class SelectorSprite extends FlxSprite
    {
        public var slot:int = 0;

        [Embed(source = "../data/selector.png")] private var ImgSelector:Class;
        public function SelectorSprite() {
            super(16, 40);
            loadGraphic(ImgSelector, true, true, 32, 32);
        }
        
        override public function update():void {
            x = 16 + ((slot%4)*32);
            if(slot >= 4)
                y = 72;
            else
                y = 40;
        }
    }
}
