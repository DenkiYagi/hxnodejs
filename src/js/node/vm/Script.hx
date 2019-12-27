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

package js.node.vm;

import js.node.vm.Module;
import js.node.Vm.ContextifiedObject;
import haxe.io.ArrayBufferView;
import haxe.extern.EitherType;

typedef ScriptOptions = {
	/**
		Specifies the filename used in stack traces produced by this script.
		Default: `'evalmachine.<anonymous>'`.
	**/
	@:optional var filename:String;

	/**
		Specifies the line number offset that is displayed in stack traces produced by this script.
		Default: `0`.
	**/
	@:optional var lineOffset:Int;

	/**
		Specifies the column number offset that is displayed in stack traces produced by this script.
		Default: `0`.
	**/
	@:optional var columnOffset:Int;

	/**
		Provides an optional `Buffer` or `ArrayBufferView` with V8's code cache data for the supplied source.
		When supplied, the `cachedDataRejected` value will be set to either `true` or `false`
		depending on acceptance of the data by V8.
	**/
	@:optional var cachedData:EitherType<Buffer, ArrayBufferView>;

	/**
		When `true` and no `cachedData` is present, V8 will attempt to produce code cache data for `code`.
		Upon success, a `Buffer` with V8's code cache data will be produced and stored
		in the `cachedData` property of the returned `vm.Script` instance.
		The `cachedDataProduced` value will be set to either `true` or `false`
		depending on whether code cache data is produced successfully.
		This option is `deprecated` in favor of `script.createCachedData()`.
		Default: `false`.
	**/
	@:optional var produceCachedData:Bool;

	/**
		Called during evaluation of this module when `import()` is called.
		If this option is not specified,
		calls to `import()` will reject with `ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING`.
		This option is part of the experimental modules API, and should not be considered stable.
	**/
	@:optional var importModuleDynamically:String->Module->EitherType<js.node.Vm.ModuleNamespaceObject, Module>;
}

typedef RunInContextOptions = {
	/**
		When `true`, if an `Error` occurs while compiling the `code`,
		the line of code causing the error is attached to the stack trace.
		Default: true.
	**/
	@:optional var displayErrors:Bool;

	/**
		Specifies the number of milliseconds to execute code before terminating execution.
		If execution is terminated, an `Error` will be thrown.
		This value must be a strictly positive integer.
	**/
	@:optional var timeout:Int;

	/**
		If `true`, the execution will be terminated when `SIGINT` (Ctrl+C) is received.
		Existing handlers for the event that have been attached via `process.on('SIGINT')`
		will be disabled during script execution, but will continue to work after that.
		If execution is terminated, an `Error` will be thrown.
		Default: `false`.
	**/
	@:optional var breakOnSigint:Bool;
}

typedef RunInNewContextOptions = {
	/**
		When `true`, if an `Error` occurs while compiling the `code`,
		the line of code causing the error is attached to the stack trace.
		Default: true.
	**/
	@:optional var displayErrors:Bool;

	/**
		Specifies the number of milliseconds to execute `code` before terminating execution.
		If execution is terminated, an `Error` will be thrown.
		This value must be a strictly positive integer.
	**/
	@:optional var timeout:Int;

	/**
		If `true`, the execution will be terminated when `SIGINT` (Ctrl+C) is received.
		Existing handlers for the event that have been attached via `process.on('SIGINT')`
		will be disabled during script execution, but will continue to work after that.
		If execution is terminated, an `Error` will be thrown.
		Default: `false`.
	**/
	@:optional var breakOnSigint:Bool;

	/**
		Human-readable name of the newly created context.
		Default: `'VM Context i'`, where `i` is an ascending numerical index of the created context.
	**/
	@:optional var contextName:String;

	/**
		Origin corresponding to the newly created context for display purposes.
		The origin should be formatted like a URL, but with only the scheme, host, and port (if necessary),
		like the value of the `url.origin` property of a `URL` object.
		Most notably, this string should omit the trailing slash, as that denotes a path.
		Default: `''`.
	**/
	@:optional var contextOrigin:String;

	/**

	**/
	@:optional var contextCodeGeneration:ContextCodeGenerationOptions;
}

typedef ContextCodeGenerationOptions = {
	/**
		If set to false any calls to `eval` or
		function constructors (`Function`, `GeneratorFunction`, etc) will throw an `EvalError`.
		Default: `true`.
	**/
	@:optional var strings:Bool;

	/**
		If set to false
		any attempt to compile a WebAssembly module will throw a `WebAssembly.CompileError`.
		Default: `true`.
	**/
	@:optional var wasm:Bool;
}

typedef RunInThisContextOptions = {
	/**
		When `true`, if an `Error` occurs while compiling the `code`,
		the line of code causing the error is attached to the stack trace.
		Default: `true`.
	**/
	@:optional var displayErrors:Bool;

	/**
		Specifies the number of milliseconds to execute code before terminating execution.
		If execution is terminated, an `Error` will be thrown.
		This value must be a strictly positive integer.
	**/
	@:optional var timeout:Int;

	/**
		If `true`, the execution will be terminated when `SIGINT` (Ctrl+C) is received.
		Existing handlers for the event that have been attached via `process.on('SIGINT')`
		will be disabled during script execution, but will continue to work after that.
		If execution is terminated, an `Error` will be thrown.
		Default: `false`.
	**/
	@:optional var breakOnSigint:Bool;
}

/**
	Instances of the `vm.Script` class contain precompiled scripts that can be executed in specific sandboxes (or "contexts").

	@see https://nodejs.org/api/vm.html#vm_class_vm_script
**/
@:jsRequire("vm", "Script")
extern class Script {
	/**
		If `options` is a string, then it specifies the filename.

		Creating a new `vm.Script` object compiles `code` but does not run it.
		The compiled `vm.Script` can be run later multiple times.
		The code is not bound to any global object; rather,
		it is bound before each run, just for that run.

		@see https://nodejs.org/api/vm.html#vm_constructor_new_vm_script_code_options
	**/
	@:overload(function(code:String, ?options:ScriptOptions):Script {})
	function new(code:String, ?options:String);

	/**
		Creates a code cache that can be used with the Script constructor's `cachedData` option.
		Returns a Buffer.
		This method may be called at any time and any number of times.

		@see https://nodejs.org/api/vm.html#vm_script_createcacheddata
	**/
	function createCachedData():Buffer;

	/**
		Runs the compiled code contained by the `vm.Script` object
		within the given `contextifiedSandbox` and returns the result.
		Running code does not have access to local scope.

		@see https://nodejs.org/api/vm.html#vm_script_runincontext_contextifiedsandbox_options
	**/
	function runInContext(contextifiedSandbox:ContextifiedObject, ?options:RunInContextOptions):Dynamic;

	/**
		First contextifies the given `sandbox`,
		runs the compiled code contained by the `vm.Script` object within the created sandbox,
		and returns the result.
		Running code does not have access to local scope.

		@see https://nodejs.org/api/vm.html#vm_script_runinnewcontext_sandbox_options
	**/
	function runInNewContext(?sandbox:ContextifiedObject, ?options:RunInNewContextOptions):Dynamic;

	/**
		Runs the compiled code contained by the `vm.Script`
		within the context of the current `global` object.
		Running code does not have access to local scope,
		but does have access to the current `global` object.

		@see https://nodejs.org/api/vm.html#vm_script_runinthiscontext_options
	**/
	function runInThisContext(?options:RunInThisContextOptions):Dynamic;
}
