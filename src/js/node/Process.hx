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

import haxe.Constraints.Function;
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
		Normally, the Node.js process will exit when there is no work scheduled, but a listener registered on the
		`'beforeExit'` event can make asynchronous calls, and thereby cause the Node.js process to continue.

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
		The `'exit'` event is emitted when the Node.js process is about to exit as a result of either:

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
		By default, Node.js handles such exceptions by printing the stack trace to `stderr` and exiting with code 1,
		overriding any previously set `process.exitCode`.
		Adding a handler for the `'uncaughtException'` event overrides this default behavior.
		Alternatively, change the `process.exitCode` in the `'uncaughtException'` handler which will result in the
		process exiting with the provided exit code.
		Otherwise, in the presence of such handler the process will exit with 0.

		@see https://nodejs.org/api/process.html#process_event_uncaughtexception
	**/
	var UncaughtException:ProcessEvent<Error->String->Void> = "uncaughtException";

	/**
		The `'unhandledRejection'` event is emitted whenever a `Promise` is rejected and no error handler is attached to
		the promise within a turn of the event loop.
		When programming with Promises, exceptions are encapsulated as "rejected promises".
		Rejections can be caught and handled using `promise.catch()` and are propagated through a `Promise` chain.
		The `'unhandledRejection'` event is useful for detecting and keeping track of promises that were rejected whose
		rejections have not yet been handled.

		@see https://nodejs.org/api/process.html#process_event_unhandledrejection
	**/
	var UnhandledRejection:ProcessEvent<EitherType<Error, Dynamic>->Promise<Dynamic>->Void> = "unhandledRejection";

	/**
		The `'warning'` event is emitted whenever Node.js emits a process warning.

		@see https://nodejs.org/api/process.html#process_event_warning
	**/
	var Warning:ProcessEvent<Error->Void> = "warning";
}

