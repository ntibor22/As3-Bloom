package bloom.themes.defaultTheme {

import bloom.brush.ColorBrush;
import bloom.components.Container;
import bloom.style.ContainerStyle;

public class DefaultContainerStyle extends ContainerStyle {
	
	public function DefaultContainerStyle () {
		
		var data:Vector.<uint> = new Vector.<uint> ( 1 , true );
		data[Container.NORMAL] = 0x666983;
		backgroundBrush = new ColorBrush( data );
		
	}
	
	///////////////////////////////////
	// toString
	///////////////////////////////////
	
	override public function toString():String {
		return "[bloom.style.default.DefaultContainerStyle]";
	}
	
}
}
