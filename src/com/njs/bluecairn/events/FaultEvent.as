package com.njs.bluecairn.events
{
	import flash.events.Event;


	public class FaultEvent extends Event
	{
		// constants
		public static const FAULT : String = "com.njs.bluecairn.events.FaultEvent.fault";


		// instance variables
		public var fault : *;


		public function FaultEvent (type : String, fault : * = null, bubbles : Boolean = false, cancelable : Boolean = false)
		{
			super (type, bubbles, cancelable);

			this.fault = fault;
		}

	}
}
