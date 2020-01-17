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

package js.node.async_hooks;

import haxe.Constraints.Function;
import haxe.extern.Rest;

/**
	The class `AsyncResource` is designed to be extended by the embedder's async resources.
	Using this, users can easily trigger the lifetime events of their own resources.

	@see https://nodejs.org/api/async_hooks.html#async_hooks_class_asyncresource
**/
extern class AsyncResource {
	/**
		@see https://nodejs.org/api/async_hooks.html#async_hooks_new_asyncresource_type_options
	**/
	function new(type:String, ?options:NewOptions);

	/**
		Call the provided function with the provided arguments in the execution context of the async resource.
		This will establish the context, trigger the AsyncHooks before callbacks, call the function,
		trigger the AsyncHooks after callbacks, and then restore the original execution context.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asyncresource_runinasyncscope_fn_thisarg_args
	**/
	function runInAsyncScope(fn:Function, thisArg:Dynamic, args:Rest<Any>):Void;

	/**
		Call all destroy hooks. This should only ever be called once.
		An error will be thrown if it is called more than once.
		This must be manually called.
		If the resource is left to be collected by the GC then the destroy hooks will never be called.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asyncresource_emitdestroy
	**/
	function emitDestroy():AsyncResource;

	/**
		The unique `asyncId` assigned to the resource.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asyncresource_asyncid
	**/
	function asyncId():Int;

	/**
		The same `triggerAsyncId` that is passed to the `AsyncResource` constructor.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asyncresource_triggerasyncid
	**/
	function triggerAsyncId():Int;
}

typedef NewOptions = {
	/**
		The ID of the execution context that created this async event.
		Default: `executionAsyncId()`.
	**/
	var triggerAsyncId:Int;

	/**
		Disables automatic `emitDestroy` when the object is garbage collected.
		This usually does not need to be set (even if `emitDestroy` is called manually),
		unless the resource's `asyncId` is retrieved and the sensitive API's `emitDestroy` is called with it.
		Default: `false`.
	**/
	var requireMannualDestroy:Bool;
}
