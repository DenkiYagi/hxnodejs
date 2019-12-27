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

import js.node.vm.Script;
import haxe.extern.EitherType;
import js.lib.ArrayBufferView;
import js.lib.Function;

typedef CompileFunctionOptions = {
	/**
		Specifies the filename used in stack traces produced by this script.
		Default: `''`.
	**/
	@:optional var filename:String;

	/**
		Specifies the line number offset that is displayed in stack traces produced by this script.
		Default: `0`.
	**/
	@:optional var lineOffset:Float;

	/**
		Specifies the column number offset that is displayed in stack traces produced by this script.
		Default: `0`.
	**/
	@:optional var columnOffset:Float;

	/**
		Provides an optional `Buffer` or `ArrayBufferView` with V8's code cache data for the supplied source.
	**/
	@:optional var cachedData:EitherType<Buffer, ArrayBufferView>;

	/**
		Specifies whether to produce new cache data.
		Default: `false`.
	**/
	@:optional var produceCachedData:Bool;

	/**
		The contextified sandbox in which the said function should be compiled in.
	**/
	@:optional var parsingContext:ContextifiedObject;

	/**
		An array containing a collection of context extensions (objects wrapping the current scope) to be applied while compiling.
		Default: `[]`.
	**/
	@:optional var contextExtensions:Array<Class<Dynamic>>;
}

typedef CreateContextOptions = {
	/**
		Human-readable name of the newly created context.
		Default: `'VM Context i'`, where `i` is an ascending numerical index of the created context.
	**/
	var name:String;

	/**
		Origin corresponding to the newly created context for display purposes.
		The origin should be formatted like a URL, but with only the scheme, host, and port (if necessary),
		like the value of the `url.origin` property of a `URL` object.
		Most notably, this string should omit the trailing slash, as that denotes a path.
		Default: `''`.
	**/
	var origin:String;

	var codeGeneration:{
		/**
			If set to false, any calls to `eval` or function constructors (`Function`, `GeneratorFunction`, etc)
			will throw an `EvalError`.
			Default: `true`.
		**/
		strings:Bool,

		/**
			If set to false any attempt to compile a WebAssembly module will throw a `WebAssembly.CompileError`.
			Default: `true`.
		**/
		wasm:Bool
	};
}

typedef RunInContextOptions = {
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
		When `true`, if an `Error` occurs while compiling the `code`,
		the line of code causing the error is attached to the stack trace.
		Default: `true`.
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
		Provides an optional `Buffer` or `ArrayBufferView` with V8's code cache data
		for the supplied source.
		When supplied, the `cachedDataRejected` value will be set to either `true` or `false`
		depending on acceptance of the data by V8.
	**/
	@:optional var cachedData:EitherType<Buffer, ArrayBufferView>;

	/**
		When `true` and no `cachedData` is present, V8 will attempt to produce code cache data for `code`.
		Upon success, a `Buffer` with V8's code cache data will be produced and stored
		in the `cachedData` property of the returned `vm.Script` instance.
		The `cachedDataProduced` value will be set to either `true` or `false` depending on
		whether code cache data is produced successfully.
		This option is deprecated in favor of `script.createCachedData()`.
		Default: `false`.
	**/
	@:optional var produceCachedData:Bool;

	/**
		Called during evaluation of this module when `import()` is called.
		If this option is not specified, calls to `import()` will reject with `ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING`.
		This option is part of the experimental modules API, and should not be considered stable.
	**/
	@:optional var importModuleDynamically:String->Module->EitherType<ModuleNamespaceObject, Module>;
}

typedef RunInNewContextOptions = {
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
		When `true`, if an `Error` occurs while compiling the `code`,
		the line of code causing the error is attached to the stack trace.
		Default: `true`.
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
	@:optional var contextCodeGeneration:{
		/**
			If set to `false` any calls to eval or function constructors (`Function`, `GeneratorFunction`, etc)
			will throw an `EvalError`.
			Default: `true`.
		**/
		strings:Bool,

		/**
			If set to false any attempt to compile a WebAssembly module will throw a `WebAssembly.CompileError`.
			Default: `true`.
		**/
		wasm:Bool,
	};

	/**
		Provides an optional `Buffer` or `ArrayBufferView` with V8's code cache data
		for the supplied source.
		When supplied, the `cachedDataRejected` value will be set to either `true` or `false`
		depending on acceptance of the data by V8.
	**/
	@:optional var cachedData:EitherType<Buffer, ArrayBufferView>;

	/**
		When `true` and no `cachedData` is present, V8 will attempt to produce code cache data for `code`.
		Upon success, a `Buffer` with V8's code cache data will be produced and stored
		in the `cachedData` property of the returned `vm.Script` instance.
		The `cachedDataProduced` value will be set to either `true` or `false` depending on
		whether code cache data is produced successfully.
		This option is deprecated in favor of `script.createCachedData()`.
		Default: `false`.
	**/
	@:optional var produceCachedData:Bool;

	/**
		Called during evaluation of this module when `import()` is called.
		If this option is not specified, calls to `import()` will reject with `ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING`.
		This option is part of the experimental modules API, and should not be considered stable.
	**/
	@:optional var importModuleDynamically:String->Module->EitherType<ModuleNamespaceObject, Module>;
}

