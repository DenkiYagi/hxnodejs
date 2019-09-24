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

package js.node;

import haxe.DynamicAccess;
import haxe.extern.EitherType;
import haxe.extern.Rest;
import js.node.events.EventEmitter;
import js.node.net.Server;
import js.node.net.Socket;
import js.node.stream.Readable;
import js.node.stream.Writable;
import js.node.child_process.ChildProcess.ChildProcessSendOptions;
#if haxe4
import js.lib.Error;
import js.lib.Promise;
import js.lib.Set;
#else
import js.Error;
import js.Promise;
#end

/**
	Enumeration of events emitted by the `Process` class.
**/
@:enum abstract ProcessEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'beforeExit'` is emitted when Node.js empties its event loop and has no additional work to schedule.

		@see https://nodejs.org/api/process.html#process_event_beforeexit
	**/
	var BeforeExit:ProcessEvent<Int->Void> = "beforeExit";

	/**
		If the Node.js process is spawned with an IPC channel (see the `ChildProcess` and `Cluster` documentation), the
		`'disconnect'` event will be emitted when the IPC channel is closed.

		@see https://nodejs.org/api/process.html#process_event_disconnect
	**/
	var Disconnect:ProcessEvent<Void->Void> = "disconnect";

	/**
		The `'exit'` event is emitted when the Node.js process is about to exit.

		@see https://nodejs.org/api/process.html#process_event_exit
	**/
	var Exit:ProcessEvent<Int->Void> = "exit";

	/**
		If the Node.js process is spawned with an IPC channel (see the Child Process and Cluster documentation), the
		`'message'` event is emitted whenever a message sent by a parent process using `childprocess.send()` is received
		by the child process.

		@see https://nodejs.org/api/process.html#process_event_message
	**/
	var Message:ProcessEvent<Dynamic->EitherType<Server, Socket>->Void> = "message";

	/**
		The `'multipleResolves'` event is emitted whenever a `Promise` has been either:

		@see https://nodejs.org/api/process.html#process_event_multipleresolves
	**/
	var MultipleResolves:ProcessEvent<String->Promise<Dynamic>->Dynamic->Void> = "multipleResolves";

	/**
		The `'rejectionHandled'` event is emitted whenever a `Promise` has been rejected and an error handler was
		attached to it (using `Promise.catchError`, for example) later than one turn of the Node.js event loop.

		@see https://nodejs.org/api/process.html#process_event_rejectionhandled
	**/
	var RejectionHandled:ProcessEvent<Promise<Dynamic>->Void> = "rejectionHandled";

	/**
		The `'uncaughtException'` event is emitted when an uncaught JavaScript exception bubbles all the way back to the
		event loop.

		@see https://nodejs.org/api/process.html#process_event_uncaughtexception
	**/
	var UncaughtException:ProcessEvent<Error->String->Void> = "uncaughtException";

	/**
		The `'unhandledRejection'` event is emitted whenever a `Promise` is rejected and no error handler is attached to
		the promise within a turn of the event loop.

		@see https://nodejs.org/api/process.html#process_event_unhandledrejection
	**/
	var UnhandledRejection:ProcessEvent<EitherType<Error, Dynamic>->Promise<Dynamic>->Void> = "unhandledRejection";

	/**
		The `'warning'` event is emitted whenever Node.js emits a process warning.

		@see https://nodejs.org/api/process.html#process_event_warning
	**/
	var Warning:ProcessEvent<ProcessWarningEvent->Void> = "warning";
}

/**
	Options object used by `ProcessEvent.Warning`.
**/
typedef ProcessWarningEvent = {
	/**
		The name of the warning.

		Default: `'Warning'`.
	**/
	var name:String;

	/**
		A system-provided description of the warning.
	**/
	var message:String;

	/**
		A stack trace to the location in the code where the warning was issued
	**/
	var stack:String;
}

/**
	The `process` object is a `global` that provides information about, and control over, the current Node.js process.

	@see https://nodejs.org/api/process.html#process_process
**/
extern class Process extends EventEmitter<Process> {
	/**
		The `process.abort()` method causes the Node.js process to exit immediately and generate a core file.

		@see https://nodejs.org/api/process.html#process_process_abort
	**/
	function abort():Void;

	/**
		The `process.allowedNodeEnvironmentFlags` property is a special, read-only `Set` of flags allowable within the
		`NODE_OPTIONS` environment variable.

		@see https://nodejs.org/api/process.html#process_process_allowednodeenvironmentflags
	**/
	var allowedNodeEnvironmentFlags(default, never):Set<String>;

	/**
		The `process.arch` property returns a string identifying the operating system CPU architecture for which the
		Node.js binary was compiled.

		@see https://nodejs.org/api/process.html#process_process_arch
	**/
	var arch:String;

	/**
		The `process.argv` property returns an array containing the command line arguments passed when the Node.js
		process was launched.

		@see https://nodejs.org/api/process.html#process_process_argv
	**/
	var argv:Array<String>;

	/**
		The `process.argv0` property stores a read-only copy of the original value of `argv[0]` passed when Node.js
		starts.

		@see https://nodejs.org/api/process.html#process_process_argv0
	**/
	var argv0(default, never):String;

	/**
		If the Node.js process was spawned with an IPC channel (see the Child Process documentation), the
		`process.channel` property is a reference to the IPC channel.

		@see https://nodejs.org/api/process.html#process_process_channel
	**/
	var channel:DynamicAccess<String>;

	/**
		The `process.chdir()` method changes the current working directory of the Node.js process or throws an exception
		if doing so fails (for instance, if the specified `directory` does not exist).

		@see https://nodejs.org/api/process.html#process_process_chdir_directory
	**/
	function chdir(directory:String):Void;

	/**
		The `process.config` property returns an `Object` containing the JavaScript representation of the configure
		options used to compile the current Node.js executable.

		@see https://nodejs.org/api/process.html#process_process_config
	**/
	var config:Dynamic<Dynamic>;

	/**
		If the Node.js process is spawned with an IPC channel (see the Child Process and Cluster documentation), the
		`process.connected` property will return `true` so long as the IPC channel is connected and will return `false`
		after `process.disconnect()` is called.

		@see https://nodejs.org/api/process.html#process_process_connected
	**/
	var connected:Bool;

	/**
		The `process.cpuUsage()` method returns the user and system CPU time usage of the current process, in an object
		with properties `user` and `system`, whose values are microsecond values (millionth of a second).

		@see https://nodejs.org/api/process.html#process_process_cpuusage_previousvalue
	**/
	function cpuUsage(?previousValue:CpuUsage):CpuUsage;

	/**
		The `process.cwd()` method returns the current working directory of the Node.js process.

		@see https://nodejs.org/api/process.html#process_process_cwd
	**/
	function cwd():String;

	/**
		The port used by Node.js's debugger when enabled.

		@see https://nodejs.org/api/process.html#process_process_debugport
	**/
	var debugPort:Int;

	/**
		If the Node.js process is spawned with an IPC channel (see the Child Process and Cluster documentation), the
		`process.disconnect()` method will close the IPC channel to the parent process, allowing the child process to
		exit gracefully once there are no other connections keeping it alive.

		@see https://nodejs.org/api/process.html#process_process_disconnect
	**/
	function disconnect():Void;

	/**
		The `process.dlopen()` method allows to dynamically load shared objects.

		@see https://nodejs.org/api/process.html#process_process_dlopen_module_filename_flags
	**/
	function dlopen(module:Dynamic<Dynamic>, filename:String, ?flags:Int):Void;

	/**
		The `process.emitWarning()` method can be used to emit custom or application specific process warnings.

		@see https://nodejs.org/api/process.html#process_process_emitwarning_warning_options
		@see https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor
	**/
	@:overload(function(warning:EitherType<String, Error>, ?type:String, ?code:String, ?ctor:Function):Void {})
	function emitWarning(warning:EitherType<String, Error>, ?options:EmitWarningOptions):Void;

	/**
		The `process.env` property returns an object containing the user environment.

		@see https://nodejs.org/api/process.html#process_process_env
	**/
	var env:DynamicAccess<String>;

	/**
		The `process.execArgv` property returns the set of Node.js-specific command-line options passed when the Node.js
		process was launched.

		@see https://nodejs.org/api/process.html#process_process_execargv
	**/
	var execArgv:Array<String>;

	/**
		The `process.execPath` property returns the absolute pathname of the executable that started the Node.js
		process.

		@see https://nodejs.org/api/process.html#process_process_execpath
	**/
	var execPath:String;

	/**
		The `process.exit()` method instructs Node.js to terminate the process synchronously with an exit status of
		`code`.

		@see https://nodejs.org/api/process.html#process_process_exit_code
	**/
	function exit(?code:Int):Void;

	/**
		A number which will be the process exit code, when the process either exits gracefully, or is exited via
		`process.exit()` without specifying a code.

		@see https://nodejs.org/api/process.html#process_process_exitcode
	**/
	var exitCode:Null<Int>;

	/**
		The `process.getegid()` method returns the numerical effective group identity of the Node.js process.

		@see https://nodejs.org/api/process.html#process_process_getegid
	**/
	function getegid():Int;

	/**
		The `process.geteuid()` method returns the numerical effective user identity of the process.

		@see https://nodejs.org/api/process.html#process_process_geteuid
	**/
	function getuid():Int;

	/**
		The `process.getgid()` method returns the numerical group identity of the process.

		@see https://nodejs.org/api/process.html#process_process_getgid
	**/
	function getgid():Int;

	/**
		The `process.getgroups()` method returns an array with the supplementary group IDs.

		@see https://nodejs.org/api/process.html#process_process_getgroups
	**/
	function getgroups():Array<Int>;

	/**
		A Writable Stream to stdout.

		`stderr` and `stdout` are unlike other streams in Node in that writes to them are usually blocking.
	**/
	var stdout:IWritable;

	/**
		A writable stream to stderr.

		`stderr` and `stdout` are unlike other streams in Node in that writes to them are usually blocking.
	**/
	var stderr:IWritable;

	/**
		A Readable Stream for stdin.
	**/
	var stdin:IReadable;

	/**
		Sets the group identity of the process. See setgid(2).
		This accepts either a numerical ID or a groupname string.
		If a groupname is specified, this method blocks while resolving it to a numerical ID.

		Note: this function is only available on POSIX platforms (i.e. not Windows)
	**/
	@:overload(function(id:String):Void {})
	function setgid(id:Int):Void;

	/**
		Sets the user identity of the process. See setuid(2).
		This accepts either a numerical ID or a username string.
		If a username is specified, this method blocks while resolving it to a numerical ID.

		Note: this function is only available on POSIX platforms (i.e. not Windows)
	**/
	@:overload(function(id:String):Void {})
	function setuid(id:Int):Void;

	/**
		Sets the supplementary group IDs.
		This is a privileged operation, meaning you need to be root or have the CAP_SETGID capability.

		Note: this function is only available on POSIX platforms (i.e. not Windows)
		The list can contain group IDs, group names or both.
	**/
	function setgroups(groups:Array<EitherType<String, Int>>):Void;

	/**
		Reads /etc/group and initializes the group access list, using all groups of which the user is a member.
		This is a privileged operation, meaning you need to be root or have the CAP_SETGID capability.

		Note: this function is only available on POSIX platforms (i.e. not Windows)
	**/
	function initgroups(user:EitherType<String, Int>, extra_group:EitherType<String, Int>):Void;

	/**
		A compiled-in property that exposes NODE_VERSION.
	**/
	var version(default, null):String;

	/**
		A property exposing version strings of node and its dependencies.
	**/
	var versions:DynamicAccess<String>;

	/**
		Send a signal to a process.
		`pid` is the process id and `signal` is the string describing the signal to send. Signal names are strings like 'SIGINT' or 'SIGHUP'.

		If omitted, the `signal` will be 'SIGTERM'. See Signal Events and kill(2) for more information.

		Will throw an error if target does not exist, and as a special case,
		a signal of 0 can be used to test for the existence of a process.

		Note that just because the name of this function is `kill`, it is really just a signal sender, like the kill system call.
		The signal sent may do something other than kill the target process.
	**/
	function kill(pid:Int, ?signal:String):Void;

	/**
		The PID of the process.
	**/
	var pid(default, null):Int;

	/**
		Getter/setter to set what is displayed in 'ps'.

		When used as a setter, the maximum length is platform-specific and probably short.
		On Linux and OS X, it's limited to the size of the binary name plus the length of the
		command line arguments because it overwrites the argv memory.
	**/
	var title:String;

	/**
		What platform you're running on: 'darwin', 'freebsd', 'linux', 'sunos' or 'win32'
	**/
	var platform:String;

	/**
		Returns an object describing the memory usage of the Node process measured in bytes.
	**/
	function memoryUsage():MemoryUsage;

	/**
		On the next loop around the event loop call this callback.
		This is not a simple alias to setTimeout(fn, 0), it's much more efficient.
		It typically runs before any other I/O events fire, but there are some exceptions.

		This is important in developing APIs where you want to give the user the chance to
		assign event handlers after an object has been constructed, but before any I/O has occurred.
	**/
	function nextTick(callback:Void->Void, args:Rest<Dynamic>):Void;

	/**
		Sets or reads the process's file mode creation mask.
		Child processes inherit the mask from the parent process.
		Returns the old mask if mask argument is given, otherwise returns the current mask.
	**/
	function umask(?mask:Int):Int;

	/**
		Number of seconds Node has been running.
	**/
	function uptime():Float;

	/**
		Returns the current high-resolution real time in a [seconds, nanoseconds] tuple Array.
		It is relative to an arbitrary time in the past.
		It is not related to the time of day and therefore not subject to clock drift.
		The primary use is for measuring performance between intervals.
		You may pass in the result of a previous call to `hrtime` to get a diff reading,
		useful for benchmarks and measuring intervals
	**/
	@:overload(function(prev:Array<Float>):Array<Float> {})
	function hrtime():Array<Float>;

	/**
		Alternate way to retrieve require.main. The difference is that if the main module changes at runtime,
		require.main might still refer to the original main module in modules that were required
		before the change occurred. Generally it's safe to assume that the two refer to the same module.

		As with require.main, it will be undefined if there was no entry script.
	**/
	var mainModule(default, null):Module;

	/**
		Send a message to the parent process.

		Only available for child processes. See `ChildProcess.send`.
	**/
	@:overload(function(message:Dynamic, sendHandle:Dynamic, options:ChildProcessSendOptions, ?callback:Error->Void):Bool {})
	@:overload(function(message:Dynamic, sendHandle:Dynamic, ?callback:Error->Void):Bool {})
	function send(message:Dynamic, ?callback:Error->Void):Bool;

	/**
		Disable run-time deprecation warnings.
		See `Util.deprecate`.
	**/
	var noDeprecation:Bool;

	/**
		Enable logging of deprecation warnings.
		See `Util.deprecate`.
	**/
	var traceDeprecation:Bool;

	/**
		Throw on deprecated API usage.
		See `Util.deprecate`.
	**/
	var throwDeprecation:Bool;
}

/**
	Object used by `Process.cpuUsage`.
**/
typedef CpuUsage = {
	user:Int,
	system:Int
}

/**
	Object used by `Process.emitWarning`.
**/
typedef EmitWarningOptions = {
	/**
		When `warning` is a `String`, `type` is the name to use for the type of warning being emitted.

		Default: `'Warning'`.
	**/
	@:optional var type:String;

	/**
		A unique identifier for the warning instance being emitted.
	**/
	@:optional var code:String;

	/**
		When `warning` is a `String`, `ctor` is an optional function used to limit the generated stack trace.

		Default: `process.emitWarning`.
	**/
	@:optional var ctor:Function;

	/**
		Additional text to include with the error.
	**/
	@:optional var detail:String;
}

typedef MemoryUsage = {
	rss:Float,
	heapTotal:Float,
	heapUsed:Float
}
