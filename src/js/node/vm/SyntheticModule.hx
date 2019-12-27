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

import js.node.Vm.ContextifiedObject;

typedef SyntheticModuleOptions = {
	/**
		String used in stack traces.
		Default: `'vm:module(i)'` where `i` is a context-specific ascending index.
	**/
	@:optional var identifier:String;

	/**
		The contextified object as returned by the `vm.createContext()` method,
		to compile and evaluate this `Module` in.
	**/
	@:optional var context:ContextifiedObject;
}

/**
	The `vm.SyntheticModule` class provides the Synthetic Module Record as defined
	in the WebIDL specification.
	The purpose of synthetic modules is to provide a generic interface for exposing non-JavaScript
	sources to ECMAScript module graphs.

	@see https://nodejs.org/api/vm.html#vm_class_vm_syntheticmodule
**/
@:jsRequire("vm", "SyntheticModule")
extern class SyntheticModule extends Module {
	/**
		Creates a new `SyntheticModule` instance.

		@see https://nodejs.org/api/vm.html#vm_constructor_new_vm_syntheticmodule_exportnames_evaluatecallback_options
	**/
	function new(exportNames:Array<String>, evaluateCallback:Void->Void, ?options:SyntheticModuleOptions);

	/**
		This method is used after the module is linked to set the values of exports.
		If it is called before the module is linked, an `ERR_VM_MODULE_STATUS` error will be thrown.

		@see https://nodejs.org/api/vm.html#vm_syntheticmodule_setexport_name_value
	**/
	function setExport(name:String, value:Dynamic):Void;
}