/**
	The `vm` module provides APIs for compiling and running code within V8 Virtual Machine contexts.
	The `vm` module is not a security mechanism.
	Do not use it to run untrusted code.
	The term "sandbox" is used throughout these docs simply to refer to a separate context,
	and does not confer any security guarantees.

	@see https://nodejs.org/api/vm.html#vm_vm_executing_javascript
**/
@:jsRequire("vm")
extern class Vm {
	/**
		Compiles the given code into the provided context/sandbox
		(if no context is supplied, the current context is used),
		and returns it wrapped inside a function with the given `params`.

		@see https://nodejs.org/api/vm.html#vm_vm_compilefunction_code_params_options
	**/
	static function compileFunction(code:String, params:Array<String>, options:CompileFunctionOptions):Function;

	/**
		If given a `sandbox` object, the `vm.createContext()` method will prepare that sandbox
		so that it can be used in calls to `vm.runInContext()` or `script.runInContext()`.
		Inside such scripts, the sandbox object will be the global object,
		retaining all of its existing properties but also having the built-in objects
		and functions any standard global object has.
		Outside of scripts run by the vm module, global variables will remain unchanged.

		@see https://nodejs.org/api/vm.html#vm_vm_createcontext_sandbox_options
	**/
	static function createContext(?sandbox:Class<Dynamic>, ?options:CreateContextOptions):ContextifiedObject;

	/**
		The `vm.runInContext()` method compiles code, runs it within the context of the contextifiedSandbox, then returns the result.
		Running code does not have access to the local scope.
		The contextifiedSandbox object must have been previously contextified using the vm.createContext() method.

		@see https://nodejs.org/api/vm.html#vm_vm_runincontext_code_contextifiedsandbox_options
	**/
	static function isContext(sandbox:Class<Dynamic>):Bool;

	/**
		The `vm.runInContext()` method compiles `code`,
		runs it within the context of the `contextifiedSandbox`, then returns the result.
		Running code does not have access to the local scope.
		The `contextifiedSandbox` object must have been previously contextified
		using the `vm.createContext()` method.

		@see https://nodejs.org/api/vm.html#vm_vm_runincontext_code_contextifiedsandbox_options
	**/
	@:overload(function(code:String, contextifiedSandbox:ContextifiedObject, ?options:RunInContextOptions):Dynamic {})
	static function runInContext(code:String, contextifiedSandbox:ContextifiedObject, ?options:String):Dynamic;

	/**
		The `vm.runInNewContext()` first contextifies the given sandbox object
		(or creates a new sandbox if passed as undefined), compiles the code,
		runs it within the context of the created context, then returns the result.
		Running code does not have access to the local scope.

		@see https://nodejs.org/api/vm.html#vm_vm_runinnewcontext_code_sandbox_options
	**/
	@:overload(function(code:String, sandbox:ContextifiedObject, ?options:RunInNewContextOptions):Dynamic {})
	static function runInNewContext(code:String, sandbox:ContextifiedObject, ?options:String):Dynamic;

	/**
		`vm.runInThisContext()` compiles code,
		runs it within the context of the current global and returns the result.
		Running code does not have access to local scope, but does have access to the current global object.

		@see https://nodejs.org/api/vm.html#vm_vm_runinthiscontext_code_options
	**/
	@:overload(function(code:String, sandbox:ContextifiedObject, ?options:RunInContextOptions):Dynamic {})
	static function runInThisContext(code:String, sandbox:ContextifiedObject, ?options:String):Dynamic;
}

class ContextifiedObject {}
class ModuleNamespaceObject {}