/**
	The `process` object is a `global` that provides information about, and control over, the current Node.js process.
	As a global, it is always available to Node.js applications without using `require()`.
	It can also be explicitly accessed using `require()`:

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
		The first element will be `process.execPath`.
		See `process.argv0` if access to the original value of `argv[0]` is needed.
		The second element will be the path to the JavaScript file being executed.
		The remaining elements will be any additional command line arguments.

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
		If no IPC channel exists, this property is `undefined`.

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
		This is the same as the `config.gypi` file that was produced when running the `./configure` script.

		@see https://nodejs.org/api/process.html#process_process_config
	**/
	var config:DynamicAccess<Dynamic>;

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
		These values measure time spent in user and system code respectively, and may end up being greater than actual
		elapsed time if multiple CPU cores are performing work for this process.

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
		It is primarily used by `require()` to load C++ Addons, and should not be used directly, except in special
		cases.
		In other words, `require()` should be preferred over `process.dlopen()`, unless there are specific reasons.

		@see https://nodejs.org/api/process.html#process_process_dlopen_module_filename_flags
	**/
	function dlopen(module:Module, filename:String, ?flags:Int):Void;

	/**
		The `process.emitWarning()` method can be used to emit custom or application specific process warnings.
		These can be listened for by adding a handler to the `'warning'` event.

		@see https://nodejs.org/api/process.html#process_process_emitwarning_warning_options
		@see https://nodejs.org/api/process.html#process_process_emitwarning_warning_type_code_ctor
	**/
	@:overload(function(warning:String, ?options:EmitWarningOptions):Void {})
	@:overload(function(warning:Error, ?options:EmitWarningOptions):Void {})
	@:overload(function(warning:String, ?type:String, ?code:String, ?ctor:Null<Error>->Void):Void {})
	function emitWarning(warning:Error, ?type:String, ?code:String, ?ctor:Null<Error>->Void):Void;

	/**
		The `process.env` property returns an object containing the user environment.

		@see https://nodejs.org/api/process.html#process_process_env
	**/
	var env:DynamicAccess<String>;

	/**
		The `process.execArgv` property returns the set of Node.js-specific command-line options passed when the Node.js
		process was launched.
		These options do not appear in the array returned by the `process.argv` property, and do not include the Node.js
		executable, the name of the script, or any options following the script name.
		These options are useful in order to spawn child processes with the same execution environment as the parent.

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
		If `code` is omitted, exit uses either the 'success' code `0` or the value of `process.exitCode` if it has been
		set.
		Node.js will not terminate until all the `'exit'` event listeners are called.

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
	function geteuid():Int;

	/**
		The `process.getgid()` method returns the numerical group identity of the process.

		@see https://nodejs.org/api/process.html#process_process_getgid
	**/
	function getgid():Int;

	/**
		The `process.getgroups()` method returns an array with the supplementary group IDs.
		POSIX leaves it unspecified if the effective group ID is included but Node.js ensures it always is.

		@see https://nodejs.org/api/process.html#process_process_getgroups
	**/
	function getgroups():Array<Int>;

	/**
		The `process.getuid()` method returns the numeric user identity of the process.

		@see https://nodejs.org/api/process.html#process_process_getuid
	**/
	function getuid():Int;

	/**
		Indicates whether a callback has been set using `process.setUncaughtExceptionCaptureCallback()`.

		@see https://nodejs.org/api/process.html#process_process_hasuncaughtexceptioncapturecallback
	**/
	function hasUncaughtExceptionCaptureCallback():Bool;

	/**
		The `process.hrtime()` method returns the current high-resolution real time in a `[seconds, nanoseconds]` tuple
		`Array`, where `nanoseconds` is the remaining part of the real time that can't be represented in second
		precision.

		@see https://nodejs.org/api/process.html#process_process_hrtime_time
	**/
	function hrtime(?time:Array<Int>):Array<Int>;

	/**
		The `process.initgroups()` method reads the `/etc/group` file and initializes the group access list, using all
		groups of which the user is a member.
		This is a privileged operation that requires that the Node.js process either have `root` access or the
		`CAP_SETGID` capability.

		@see https://nodejs.org/api/process.html#process_process_initgroups_user_extragroup
	**/
	function initgroups(user:EitherType<String, Int>, extra_group:EitherType<String, Int>):Void;

	/**
		The `process.kill()` method sends the `signal` to the process identified by `pid`.

		@see https://nodejs.org/api/process.html#process_process_kill_pid_signal
	**/
	@:overload(function(pid:Int, ?signal:String):Void {})
	function kill(pid:Int, ?signal:Int):Void;

	/**
		The `process.mainModule` property provides an alternative way of retrieving `require.main`.
		The difference is that if the main module changes at runtime, `require.main` may still refer to the original
		main module in modules that were required before the change occurred.
		Generally, it's safe to assume that the two refer to the same module.

		@see https://nodejs.org/api/process.html#process_process_mainmodule
	**/
	var mainModule:Module;

	/**
		The `process.memoryUsage()` method returns an object describing the memory usage of the Node.js process measured
		in bytes.

		@see https://nodejs.org/api/process.html#process_process_memoryusage
	**/
	function memoryUsage():MemoryUsage;

	/**
		`process.nextTick()` adds `callback` to the "next tick queue".
		This queue is fully drained after the current operation on the JavaScript stack runs to completion and before
		the event loop is allowed to continue.
		It's possible to create an infinite loop if one were to recursively call `process.nextTick()`.
		See the Event Loop guide for more background.

		@see https://nodejs.org/api/process.html#process_process_nexttick_callback_args
	**/
	function nextTick(callback:Function, args:Rest<Dynamic>):Void;

	/**
		The `process.noDeprecation` property indicates whether the `--no-deprecation` flag is set on the current Node.js
		process.
		See the documentation for the `'warning'` event and the `emitWarning()` method for more information about this
		flag's behavior.

		@see https://nodejs.org/api/process.html#process_process_nodeprecation
	**/
	var noDeprecation:Bool;

	/**
		The `process.pid` property returns the PID of the process.

		@see https://nodejs.org/api/process.html#process_process_pid
	**/
	var pid(default, null):Int;

	/**
		The `process.platform` property returns a string identifying the operating system platform on which the Node.js
		process is running.

		@see https://nodejs.org/api/process.html#process_process_platform
	**/
	var platform(default, null):String;

	/**
		The `process.ppid` property returns the PID of the current parent process.

		@see https://nodejs.org/api/process.html#process_process_ppid
	**/
	var ppid(default, null):String;

	/**
		The `process.release` property returns an `Object` containing metadata related to the current release, including
		URLs for the source tarball and headers-only tarball.

		@see https://nodejs.org/api/process.html#process_process_release
	**/
	var release(default, null):Release;

	/**
		The resource usage for the current process.
		All of these values come from the `uv_getrusage` call which returns a `uv_rusage_t` struct.

		@see https://nodejs.org/api/process.html#process_process_resourceusage
	**/
	function resourceUsage():ResourceUsage;

	/**
		If Node.js is spawned with an IPC channel, the `process.send()` method can be used to send messages to the
		parent process.
		Messages will be received as a `'message'` event on the parent's `ChildProcess` object.

		@see https://nodejs.org/api/process.html#process_process_send_message_sendhandle_options_callback
	**/
	@:overload(function(message:Dynamic, ?sendHandle:Server, ?options:ChildProcessSendOptions, ?callback:Null<Error>->Void):Bool {})
	function send(message:Dynamic, ?sendHandle:Socket, ?options:ChildProcessSendOptions, ?callback:Null<Error>->Void):Bool;

	/**
		The `process.setegid()` method sets the effective group identity of the process.
		The `id` can be passed as either a numeric ID or a group name string.
		If a group name is specified, this method blocks while resolving the associated a numeric ID.

		@see https://nodejs.org/api/process.html#process_process_setegid_id
	**/
	@:overload(function(id:String):Void {})
	function setegid(id:Int):Void;

	/**
		The `process.seteuid()` method sets the effective user identity of the process.
		The `id` can be passed as either a numeric ID or a username string.
		If a username is specified, the method blocks while resolving the associated numeric ID.

		@see https://nodejs.org/api/process.html#process_process_seteuid_id
	**/
	@:overload(function(id:String):Void {})
	function seteuid(id:Int):Void;

	/**
		The `process.setgid()` method sets the group identity of the process.
		The `id` can be passed as either a numeric ID or a group name string.
		If a group name is specified, this method blocks while resolving the associated numeric ID.

		@see https://nodejs.org/api/process.html#process_process_setgid_id
	**/
	@:overload(function(id:String):Void {})
	function setgid(id:Int):Void;

	/**
		The `process.setgroups()` method sets the supplementary group IDs for the Node.js process.
		This is a privileged operation that requires the Node.js process to have `root` or the `CAP_SETGID` capability.

		@see https://nodejs.org/api/process.html#process_process_setgroups_groups
	**/
	function setgroups(groups:Array<Int>):Void;

	/**
		The `process.setuid(id)` method sets the user identity of the process.
		The `id` can be passed as either a numeric ID or a username string.
		If a username is specified, the method blocks while resolving the associated numeric ID.

		@see https://nodejs.org/api/process.html#process_process_setuid_id
	**/
	@:overload(function(id:String):Void {})
	function setuid(id:Int):Void;

	/**
		The `process.setUncaughtExceptionCaptureCallback()` function sets a function that will be invoked when an
		uncaught exception occurs, which will receive the exception value itself as its first argument.

		@see https://nodejs.org/api/process.html#process_process_setuncaughtexceptioncapturecallback_fn
	**/
	function setUncaughtExceptionCaptureCallback(fn:Null<Error->Void>):Void;

	/**
		The `process.stderr` property returns a stream connected to `stderr` (fd `2`).
		It is a `net.Socket` (which is a Duplex stream) unless fd `2` refers to a file, in which case it is a Writable
		stream.

		@see https://nodejs.org/api/process.html#process_process_stderr
	**/
	var stderr:IWritable;

	/**
		The `process.stdin` property returns a stream connected to `stdin` (fd `0`).
		It is a `net.Socket` (which is a Duplex stream) unless fd `0` refers to a file, in which case it is a Readable
		stream.

		@see https://nodejs.org/api/process.html#process_process_stdin
	**/
	var stdin:IReadable;

	/**
		The `process.stdout` property returns a stream connected to `stdout` (fd `1`).
		It is a `net.Socket` (which is a Duplex stream) unless fd `1` refers to a file, in which case it is a Writable
		stream.

		@see https://nodejs.org/api/process.html#process_process_stdout
	**/
	var stdout:IWritable;

	/**
		The `process.throwDeprecation` property indicates whether the `--throw-deprecation` flag is set on the current
		Node.js process.
		`process.throwDeprecation` is mutable, so whether or not deprecation warnings result in errors may be altered at
		runtime.
		See the documentation for the `'warning'` event and the `emitWarning()` method for more information.

		@see https://nodejs.org/api/process.html#process_process_throwdeprecation
	**/
	var throwDeprecation:Bool;

	/**
		The `process.title` property returns the current process title (i.e. returns the current value of `ps`).
		Assigning a new value to `process.title` modifies the current value of `ps`.

		@see https://nodejs.org/api/process.html#process_process_title
	**/
	var title:String;

	/**
		The `process.traceDeprecation` property indicates whether the `--trace-deprecation` flag is set on the current
		Node.js process.
		See the documentation for the `'warning'` event and the `emitWarning()` method for more information about this flag's behavior.

		@see https://nodejs.org/api/process.html#process_process_tracedeprecation
	**/
	var traceDeprecation:Bool;

	/**
		The `process.umask()` method sets or returns the Node.js process's file mode creation mask.
		Child processes inherit the mask from the parent process.
		Invoked without an argument, the current mask is returned, otherwise the umask is set to the argument value and
		the previous mask is returned.

		@see https://nodejs.org/api/process.html#process_process_umask_mask
	**/
	function umask(?mask:Int):Int;

	/**
		The `process.uptime()` method returns the number of seconds the current Node.js process has been running.

		@see https://nodejs.org/api/process.html#process_process_uptime
	**/
	function uptime():Float;

	/**
		The `process.version` property returns the Node.js version string.
	**/
	var version(default, null):String;

	/**
		The `process.versions` property returns an object listing the version strings of Node.js and its dependencies.
		`process.versions.modules` indicates the current ABI version, which is increased whenever a C++ API changes.
		Node.js will refuse to load modules that were compiled against a different module ABI version.
	**/
	var versions:DynamicAccess<String>;
}

