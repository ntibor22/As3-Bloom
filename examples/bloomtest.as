package {

import bloom.components.Button;
import bloom.components.Label;
import bloom.containers.FlowContainer;
import bloom.containers.Window;
import bloom.core.Bloom;
import bloom.core.ComponentReg;
import bloom.themes.darkTheme.DarkButtonModel;
import bloom.themes.darkTheme.DarkTheme;
import bloom.themes.defaultTheme.DefaultTheme;

import flash.display.Sprite;
import flash.display.StageAlign;
import flash.display.StageScaleMode;
import flash.events.MouseEvent;

public class bloomtest extends Sprite {

	public function bloomtest () {
		stage.align = StageAlign.TOP_LEFT;
		stage.scaleMode = StageScaleMode.NO_SCALE;
		stage.showDefaultContextMenu = false;

		Bloom.core ().init ( stage , new DefaultTheme () , true );
		Bloom.core().registerComponents = true;

		var cont:FlowContainer = new FlowContainer ( this );
		cont.size ( 300 , 350 );
		cont.registerComponent = false;
		cont.direction = FlowContainer.GRID;

		var defaulttheme:Button = new Button ( cont , "Set Default" );
		defaulttheme.addEventListener ( MouseEvent.MOUSE_DOWN , _changeToDefaultTheme );

		var darktheme:Button = new Button ( cont , "Set Dark" );
		darktheme.addEventListener ( MouseEvent.MOUSE_DOWN , _changeToDarkTheme );
		

		
		var disablebtn:Button = new Button ( cont , "Disable" );
		disablebtn.registerComponent = false;
		disablebtn.addEventListener ( MouseEvent.MOUSE_DOWN , _disableComps );
		
		
		
		var darktheme:Button = new Button ( cont , "Dark and wide Always" );
		darktheme.width = 180;
		darktheme.model = new DarkButtonModel ();

		for ( var i:int = 0 ; i < 6 ; i ++ ) {
			var btn:Button = new Button ( cont , "Button " + i + " :)" );
		}

		
		var _altReg = Bloom.core().newCompRegistry("alt");
		
		for ( var i:int = 0 ; i < 6 ; i ++ ) {
			_altReg.registerComponent ( new Button ( cont , "alt reg " + i + " :)" ) );
		}

		var defaulttheme:Button = new Button ( cont , "Alt Default" );
		defaulttheme.addEventListener ( MouseEvent.MOUSE_DOWN , _changealtToDefaultTheme );

		var darktheme:Button = new Button ( cont , "Alt Dark" );
		darktheme.addEventListener ( MouseEvent.MOUSE_DOWN , _changealtToDarkTheme );
		
	}

	private function _disableComps ( event:MouseEvent ):void {
		Bloom.core().componentRegistry.disableComponents();
	}

	private function _changealtToDarkTheme ( event:MouseEvent ):void {
		var _altReg = Bloom.core().getCompRegistry("alt");
		_altReg.setTheme ( new DarkTheme () );
		_altReg.disableComponents();
	}

	private function _changealtToDefaultTheme ( event:MouseEvent ):void {
		var _altReg = Bloom.core().getCompRegistry("alt");
		_altReg.setTheme ( new DefaultTheme () );
		_altReg.disableComponents(true);
	}

	private function _changeToDarkTheme ( event:MouseEvent ):void {
		Bloom.core ().setTheme ( new DarkTheme () );
	}

	private function _changeToDefaultTheme ( event:MouseEvent ):void {
		Bloom.core ().setTheme ( new DefaultTheme () );
	}

}
}
