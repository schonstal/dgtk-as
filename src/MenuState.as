package
{
    import org.flixel.*;

    public class MenuState extends FlxState
    {
        override public function create():void
        {
            var t:FlxText = new FlxText(0,FlxG.height-40,256,"PUSH START BUTTON");
            t.alignment = "center";
            t.setFormat("NES");
            add(t);
        }

        override public function update():void
        {
            super.update();

		    //FlxG.switchState(new PlayState());
        }
    }
}