@:jsRequire("process", "hrtime")
extern class HRTime {
	/**
		The `process.hrtime()` method returns the current high-resolution real time in a `[seconds, nanoseconds]` tuple
		`Array`, where `nanoseconds` is the remaining part of the real time that can't be represented in second
		precision.

		@see https://nodejs.org/api/process.html#process_process_hrtime_time
	**/
	@:selfCall
	function hrtime(?time:Array<Int>):Array<Int>;

	/**
		The `bigint` version of the `process.hrtime()` method returning the current high-resolution real time in
		nanoseconds as a `bigint`.

		@see https://nodejs.org/api/process.html#process_process_hrtime_bigint
	**/
	// function bigint():BigInt
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
	@:optional var ctor:Null<Error>->Void;

	/**
		Additional text to include with the error.
	**/
	@:optional var detail:String;
}

/**
	Object used by `Process.memoryUsage`.
**/
typedef MemoryUsage = {
	rss:Int,
	heapTotal:Int,
	heapUsed:Int,
	external:Int
}

/**
	Object used by `Process.release`.
**/
typedef Release = {
	/**
		A value that will always be `'node'` for Node.js.
		For legacy io.js releases, this will be `'io.js'`.
	**/
	var name:String;

	/**
		An absolute URL pointing to a `.tar.gz` file containing the source code of the current release.
	**/
	var sourceUrl:String;

	/**
		An absolute URL pointing to a `.tar.gz` file containing only the source header files for the current release.
		This file is significantly smaller than the full source file and can be used for compiling Node.js native
		add-ons.
	**/
	var headersUrl:String;

	/**
		An absolute URL pointing to a `node.lib` file matching the architecture and version of the current release.
		This file is used for compiling Node.js native add-ons. This property is only present on Windows builds of
		Node.js and will be missing on all other platforms.
	**/
	var libUrl:String;

	/**
		A string label identifying the `LTS` label for this release.
		This property only exists for LTS releases and is `undefined` for all other release types, including Current
		releases.
	**/
	var lts:String;
}

