package
{
    import org.flixel.*;

    public class TitleSprite extends FlxSprite
    {
        [Embed(source = "../data/title.png")] private var ImgTitle:Class;
        public function TitleSprite() {
            super(0, 0);
            loadGraphic(ImgTitle, true, true, 256, 128);
            var animationList:Array = [];
            for(var i:int = 0; i < 30; i++) {
                animationList.push(0);
            }
            for(var j:int = 1; j <= 10; j++) {
                animationList.push(j);
            }
            addAnimation("glow", animationList, 10);
            addAnimation("flash", [0, 14], 15);
        }
        
        override public function update():void {
            play("glow");
        }
    }
}
