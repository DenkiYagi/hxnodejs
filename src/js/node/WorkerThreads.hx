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

import js.node.worker_threads.MessagePort;
import js.node.Vm.VmContext;

/**
	The `worker_threads` module enables the use of threads that execute JavaScript in parallel.

	@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_threads
**/
@:jsRequire("worker_threads")
extern class WorkerThreads {
	/**
		Is `true` if this code is not running inside of a `Worker` thread.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_ismainthread
	**/
	static var isMainThread:Bool;

	/**
		Transfer a `MessagePort` to a different `vm` Context.
		The original `port` object will be rendered unusable, and the returned `MessagePort` instance will take its
		place.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_movemessageporttocontext_port_contextifiedsandbox
	**/
	static function moveMessagePortToContext(port:Int, contextifiedSandbox:VmContext<{}>):MessagePort;

	/**
		If this thread was spawned as a `Worker`, this will be a `MessagePort` allowing communication with the parent thread.
		Messages sent using `parentPort.postMessage()` will be available in the parent thread using
		`worker.on('message')`, and messages sent from the parent thread using `worker.postMessage()` will be available
		in this thread using `parentPort.on('message')`.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_parentport
	**/
	static var parentPort:Null<MessagePort>;
}
