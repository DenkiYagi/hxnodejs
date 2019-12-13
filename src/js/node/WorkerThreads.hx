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

#if haxe4
import js.lib.Symbol;
#end
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

	/**
		Receive a single message from a given `MessagePort`.
		If no message is available, `undefined` is returned, otherwise an object with a single `message` property that
		contains the message payload, corresponding to the oldest message in the `MessagePort`’s queue.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_receivemessageonport_port
	**/
	static function receiveMessageOnPort(port:MessagePort):Null<{message:Dynamic}>;

	/**
		Provides the set of JS engine resource constraints inside this Worker thread.
		If the `resourceLimits` option was passed to the `Worker` constructor, this matches its values.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_resourcelimits
	**/
	static var resourceLimits:ResourceLimits;

	/**
		A special value that can be passed as the `env` option of the `Worker` constructor, to indicate that the current
		thread and the Worker thread should share read and write access to the same set of environment variables.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_share_env
	**/
	#if haxe4
	static final SHARE_ENV:Symbol;
	#else
	static var SHARE_ENV(default, never):Dynamic;
	#end

	/**
		An integer identifier for the current thread.
		On the corresponding worker object (if there is any), it is available as `worker.threadId`.
		This value is unique for each `Worker` instance inside a single process.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_threadid
	**/
	static var threadId:Int;

	/**
		An arbitrary JavaScript value that contains a clone of the data passed to this thread’s `Worker` constructor.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_workerdata
	**/
	static var workerData:Dynamic;
}

typedef ResourceLimits = {
	@:optional var maxYoungGenerationSizeMb:Int;
	@:optional var maxOldGenerationSizeMb:Int;
	@:optional var varcodeRangeSizeMb:Int;
}
