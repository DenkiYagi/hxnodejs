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
