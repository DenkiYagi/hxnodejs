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
import js.node.child_process.ChildProcess as ChildProcessObject;
#if haxe4
import js.lib.ArrayBufferView;
import js.lib.Error;
#else
import js.html.ArrayBufferView;
import js.Error;
#end

/**
	The `child_process` module provides the ability to spawn child processes in a manner that is similar, but not
	identical, to `popen(3)`.
	This capability is primarily provided by the `child_process.spawn()` function:

	@see https://nodejs.org/api/child_process.html#child_process_child_process
**/
@:jsRequire("child_process")
extern class ChildProcess {
	/**
		Spawns a shell then executes the `command` within that shell, buffering any generated output.
		The `command` string passed to the exec function is processed directly by the shell and special characters (vary
		based on `shell`) need to be dealt with accordingly:

		@see https://nodejs.org/api/child_process.html#child_process_child_process_exec_command_options_callback
	**/
	static function exec(command:String, ?options:ChildProcessExecOptions, ?callback:ChildProcessExecCallback):ChildProcessObject;

	/**
		The `child_process.execFile()` function is similar to `child_process.exec()` except that it does not spawn a
		shell by default.
		Rather, the specified executable `file` is spawned directly as a new process making it slightly more efficient
		than `child_process.exec()`.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_execfile_file_args_options_callback
	**/
	static function execFile(file:String, ?args:Array<String>, ?options:ChildProcessExecFileOptions, ?callback:ChildProcessExecCallback):ChildProcessObject;

	/**
		The `child_process.fork()` method is a special case of `child_process.spawn()` used specifically to spawn new
		Node.js processes.
		Like `child_process.spawn()`, a ChildProcess object is returned.
		The returned `ChildProcess` will have an additional communication channel built-in that allows messages to be
		passed back and forth between the parent and child.
		See `subprocess.send()` for details.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_fork_modulepath_args_options
	**/
	static function fork(modulePath:String, ?args:Array<String>, ?options:ChildProcessForkOptions):ChildProcessObject;

	/**
		The `child_process.spawn()` method spawns a new process using the given `command`, with command line arguments
		in `args`.
		If omitted, `args` defaults to an empty array.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_spawn_command_args_options
	**/
	static function spawn(command:String, ?args:Array<String>, ?options:ChildProcessSpawnOptions):ChildProcessObject;

	/**
		The `child_process.execFileSync()` method is generally identical to `child_process.execFile()` with the
		exception that the method will not return until the child process has fully closed.
		When a timeout has been encountered and `killSignal` is sent, the method won't return until the process has
		completely exited.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_execfilesync_file_args_options
	**/
	@:overload(function(file:String, ?args:Array<String>, ?options:ChildProcessExecFileSyncOptions):Buffer {})
	static function execFileSync(file:String, ?args:Array<String>, ?options:ChildProcessExecFileSyncOptions):String;

	/**
		The `child_process.execSync()` method is generally identical to `child_process.exec()` with the exception that
		the method will not return until the child process has fully closed.
		When a timeout has been encountered and `killSignal` is sent, the method won't return until the process has
		completely exited.
		If the child process intercepts and handles the `SIGTERM` signal and doesn't exit, the parent process will wait
		until the child process has exited.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_execsync_command_options
	**/
	@:overload(function(command:String, ?options:ChildProcessExecSyncOptions):Buffer {})
	static function execSync(command:String, ?options:ChildProcessExecSyncOptions):String;

	/**
		The `child_process.spawnSync()` method is generally identical to `child_process.spawn()` with the exception that
		the function will not return until the child process has fully closed.
		When a timeout has been encountered and `killSignal` is sent, the method won't return until the process has
		completely exited.
		If the process intercepts and handles the `SIGTERM` signal and doesn't exit, the parent process will wait until
		the child process has exited.

		@see https://nodejs.org/api/child_process.html#child_process_child_process_spawnsync_command_args_options
	**/
	static function spawnSync(command:String, ?args:Array<String>, ?options:ChildProcessSpawnSyncOptions):ChildProcessSpawnSyncResult;
}

/**
	Common options for all `ChildProcess` methods.
**/
private typedef ChildProcessCommonOptions = {
	/**
		Current working directory of the child process.

		Default: `null`.
	**/
	@:optional var cwd:String;

	/**
		Environment key-value pairs.

		Default: `process.env`.
	**/
	@:optional var env:DynamicAccess<String>;

	/**
		Sets the user identity of the process (see `setuid(2)`).
	**/
	@:optional var uid:Int;

	/**
		Sets the group identity of the process (see `setgid(2)`).
	**/
	@:optional var gid:Int;
}

