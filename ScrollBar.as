﻿package com.leebrimelow.ui
{
	import flash.display.*;
	import flash.events.*;
	
	// maske some changes on branch_error
	
	public class ScrollBar extends MovieClip
	{
		private var yOffset:Number;
		private var yMin:Number;
		private var yMax:Number;
		private var test:String;
		
		public function ScrollBar():void
		{
			yMin = 0;
			yMax = track.height - thumb.height;
			thumb.addEventListener(MouseEvent.MOUSE_DOWN, thumbDown);
			stage.addEventListener(MouseEvent.MOUSE_UP, thumbUp);
		}
		
		private function thumbDown(e:MouseEvent):void
		{
			stage.addEventListener(MouseEvent.MOUSE_MOVE, thumbMove);
			yOffset = mouseY - thumb.y;
		}

		private function thumbUp(e:MouseEvent):void
		{
			stage.removeEventListener(MouseEvent.MOUSE_MOVE, thumbMove);
		}

		private function thumbMove(e:MouseEvent):void
		{
			thumb.y = mouseY - yOffset;
			if(thumb.y <= yMin)
				thumb.y = yMin;
			if(thumb.y >= yMax)
				thumb.y = yMax;
			dispatchEvent(new ScrollBarEvent(thumb.y / yMax));
			e.updateAfterEvent();
		}
	}
}
