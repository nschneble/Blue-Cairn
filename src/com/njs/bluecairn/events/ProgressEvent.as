package com.njs.bluecairn.events
{
	import flash.events.Event;


	public class ProgressEvent extends Event
	{
		// constants
		public static const PROGRESS : String = "com.njs.bluecairn.events.ProgressEvent.progress";


		// instance variables
		public var progress : *;


		public function ProgressEvent (type : String, progress : * = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super (type, bubbles, cancelable);

			this.progress = progress;
		}

	}
}
