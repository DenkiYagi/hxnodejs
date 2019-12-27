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
import js.node.Vm.ModuleNamespaceObject;
import haxe.extern.EitherType;

typedef SourceTextModuleOptions = {
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

	/**
		Specifies the line number offset that is displayed in stack traces produced by this `Module`.
		Default: `0`.
	**/
	@:optional var lineOffset:Int;

	/**
		Specifies the column number offset that is displayed in stack traces produced by this `Module`.
		Default: `0`.
	**/
	@:optional var columnOffset:Int;

	/**
		Called during evaluation of this `Module` to initialize the `import.meta`.
	**/
	// @:optional var initializeImportMeta:import.Meta->SourceTextModule->Void;
	@:optional var initializeImportMeta:Dynamic->SourceTextModule->Void; // needs

	/**
		Called during evaluation of this module when `import()` is called.
		If this option is not specified, calls to `import()`
		will reject with `ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING`.
	**/
	@:optional var importModuleDynamically:String->Module->EitherType<ModuleNamespaceObject, Module>;
}

/**
	The `vm.SourceTextModule` class provides the Source Text Module Record
	as defined in the ECMAScript specification.

	@see https://nodejs.org/api/vm.html#vm_class_vm_sourcetextmodule
**/
@:jsRequire("vm", "SourceTextModule")
extern class SourceTextModule {
	/**
		Creates a new `SourceTextModule` instance.

		@see https://nodejs.org/api/vm.html#vm_constructor_new_vm_sourcetextmodule_code_options
	**/
	function new(code:String, ?options:SourceTextModuleOptions);
}
