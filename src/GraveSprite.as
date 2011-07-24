package
{
    import org.flixel.*;

    public class GraveSprite extends FlxSprite
    {
        [Embed(source='../data/gravestone.png')] private var ImgGrave:Class;

        public function GraveSprite(X:Number, Y:Number):void {
            super(X,Y);
            loadGraphic(ImgGrave, true, true, 32, 32);
        }
    }
}
