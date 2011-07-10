package
{
	import org.flixel.*;
	[SWF(width="512", height="480", backgroundColor="#000000")]
	[Frame(factoryClass="Preloader")]

	public class dgtk extends FlxGame
	{
		public function dgtk()
		{
			super(256,240,MenuState,2);
		}
	}
}
