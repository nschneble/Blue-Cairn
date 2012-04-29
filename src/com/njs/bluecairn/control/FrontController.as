package com.njs.bluecairn.control
{
	import com.njs.bluecairn.BlueCairnError;
	import com.njs.bluecairn.BlueCairnMessages;
	import com.njs.bluecairn.commands.ICommand;
	
	import flash.utils.Dictionary;


	/**
	 * A Cairngorm-style front controller in pure AS3.
	 */
	public class FrontController
	{
		// instance variables
		protected var commands : Dictionary;


		public function FrontController ()
		{
			init ();
		}

		private function init () : void
		{
			commands = new Dictionary ();
		}


		// public methods

		/**
		 * Registers an ICommand class with the front controller against
		 * an event name and listens for events with that name.
		 * 
		 * @param commandName the name of the event that will be broadcast
		 * @param command an ICommand class reference upon which execute()
		 *     can be called when the front controller hears an event
		 *     broadcast with commandName
		 * @param useWeakReference indicates whether the command should be
		 *     added as a weak reference to the BlueCairnEventDispatcher
		 */
		public function addCommand (commandName : String, commandReference : Class, useWeakReference : Boolean = true) : void
		{
			if (commandName == null)
			{
				throw new BlueCairnError (BlueCairnMessages.NULL_COMMAND_NAME);
			}

			if (commandReference == null)
			{
				throw new BlueCairnError (BlueCairnMessages.NULL_COMMAND_REFERENCE);
			}

			if (commands [commandName] != null)
			{
				throw new BlueCairnError (BlueCairnMessages.COMMAND_ALREADY_REGISTERED, commandName);
			}

			if (! implementsICommand (commandReference))
			{
				throw new BlueCairnError (BlueCairnMessages.COMMAND_SHOULD_IMPLEMENT_ICOMMAND, commandReference);
			}

			commands [commandName] = commandReference;
			BlueCairnEventDispatcher.instance.addEventListener (commandName, executeCommand, false, 0, useWeakReference);
		}

		public function removeCommand (commandName : String) : void
		{
			if (commandName == null)
			{
				throw new BlueCairnError (BlueCairnMessages.NULL_COMMAND_NAME);
			}

			if (commands [commandName] === undefined)
			{
				throw new BlueCairnError (BlueCairnMessages.COMMAND_NOT_REGISTERED, commandName);
			}

			BlueCairnEventDispatcher.instance.removeEventListener (commandName, executeCommand);

			commands [commandName] = undefined;
			delete commands [commandName];
		}


		// helper methods

		protected function executeCommand (event : BlueCairnEvent) : void
		{
			var Command : Class = getCommand (event.type);
			var command : ICommand = new Command ();

			command.execute (event);
		}

		protected function getCommand (commandName : String) : Class
		{
			var command : Class = commands [commandName];

			if (command == null)
			{
				throw new BlueCairnError (BlueCairnMessages.COMMAND_NOT_FOUND, commandName);
			}

			return command;
		}

		private function implementsICommand (commandReference : Class) : Boolean
		{
			return (new commandReference () is ICommand);
		}

	}
}
