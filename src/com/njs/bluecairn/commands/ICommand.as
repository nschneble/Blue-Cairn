package com.njs.bluecairn.commands
{
	import com.njs.bluecairn.control.BlueCairnEvent;


	/**
	 * A Cairngorm-style command interface in pure AS3.
	 */
	public interface ICommand
	{
		// public methods
		function execute (event : BlueCairnEvent) : void;

	}
}
