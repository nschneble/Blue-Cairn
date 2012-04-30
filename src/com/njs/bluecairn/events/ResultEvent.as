package com.njs.bluecairn.events
{
	import flash.events.Event;


	public class ResultEvent extends Event
	{
		// constants
		public static const RESULT : String = "com.njs.bluecairn.events.ResultEvent.result";


		// instance variables
		public var result : *;


		public function ResultEvent (type : String, result : * = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super (type, bubbles, cancelable);

			this.result = result;
		}

	}
}