/**
	Options for `ChildProcess.exec` and `ChildProcess.execFile` methods.
**/
private typedef ChildProcessExecOptions = {
	> ChildProcessCommonOptions,

	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:String;

	/**
		Shell to execute the command with.

		Default: `'/bin/sh'` on Unix, `process.env.ComSpec` on Windows.
	**/
	@:optional var shell:String;

	/**
		Default: `0`.
	**/
	@:optional var timeout:Int;

	/**
		Largest amount of data in bytes allowed on stdout or stderr.
		If exceeded, the child process is terminated and any output is truncated.
		See caveat at `maxBuffer` and Unicode.

		Default: `1024 * 1024`.
	**/
	@:optional var maxBuffer:Int;

	/**
		Default: `'SIGTERM'`.
	**/
	@:optional var killSignal:EitherType<String, Int>;

	/**
		Hide the subprocess console window that would normally be created on Windows systems.

		Default: `false`.
	**/
	@:optional var windowsHide:Bool;
}

/**
	An error passed to the `ChildProcess.exec` callback.
**/
@:native("Error")
extern class ChildProcessExecError extends Error {
	/**
		The `error.code` property will be the exit code of the child process.
	**/
	var code(default, null):Int;

	/**
		The `error.signal` property will be set to the signal that terminated the process.
	**/
	var signal(default, null):String;
}

/**
	A callback type for `ChildProcess.exec`.
**/
#if haxe4
typedef ChildProcessExecCallback = (error:Null<ChildProcessExecError>, stdout:EitherType<String, Buffer>, stderr:EitherType<String, Buffer>) -> Void;
#else
typedef ChildProcessExecCallback = Null<ChildProcessExecError>->EitherType<String, Buffer>->EitherType<String, Buffer>->Void;
#end

typedef ChildProcessExecFileOptions = {
	> ChildProcessExecOptions,

	/**
		No quoting or escaping of arguments is done on Windows.
		Ignored on Unix.

		Default: `false`.
	**/
	@:optional var windowsVerbatimArguments:Bool;
}

@:enum abstract ChildProcessStdioSimple(String) from String to String {
	/**
		Equivalent to `['pipe', 'pipe', 'pipe']`.
	**/
	var Pipe = "pipe";

	/**
		Equivalent to `['ignore', 'ignore', 'ignore']`.
	**/
	var Ignore = "ignore";

	/**
		Equivalent to `['inherit', 'inherit', 'inherit']` or `[0, 1, 2]`.
	**/
	var Inherit = "inherit";
}

// see https://github.com/HaxeFoundation/haxe/issues/3499
// @:enum abstract ChildProcessSpawnOptionsStdioBehaviour(String) from String to String {
// 	var Pipe = "pipe";
// 	var Ipc = "ipc";
// 	var Ignore = "ignore";
// }
// typedef ChildProcessStdioFull = Array<EitherType<ChildProcessStdioBehaviour,EitherType<IStream,Int>>>;
typedef ChildProcessStdioFull = Array<Dynamic>;
typedef ChildProcessStdio = EitherType<ChildProcessStdioSimple, ChildProcessStdioFull>;

/**
	Options for the `ChildProcess.fork` method.
**/
typedef ChildProcessForkOptions = {
	> ChildProcessCommonOptions,

	/**
		Prepare child to run independently of its parent process.
		Specific behavior depends on the platform, see `options.detached`).
	**/
	@:optional var detached:Bool;

	/**
		Executable used to create the child process.
	**/
	@:optional var execPath:String;

	/**
		List of string arguments passed to the executable.

		Default: `process.execArgv`.
	**/
	@:optional var execArgv:Array<String>;

	/**
		If `true`, stdin, stdout, and stderr of the child will be piped to the parent, otherwise they will be inherited
		from the parent, see the `'pipe'` and `'inherit'` options for `child_process.spawn()`'s stdio for more details.

		Default: `false`.
	**/
	@:optional var silent:Bool;

	/**
		See `child_process.spawn()`'s stdio.
		When this option is provided, it overrides `silent`.
		If the array variant is used, it must contain exactly one item with value `'ipc'` or an error will be thrown.
		For instance `[0, 1, 2, 'ipc']`.
	**/
	@:optional var stdio:ChildProcessStdio;

	/**
		No quoting or escaping of arguments is done on Windows.
		Ignored on Unix.

		Default: `false`.
	**/
	@:optional var windowsVerbatimArguments:Bool;
}

