package
{
    import org.flixel.*;

    public class BlackBarGroup extends FlxGroup
    {
        private var _barLeft:BlackBarSprite;
        private var _barRight:BlackBarSprite;

        public function BlackBarGroup() {
            _barLeft = new BlackBarSprite(-128, 48);
            add(_barLeft);
            _barRight = new BlackBarSprite(256, 48);
            add(_barRight);
        }
        
        override public function update():void {
        }

        public function swipe():void {
            _barRight.swipe(true);
            _barLeft.swipe(false);
        }
    }
}
