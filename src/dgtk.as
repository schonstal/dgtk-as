package
{
	import org.flixel.*;
	[SWF(width="512", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class dgtk extends FlxGame
	{
        [Embed(source = '../data/PressStart2P.ttf', fontFamily="NES", embedAsCFF="false")] public var PressStartFont:String;
		public function dgtk()
		{
			super(256,240,LogoState,2);
            //super(256,240,PlayState,2);
		}
	}
}
