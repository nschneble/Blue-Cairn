package com.njs.bluecairn.responders
{
	import com.njs.bluecairn.events.FaultEvent;
	import com.njs.bluecairn.events.ProgressEvent;
	import com.njs.bluecairn.events.ResultEvent;


	public class Responder implements IResponder
	{
		// instance variables
		private var result : Function;
		private var fault : Function;
		private var progress : Function;


		public function Responder (result : Function, fault : Function = null, progress : Function = null)
		{
			this.result = result;
			this.fault = fault;
			this.progress = progress;
		}


		// IResponder implementation

		public function onResult (event : ResultEvent) : void
		{
			if (result != null)
			{
				result (event.result);
			}
		}

		public function onFault (event : FaultEvent) : void
		{
			if (fault != null)
			{
				fault (event.fault);
			}
		}

		public function onProgress (event : ProgressEvent) : Boolean
		{
			var status : Boolean = false;

			if (progress != null)
			{
				status = progress (event.progress);
			}

			return status;
		}

	}
}
