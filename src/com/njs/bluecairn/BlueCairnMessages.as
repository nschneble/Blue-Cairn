package com.njs.bluecairn
{
	/**
	 * A Cairngorm-style messages class in pure AS3.
	 */
	public final class BlueCairnMessages
	{
		// constants
		public static const NULL_COMMAND_NAME : String = "The command name cannot be null";
		public static const NULL_COMMAND_REFERENCE : String = "The command class reference cannot be null";
		public static const COMMAND_ALREADY_REGISTERED : String = "The following command has already been registered: \"{1}\"";
		public static const COMMAND_NOT_REGISTERED : String = "The following command has not been registered: \"{1}\"";
		public static const COMMAND_SHOULD_IMPLEMENT_ICOMMAND : String = "The following command class should implement ICommand: \"{1}\"";
		public static const COMMAND_NOT_FOUND : String = "The following command could not be found: \"{1}\"";

	}
}
