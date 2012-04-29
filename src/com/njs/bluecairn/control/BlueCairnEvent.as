package com.njs.bluecairn.control
{
	import flash.events.Event;


	/**
	 * A Cairngorm-style event in pure AS3.
	 */
	public class BlueCairnEvent extends Event
	{
		// instance variables
		public var data : *;


		public function BlueCairnEvent (type : String, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super (type, bubbles, cancelable);
		}

	}
}
