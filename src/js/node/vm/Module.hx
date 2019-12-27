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

import haxe.extern.EitherType;
#if haxe4
import js.lib.Promise;
#else
import js.Promise;
#end

typedef EvaluateOptions = {
	/**
		Specifies the number of milliseconds to evaluate before terminating execution.
		If execution is interrupted, an `Error` will be thrown.
		This value must be a strictly positive integer.
	**/
	@:optional var timeout:Int;

	/**
		If `true`, the execution will be terminated when `SIGINT` (Ctrl+C) is received.
		Existing handlers for the event that have been attached via `process.on('SIGINT')`
		will be disabled during script execution, but will continue to work after that.
		If execution is interrupted, an `Error` will be thrown.
		Default: `false`.
	**/
	@:optional var breakOnSigint:Bool;
}

/**
	The `vm.Module` class provides a low-level interface for using ECMAScript modules in VM contexts.
	It is the counterpart of the `vm.Script` class that closely mirrors Module Records
	as defined in the ECMAScript specification.

	@see https://nodejs.org/api/vm.html#vm_class_vm_module
**/
@:jsRequire("vm", "Module")
extern class Module {
	/**
		The specifiers of all dependencies of this module. The returned array is frozen to disallow any changes to it.

		@see https://nodejs.org/api/vm.html#vm_module_dependencyspecifiers
	**/
	var dependencySpecifiers(default, null):Array<String>;

	/**
		If the `module.status` is `'errored'`, this property contains the exception
		thrown by the module during evaluation.
		If the status is anything else, accessing this property will result in a thrown exception.

		@see https://nodejs.org/api/vm.html#vm_module_error
	**/
	var error(default, null):Dynamic;

	/**
		Evaluate the module.

		@see https://nodejs.org/api/vm.html#vm_module_evaluate_options
	**/
	function evaluate(?options:EvaluateOptions):Promise<Dynamic>; // TODO

	/**
		Link module dependencies.
		This method must be called before evaluation, and can only be called once per module.

		@see https://nodejs.org/api/vm.html#vm_module_link_linker
	**/
	function link(linker:String->Module->EitherType<Module, Promise<Dynamic>>):Promise<Dynamic>; // TODO

	/**
		The namespace object of the module.
		This is only available after linking (`module.link()`) has completed.

		@see https://nodejs.org/api/vm.html#vm_module_namespace
	**/
	var namespace(default, null):Class<Dynamic>; // TODO

	/**
		The current status of the module.

		@see https://nodejs.org/api/vm.html#vm_module_status
	**/
	var status(default, null):String; // TODO: to be enum abstract

	/**
		The identifier of the current module, as set in the constructor.

		@see https://nodejs.org/api/vm.html#vm_module_identifier
	**/
	var identifier(default, null):String;
}
