package
{
    import org.flixel.*;

    public class KeyShadowSprite extends FlxSprite
    {
        [Embed(source='../data/key_shadow.png')] private var ImgShadow:Class;

        public function KeyShadowSprite(X:Number, Y:Number):void {
            super(X,Y);
            loadGraphic(ImgShadow, true, true, 16, 16);
        }
    }
}
