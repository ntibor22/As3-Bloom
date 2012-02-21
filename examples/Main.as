package 
{

import bloom.themes.defaultTheme.DefaultTheme;

import flash.display.Sprite;
	import flash.events.Event;
	
	import bloom.control.BloomCore;
	import bloom.components.*;

import flash.events.MouseEvent;

/**
	 * Example
	 */
	public class Main extends Sprite {
		
		public function Main():void {
			if (stage) init();
			else addEventListener(Event.ADDED_TO_STAGE, init);
		}
		
		private function init(e:Event = null):void {
			removeEventListener(Event.ADDED_TO_STAGE, init);
			stage.showDefaultContextMenu = false;
			stage.scaleMode = "noScale";
			stage.align = "TL";
			
			BloomCore.init(stage , new DefaultTheme());
			
			var fCont:ScrollContainer = new ScrollContainer ();
			fCont.margin.reset ( 2 , 10 , 2 , 10 );
			fCont.setScrollBar(true, true);
			
			var window:Window = new Window ( this , fCont );
			window.size ( 600 , 300 );
			window.move ( 20 , 20 );
			window.maxWidth = 720;
			window.maxHeight = 565;
			window.minWidth = 200;
			window.minHeight = 200;
			window.liveResize = true;
			
			var label:Label = new Label(null, "Label");
			fCont.addContent(label);
			
			var buttonBase:ButtonBase = new ButtonBase(this);
			buttonBase.y = 20;
			buttonBase.onDown.add(function(e:MouseEvent){trace("onDown - " + buttonBase.toString())});
			fCont.addContent(buttonBase);
			
			var button:Button = new Button(this, "Button");
			button.y = 50;
			button.onDown.add(function(e:MouseEvent){trace("onDown - " + button.toString())});
			fCont.addContent(button);
			
			var slide:Slider = new Slider();
			fCont.addContent(slide);
			
			var checkBox:CheckBox = new CheckBox(this, "CheckBox");
			checkBox.y = 80;
			checkBox.onChanged.add(function(e:Boolean){trace("onChanged value - " + e + " - " + checkBox.toString())});
			fCont.addContent(checkBox);
			
			var cbg:CheckBoxGroup = new CheckBoxGroup( -1);
			
			checkBox = new CheckBox(this, "RadioBox 0");
			checkBox.y = 100;
			cbg.addChild(checkBox);
			checkBox.onChanged.add(function(e:Boolean){trace("onChanged value - " + e + " - " + checkBox.toString())});
			fCont.addContent(checkBox);
			
			checkBox = new CheckBox(this, "RadioBox 1");
			checkBox.y = 120;
			cbg.addChild(checkBox);
			checkBox.onChanged.add(function(e:Boolean){trace("onChanged value - " + e + " - " + checkBox.toString())});
			fCont.addContent(checkBox);
			
			checkBox = new CheckBox(this, "RadioBox 2");
			checkBox.y = 140;
			cbg.addChild(checkBox);
			checkBox.onChanged.add(function(e:Boolean){trace("onChanged value - " + e + " - " + checkBox.toString())});
			fCont.addContent(checkBox);
			cbg.index = 0;
			
			var textInput:TextInput = new TextInput(this, "TextInput");
			textInput.y = 160;
			fCont.addContent(textInput);
			
			var numericStepper:NumericStepper = new NumericStepper(this);
			numericStepper.y = 180;
			numericStepper.onChanged.add(function(e:Number){trace("onChanged value - " + e + " - " + numericStepper.toString())});
			fCont.addContent(numericStepper);
			
			var progressBar:ProgressBar = new ProgressBar(this, 50);
			progressBar.y = 200;
			progressBar.onChanged.add(function(e:int){trace("onChanged value - " + e + " - " + progressBar.toString())});
			fCont.addContent(progressBar);
		}
		
	}
	
}