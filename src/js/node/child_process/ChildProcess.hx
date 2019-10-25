/*
 * Copyright (C)2014-2019 Haxe Foundation
 *
 * Permission is hereby granted, free of charge, to any person obtaining a
 * copy of this software and associated documentation files (the "Software"),
 * to deal in the Software without restriction, including without limitation
 * the rights to use, copy, modify, merge, publish, distribute, sublicense,
 * and/or sell copies of the Software, and to permit persons to whom the
 * Software is furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING
 * FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER
 * DEALINGS IN THE SOFTWARE.
 */

package js.node.child_process;

import js.node.events.EventEmitter;
import js.node.Stream;
import js.node.stream.Readable;
import js.node.stream.Writable;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by the `ChildProcess` objects.
**/
@:enum abstract ChildProcessEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'close'` event is emitted when the stdio streams of a child process have been closed.
		This is distinct from the `'exit'` event, since multiple processes might share the same stdio streams.

		@see https://nodejs.org/api/child_process.html#child_process_event_close
	**/
	var Close:ChildProcessEvent<Int->String->Void> = "close";

	/**
		The `'disconnect'` event is emitted after calling the `subprocess.disconnect()` method in parent process or
		`process.disconnect()` in child process.
		After disconnecting it is no longer possible to send or receive messages, and the `subprocess.connected`
		property is `false`.

		@see https://nodejs.org/api/child_process.html#child_process_event_disconnect
	**/
	var Disconnect:ChildProcessEvent<Void->Void> = "disconnect";

	/**
		The `'error'` event is emitted whenever:
		The `'exit'` event may or may not fire after an error has occurred.
		When listening to both the `'exit'` and `'error'` events, it is important to guard against accidentally invoking
		handler functions multiple times.

		@see https://nodejs.org/api/child_process.html#child_process_event_error
	**/
	var Error:ChildProcessEvent<Error->Void> = "error";

	/**
		The `'exit'` event is emitted after the child process ends.
		If the process exited, `code` is the final exit code of the process, otherwise `null`.
		If the process terminated due to receipt of a signal, `signal` is the string name of the signal, otherwise
		`null`.
		One of the two will always be non-null.

		@see https://nodejs.org/api/child_process.html#child_process_event_exit
	**/
	var Exit:ChildProcessEvent<Int->String->Void> = "exit";

	/**
		The `'message'` event is triggered when a child process uses `process.send()` to send messages.
		The resulting message might not be the same as what is originally sent.

		@see https://nodejs.org/api/child_process.html#child_process_event_message
	**/
	var Message:ChildProcessEvent<Dynamic->Dynamic->Void> = "message";
}

/**
	Instances of the `ChildProcess` represent spawned child processes.

	@see https://nodejs.org/api/child_process.html#child_process_class_childprocess
**/
extern class ChildProcess extends EventEmitter<ChildProcess> {
	/**
		The `subprocess.channel` property is a reference to the child's IPC channel.
		If no IPC channel currently exists, this property is `undefined`.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_channel
	**/
	var channel:Dynamic;

	/**
		The `subprocess.connected` property indicates whether it is still possible to send and receive messages from a
		child process.
		When subprocess.connected is false, it is no longer possible to send or receive messages.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_connected
	**/
	var connected:Bool;

	/**
		Closes the IPC channel between parent and child, allowing the child to exit gracefully once there are no other
		connections keeping it alive.
		After calling this method the `subprocess.connected` and `process.connected` properties in both the parent and
		child (respectively) will be set to `false`, and it will be no longer possible to pass messages between the
		processes.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_disconnect
	**/
	function disconnect():Void;

	/**
		The `subprocess.kill()` method sends a signal to the child process.
		If no argument is given, the process will be sent the `'SIGTERM'` signal.
		See `signal(7)` for a list of available signals.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_kill_signal
	**/
	@:overload(function(?signal:String):Void {})
	function kill(?signal:Int):Void;

	/**
		The `subprocess.killed` property indicates whether the child process successfully received a signal from
		`subprocess.kill()`.
		The `killed` property does not indicate that the child process has been terminated.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_killed
	**/
	var killed:Bool;

	/**
		Returns the process identifier (PID) of the child process.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_pid
	**/
	var pid:Int;

	/**
		Calling `subprocess.ref()` after making a call to `subprocess.unref()` will restore the removed reference count
		for the child process, forcing the parent to wait for the child to exit before exiting itself.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_ref
	**/
	function ref():Void;

	/**
		When an IPC channel has been established between the parent and child ( i.e. when using `child_process.fork()`),
		the `subprocess.send()` method can be used to send messages to the child process.
		When the child process is a Node.js instance, these messages can be received via the `'message'` event.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_send_message_sendhandle_options_callback
	**/
	function send(message:Dynamic, ?sendHandle:Dynamic, ?options:ChildProcessSendOptions, ?callback:Null<Error>->Void):Bool;

	/**
		A Readable Stream that represents the child process's `stderr`.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_stderr
	**/
	var stderr(default, null):Null<IReadable>;

	/**
		A Writable Stream that represents the child process's `stdin`.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_stdin
	**/
	var stdin(default, null):Null<IWritable>;

	/**
		A sparse array of pipes to the child process, corresponding with positions in the `stdio` option passed to
		`child_process.spawn()` that have been set to the value `'pipe'`.
		`subprocess.stdio[0]`, `subprocess.stdio[1]`, and `subprocess.stdio[2]` are also available as
		`subprocess.stdin`, `subprocess.stdout`, and `subprocess.stderr`, respectively.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_stdio
	**/
	var stdio(default, null):Array<IStream>;

	/**
		A Readable Stream that represents the child process's `stdout`.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_stdout
	**/
	var stdout(default, null):Null<IReadable>;

	/**
		By default, the parent will wait for the detached child to exit.
		To prevent the parent from waiting for a given `subprocess` to exit, use the `subprocess.unref()` method.
		Doing so will cause the parent's event loop to not include the child in its reference count, allowing the parent
		to exit independently of the child, unless there is an established IPC channel between the child and the parent.

		@see https://nodejs.org/api/child_process.html#child_process_subprocess_unref
	**/
	function unref():Void;
}

/**
	Options for the `ChildProcess.send` method.
**/
typedef ChildProcessSendOptions = {
	/**
		A value that can be used when passing instances of `net.Socket`.
		When `true`, the socket is kept open in the sending process.

		Default: `false`.
	**/
	@:optional var keepOpen:Bool;
}
