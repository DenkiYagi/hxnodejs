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

package js.node;

import haxe.DynamicAccess;

/**
	The `WASI` class provides the WASI system call API and additional convenience methods
	for working with WASI-based applications.
	Each `WASI` instance represents a distinct sandbox environment.
	For security purposes, each `WASI` instance must have its command line arguments, environment variables,
	and sandbox directory structure configured explicitly.

	@see https://nodejs.org/api/wasi.html#wasi_class_wasi
**/
@:jsRequire("wasi")
extern class WASI {
	/**
		@see https://nodejs.org/api/wasi.html#wasi_new_wasi_options
	**/
	function new(?options:WASIOptions);

	/**
		Attempt to begin execution of `instance` by invoking its `_start()` export.
		If `instance` does not contain a `_start()` export,
		then `start()` attempts to invoke the `__wasi_unstable_reactor_start()` export.
		If neither of those exports is present on `instance`, then `start()` does nothing.

		@see https://nodejs.org/api/wasi.html#wasi_wasi_start_instance
	**/
	public function start(instance:Class<Dynamic>):Void;

	/**
		`wasiImport` is an object that implements the WASI system call API.
		This object should be passed as the `wasi_snapshot_preview1` import during the instantiation of a `WebAssembly.Instance`.

		@see https://nodejs.org/api/wasi.html#wasi_wasi_wasiimport
	**/
	public var wasiImport(default, null):Class<Dynamic>;
}

typedef WASIOptions = {
	/**
		An array of strings that the WebAssembly application will see as command line arguments.
		The first argument is the virtual path to the WASI command itself.
		Default: `[]`.
	**/
	@:optional var args:Array<String>;

	/**
		An object similar to `process.env` that the WebAssembly application will see as its environment.
		Default: `{}`.
	**/
	@:optional var env:DynamicAccess<String>;

	/**
		This object represents the WebAssembly application's sandbox directory structure.
		The string keys of `preopens` are treated as directories within the sandbox.
		The corresponding values in `preopens` are the real paths to those directories on the host machine.
	**/
	var preopens:Class<Dynamic>;
}
