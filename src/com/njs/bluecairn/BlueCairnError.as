package com.njs.bluecairn
{
	/**
	 * A Cairngorm-style error class in pure AS3.
	 */
	public final class BlueCairnError extends Error
	{
		public function BlueCairnError (message : String, data : * = null)
		{
			super (formatMessage (message, (data ? data.toString () : "")));
		}


		// helper methods

		private function formatMessage (message : String, data : String) : String
		{
			return "{BlueCairnError}: {" + (message ? message.replace ("{1}", data) : data) + "}";
		}

	}
}
