package bloom.components 
{
	import flash.display.DisplayObjectContainer;
	import flash.text.TextFieldAutoSize;
	import flash.text.TextFieldType;
	
	import bloom.control.ThemeBase;
	import bloom.core.TextBase;
	
	/**
	 * Label
	 */
	public class Label extends TextBase {
		
		public function Label(p:DisplayObjectContainer = null, text:String = "") {
			super(p);
			
			type = TextFieldType.DYNAMIC;
			autoSize = TextFieldAutoSize.LEFT;
			
			selectable = mouseEnabled = tabEnabled = false;
			
			this.text = text;
			
			style = ThemeBase.theme.label;
			ThemeBase.onThemeChanged.add(onThemeChanged);
		}
		
		override public function destroy():void {
			super.destroy();
			ThemeBase.onThemeChanged.remove(onThemeChanged);
		}
		
		protected function onThemeChanged():void {
			style = ThemeBase.theme.label;
		}
		
		///////////////////////////////////
		// toString
		///////////////////////////////////
		
		override public function toString():String {
			return "[bloom.components.Label]";
		}
		
	}

}