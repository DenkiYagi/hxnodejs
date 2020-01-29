/*
 * Copyright (C)2014-2020 Haxe Foundation
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

package js.node.error;

import js.node.Error;

/**
	Node.js generates system errors when exceptions occur within its runtime environment.
	These usually occur when an application violates an operating system constraint.
	For example, a system error will occur if an application attempts to read a file that does not exist.

	@see https://nodejs.org/api/errors.html#errors_class_systemerror
**/
extern class SystemError extends Error {
	/**
		If present, the address to which a network connection failed

		@see https://nodejs.org/api/errors.html#errors_error_address
	**/
	@:optional public var address(default, never):String;

	// already defined in `Error` class
	// public var code(default, never):String;

	/**
		If present, the file path destination when reporting a file system error

		@see https://nodejs.org/api/errors.html#errors_error_dest
	**/
	@:optional public var dest(default, never):String;

	/**
		The `error.errno` property is a negative number which corresponds to the error code
		defined in `libuv` Error handling.

		@see https://nodejs.org/api/errors.html#errors_error_errno
	**/
	@:optional public var errno(default, never):Int;

	/**
		If present, `error.info` is an object with details about the error condition.

		@see https://nodejs.org/api/errors.html#errors_error_info
	**/
	@:optional public var info(default, never):Class<Dynamic>;

	// already defined om `Error` class
	// public var message(default, never):String;

	/**
		If present, `error.path` is a string containing a relevant invalid pathname.

		@see https://nodejs.org/api/errors.html#errors_error_path
	**/
	@:optional public var path(default, never):String;

	/**
		If present, `error.port` is the network connection port that is not available.

		@see https://nodejs.org/api/errors.html#errors_error_port
	**/
	@:optional public var port(default, never):String;

	/**
		The `error.syscall` property is a string describing the syscall that failed.

		@see https://nodejs.org/api/errors.html#errors_error_syscall
	**/
	@:optional public var syscall(default, never):String;
}

/**
	This is a list of system errors commonly-encountered when writing a Node.js program.
	For a comprehensive list, see the errno(3) man page.

	@see https://nodejs.org/api/errors.html#errors_common_system_errors
**/
class CommonSystemErrors {
	/**
		`EACCES` (Permission denied):
		An attempt was made to access a file in a way forbidden by its file access permissions.
	**/
	public static var EACCES(get, never):Int;

	private static inline function get_EACCES():Int
		return js.Syntax.code("EACCES");

	/**
		`EADDRINUSE` (Address already in use):
		An attempt to bind a server (`net`, `http`, or `https`) to a local address failed
		due to another server on the local system already occupying that address.
	**/
	public static var EADDRINUSE(get, never):Int;

	private static inline function get_EADDRINUSE():Int
		return js.Syntax.code("EADDRINUSE");

	/**
		`ECONNREFUSED` (Connection refused):
		No connection could be made because the target machine actively refused it.
		This usually results from trying to connect to a service that is inactive on the foreign host.
	**/
	public static var ECONNREFUSED(get, never):Int;

	private static inline function get_ECONNREFUSED():Int
		return js.Syntax.code("ECONNREFUSED");

	/**
		`ECONNRESET` (Connection reset by peer):
		A connection was forcibly closed by a peer.
		This normally results from a loss of the connection on the remote socket due to a timeout or reboot.
		Commonly encountered via the http and net modules.
	**/
	public static var ECONNRESET(get, never):Int;

	private static inline function get_ECONNRESET():Int
		return js.Syntax.code("ECONNRESET");

	/**
		`EEXIST` (File exists):
		An existing file was the target of an operation that required that the target not exist.
	**/
	public static var EEXIST(get, never):Int;

	private static inline function get_EEXIST():Int
		return js.Syntax.code("EEXIST");

	/**
		`EISDIR` (Is a directory):
		An operation expected a file, but the given pathname was a directory.
	**/
	public static var EISDIR(get, never):Int;

	private static inline function get_EISDIR():Int
		return js.Syntax.code("EISDIR");

	/**
		`EMFILE` (Too many open files in system):
		Maximum number of file descriptors allowable on the system has been reached,
		and requests for another descriptor cannot be fulfilled until at least one has been closed.
		This is encountered when opening many files at once in parallel,
		especially on systems (in particular, macOS) where there is a low file descriptor limit for processes.
		To remedy a low limit, run `ulimit -n 2048` in the same shell that will run the Node.js process.
	**/
	public static var EMFILE(get, never):Int;

	private static inline function get_EMFILE():Int
		return js.Syntax.code("EMFILE");

	/**
		`ENOENT` (No such file or directory):
		Commonly raised by `fs` operations to indicate that a component of the specified
		pathname does not exist — no entity (file or directory) could be found by the given path.
	**/
	public static var ENOENT(get, never):Int;

	private static inline function get_ENOENT():Int
		return js.Syntax.code("ENOENT");

	/**
		`ENOTDIR` (Not a directory):
		A component of the given pathname existed, but was not a directory as expected.
		Commonly raised by `fs.readdir`.
	**/
	public static var ENOTDIR(get, never):Int;

	private static inline function get_ENOTDIR():Int
		return js.Syntax.code("ENOTDIR");

	/**
		`ENOTEMPTY` (Directory not empty):
		A directory with entries was the target of an operation that requires an empty directory
		— usually `fs.unlink`.
	**/
	public static var ENOTEMPTY(get, never):Int;

	private static inline function get_ENOTEMPTY():Int
		return js.Syntax.code("ENOTEMPTY");

	/**
		`ENOTFOUND` (DNS lookup failed):
		Indicates a DNS failure of either `EAI_NODATA` or `EAI_NONAME`.
		This is not a standard POSIX error.
	**/
	public static var ENOTFOUND(get, never):Int;

	private static inline function get_ENOTFOUND():Int
		return js.Syntax.code("ENOTFOUND");

	/**
		`EPERM` (Operation not permitted):
		An attempt was made to perform an operation that requires elevated privileges.
	**/
	public static var EPERM(get, never):Int;

	private static inline function get_EPERM():Int
		return js.Syntax.code("EPERM");

	/**
		`EPIPE` (Broken pipe):
		A write on a pipe, socket, or FIFO for which there is no process to read the data.
		Commonly encountered at the net and http layers, indicative that the remote side of the stream being written to has been closed.
	**/
	public static var EPIPE(get, never):Int;

	private static inline function get_EPIPE():Int
		return js.Syntax.code("EPIPE");

	/**
		`ETIMEDOUT` (Operation timed out):
		A connect or send request failed because
		the connected party did not properly respond after a period of time.
		Usually encountered by http or net — often a sign that a `socket.end()` was not properly called.
	**/
	public static var ETIMEOUT(get, never):Int;

	private static inline function get_ETIMEOUT():Int
		return js.Syntax.code("ETIMEOUT");
}