/**
	Object used by `Process.resourceUsage`.
**/
typedef ResourceUsage = {
	/**
		Maps to `ru_utime` computed in microseconds.
		It is the same value as `process.cpuUsage().user`.
	**/
	var userCPUTime:Int;

	/**
		Maps to `ru_stime` computed in microseconds.
		It is the same value as `process.cpuUsage().system`.
	**/
	var systemCPUTime:Int;

	/**
		Maps to `ru_maxrss` which is the maximum resident set size used in kilobytes.
	**/
	var maxRSS:Int;

	/**
		Maps to `ru_ixrss` but is not supported by any platform.
	**/
	var sharedMemorySize:Int;

	/**
		Maps to `ru_idrss` but is not supported by any platform.
	**/
	var unsharedDataSize:Int;

	/**
		Maps to `ru_isrss` but is not supported by any platform.
	**/
	var unsharedStackSize:Int;

	/**
		Maps to `ru_minflt` which is the number of minor page faults for the process.
	**/
	var minorPageFault:Int;

	/**
		Maps to `ru_majflt` which is the number of major page faults for the process.
		This field is not supported on Windows.
	**/
	var majorPageFault:Int;

	/**
		Maps to `ru_nswap` but is not supported by any platform.
	**/
	var swappedOut:Int;

	/**
		Maps to `ru_inblock` which is the number of times the file system had to perform input.
	**/
	var fsRead:Int;

	/**
		Maps to `ru_oublock` which is the number of times the file system had to perform output.
	**/
	var fsWrite:Int;

	/**
		Mps to `ru_msgsnd` but is not supported by any platform.
	**/
	var ipcSent:Int;

	/**
		Maps to `ru_msgrcv` but is not supported by any platform.
	**/
	var ipcReceived:Int;

	/**
		Maps to `ru_nsignals` but is not supported by any platform.
	**/
	var signalsCount:Int;

	/**
		Maps to `ru_nvcsw` which is the number of times a CPU context switch resulted due to a process voluntarily
		giving up the processor before its time slice was completed (usually to await availability of a resource).
		This field is not supported on Windows.
	**/
	var voluntaryContextSwitches:Int;

	/**
		Maps to `ru_nivcsw` which is the number of times a CPU context switch resulted due to a higher priority process
		becoming runnable or because the current process exceeded its time slice.
		This field is not supported on Windows.
	**/
	var involuntaryContextSwitches:Int;
}
