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

/**
	The `async_hooks` module provides an API to register callbacks tracking the lifetime of
	asynchronous resources created inside a Node.js application.

	@see https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks
**/
@:jsRequire("async_hooks")
extern class AsyncHooks {
	/**
		Registers functions to be called for different lifetime events of each async operation.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_createhook_callbacks
	**/
	static function createHook(callbacks:HookCallbacks):AsyncHooks;

	/**
		Enable the callbacks for a given `AsyncHook` instance.
		If no callbacks are provided enabling is a noop.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asynchook_enable
	**/
	static function enable():AsyncHooks;

	/**
		Disable the callbacks for a given `AsyncHook` instance from the global pool of
		`AsyncHook` callbacks to be executed.
		Once a hook has been disabled it will not be called again until enabled.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_asynchook_disable
	**/
	static function disable():AsyncHooks;

	/**
		The `asyncId` of the current execution context. Useful to track when something calls.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_executionasyncid
	**/
	static function executionAsyncId():Int;

	/**
		The ID of the resource responsible for calling the callback that is currently being executed.

		@see https://nodejs.org/api/async_hooks.html#async_hooks_async_hooks_triggerasyncid
	**/
	static function triggerAsyncId():Int;
}

typedef HookCallbacks = {
	/**
		The init callback
	**/
	@:optional var init:Int->String->Int->Class<Dynamic>->Void;

	/**
		The before callback
	**/
	@:optional var before:Int->Void;

	/**
		The after callback
	**/
	@:optional var after:Int->Void;

	/**
		The destroy callback
	**/
	@:optional var destroy:Int->Void;

	/**
		The promiseResolve callback.
	**/
	@:optional var promiseResolve:Int->Void;
}
