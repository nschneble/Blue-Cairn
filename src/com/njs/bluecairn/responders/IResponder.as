package com.njs.bluecairn.responders
{
	import com.njs.bluecairn.events.FaultEvent;
	import com.njs.bluecairn.events.ProgressEvent;
	import com.njs.bluecairn.events.ResultEvent;


	public interface IResponder
	{
		function onResult (event : ResultEvent) : void;
		function onFault (event : FaultEvent) : void;
		function onProgress (event : ProgressEvent) : Boolean;

	}
}
