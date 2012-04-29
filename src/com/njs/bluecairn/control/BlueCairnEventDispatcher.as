package com.njs.bluecairn.control
{
	import flash.events.EventDispatcher;
	import flash.events.IEventDispatcher;


	/**
	 * A Cairngorm-style event dispatcher in pure AS3.
	 */
	public final class BlueCairnEventDispatcher
	{
		// instance variables
		private static var instantiated : Boolean;
		private static var _instance : BlueCairnEventDispatcher;
		private var eventDispatcher : IEventDispatcher;


		public static function get instance () : BlueCairnEventDispatcher
		{
			if (_instance == null)
			{
				instantiated = true;
				_instance = new BlueCairnEventDispatcher ();
			}

			return _instance;
		}

		public function BlueCairnEventDispatcher (target : IEventDispatcher = null)
		{
			if (_instance != null || ! instantiated)
			{
				throw new Error ("BlueCairnEventDispatcher can only be accessed through BlueCairnEventDispatcher.instance");
			}

			eventDispatcher = new EventDispatcher (target);
		}


		// public methods

		public function addEventListener (type : String, listener : Function, useCapture : Boolean = false, priority : int = 0, useWeakReference : Boolean = false) : void
		{
			eventDispatcher.addEventListener (type, listener, useCapture, priority, useWeakReference);
		}

		public function removeEventListener (type : String, listener : Function, useCapture : Boolean = false) : void
		{
			eventDispatcher.removeEventListener (type, listener, useCapture);
		}

		public function dispatchEvent (event : BlueCairnEvent) : Boolean
		{
			return eventDispatcher.dispatchEvent (event);
		}

	}
}