private typedef ChildProcessSpawnCommonOptions = {
	> ChildProcessCommonOptions,

	/**
		Explicitly set the value of `argv[0]` sent to the child process.
		This will be set to `command` if not specified.
	**/
	@:optional var argv0:String;

	/**
		Child's stdio configuration (see `options.stdio`).
	**/
	@:optional var stdio:ChildProcessStdio;

	/**
		If `true`, runs `command` inside of a shell.
		Uses `'/bin/sh'` on Unix, and `process.env.ComSpec` on Windows.
		A different shell can be specified as a string.

		Default: `false` (no shell).
	**/
	@:optional var shell:EitherType<Bool, String>;

	/**
		No quoting or escaping of arguments is done on Windows.
		Ignored on Unix.
		This is set to `true` automatically when `shell` is specified and is CMD.

		Default: `false`.
	**/
	@:optional var windowsVerbatimArguments:Bool;

	/**
		Hide the subprocess console window that would normally be created on Windows systems.

		Default: `false`.
	**/
	@:optional var windowsHide:Bool;
}

/**
	Options for the `ChildProcess.spawn` method.
**/
typedef ChildProcessSpawnOptions = {
	> ChildProcessSpawnCommonOptions,

	/**
		Prepare child to run independently of its parent process.
		Specific behavior depends on the platform, see `options.detached`).
	**/
	@:optional var detached:Bool;
}

/**
	Common options for all `ChildProcess` sync methods.
**/
private typedef ChildProcessCommonSyncOptions = {
	/**
		The value which will be passed as stdin to the spawned process.
		Supplying this value will override `stdio[0]`.
	**/
	@:optional var input:EitherType<String, EitherType<Buffer, ArrayBufferView>>;

	/**
		Child's stdio configuration.
		`stderr` by default will be output to the parent process' stderr unless `stdio` is specified.

		Default: `'pipe'`.
	**/
	@:optional var stdio:ChildProcessStdio;
}

/**
	Options for the `ChildProcess.execFileSync` method.
**/
typedef ChildProcessExecFileSyncOptions = {
	> ChildProcessCommonSyncOptions,
	> ChildProcessExecOptions,
	/**
		If `true`, runs `command` inside of a shell.
		Uses `'/bin/sh'` on Unix, and `process.env.ComSpec` on Windows.
		A different shell can be specified as a string.

		Default: `false` (no shell).
	**/
	// @:optional var shell:EitherType<Bool, String>;
}

/**
	Options for the `ChildProcess.execSync` method.
**/
typedef ChildProcessExecSyncOptions = {
	> ChildProcessCommonSyncOptions,
	> ChildProcessExecOptions,
}

/**
	Options for the `ChildProcess.spawnSync` method.
**/
typedef ChildProcessSpawnSyncOptions = {
	> ChildProcessSpawnCommonOptions,

	/**
		In milliseconds the maximum amount of time the process is allowed to run.

		Default: `undefined`.
	**/
	@:optional var timeout:Int;

	/**
		The signal value to be used when the spawned process will be killed.

		Default: `'SIGTERM'`.
	**/
	@:optional var killSignal:EitherType<String, Int>;

	/**
		Largest amount of data in bytes allowed on stdout or stderr.
		If exceeded, the child process is terminated and any output is truncated.

		Default: `1024 * 1024`.
	**/
	@:optional var maxBuffer:Int;

	/**
		The encoding used for all stdio inputs and outputs.

		Default: `'buffer'`.
	**/
	@:optional var encoding:String;
}

/**
	Object returned from the `ChildProcess.spawnSync` method.
**/
typedef ChildProcessSpawnSyncResult = {
	/**
		Pid of the child process.
	**/
	var pid:Int;

	/**
		Array of results from stdio output.
	**/
	var output:Array<EitherType<Buffer, String>>;

	/**
		The contents of `output[1]`.
	**/
	var stdout:EitherType<Buffer, String>;

	/**
		The contents of `output[2]`.
	**/
	var stderr:EitherType<Buffer, String>;

	/**
		The exit code of the subprocess, or `null` if the subprocess terminated due to a signal.
	**/
	var status:Null<Int>;

	/**
		The signal used to kill the subprocess, or `null` if the subprocess did not terminate due to a signal.
	**/
	var signal:Null<String>;

	/**
		The error object if the child process failed or timed out.
	**/
	var error:Error;
}
