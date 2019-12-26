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

package js.node.worker_threads;

import haxe.DynamicAccess;
#if haxe4
import js.lib.Error;
import js.lib.Promise;
#else
import js.Error;
import js.Promise;
#end
import js.node.events.EventEmitter;
import js.node.stream.Readable.IReadable;
import js.node.stream.Writable.IWritable;
import js.node.WorkerThreads.ResourceLimits;

@:enum abstract WorkerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'error'` event is emitted if the worker thread throws an uncaught exception. In that case, the worker will be terminated.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_error
	**/
	var Error:WorkerEvent<Error->Void> = "error";

	/**
		The `'exit'` event is emitted once the worker has stopped.
		If the worker exited by calling `process.exit()`, the `exitCode` parameter will be the passed exit code.
		If the worker was terminated, the `exitCode` parameter will be `1`.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_exit
	**/
	var Exit:WorkerEvent<Int->Void> = "exit";

	/**
		The `'message'` event is emitted when the worker thread has invoked
		`require('worker_threads').parentPort.postMessage()`.
		See the `port.on('message')` event for more details.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_message_1
	**/
	var Message:WorkerEvent<Dynamic->Void> = "message";

	/**
		The `'online'` event is emitted when the worker thread has started executing JavaScript code.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_online
	**/
	var Online:WorkerEvent<Int->Void> = "online";
}

/**
	The `Worker` class represents an independent JavaScript execution thread.
	Most Node.js APIs are available inside of it.

	@see https://nodejs.org/api/worker_threads.html#worker_threads_class_worker
**/
@:jsRequire("worker_threads", "Worker")
extern class Worker extends EventEmitter<Worker> {
	/**
		@see https://nodejs.org/api/worker_threads.html#worker_threads_new_worker_filename_options
	**/
	function new(filename:String, ?options:WorkerOptions);

	/**
		Send a message to the worker that will be received via `require('worker_threads').parentPort.on('message')`.
		See `port.postMessage()` for more details.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_postmessage_value_transferlist
	**/
	function postMessage(value:Dynamic, ?transferList:Array<Dynamic>):Void;

	/**
		Opposite of `unref()`, calling `ref()` on a previously `unref()`ed worker will not let the program exit if it's
		the only active handle left (the default behavior).
		If the worker is `ref()`ed, calling `ref()` again will have no effect.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_ref
	**/
	function ref():Void;

	/**
		Provides the set of JS engine resource constraints for this Worker thread.
		If the `resourceLimits` option was passed to the `Worker` constructor, this matches its values.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_resourcelimits_1
	**/
	var resourceLimits:ResourceLimits;

	/**
		This is a readable stream which contains data written to `process.stderr` inside the worker thread.
		If `stderr: true` was not passed to the `Worker` constructor, then data will be piped to the parent thread's
		`process.stderr` stream.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_stderr
	**/
	var stderr:IReadable;

	/**
		If `stdin: true` was passed to the `Worker` constructor, this is a writable stream.
		The data written to this stream will be made available in the worker thread as `process.stdin`.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_stdin
	**/
	var stdin:Null<IWritable>;

	/**
		This is a readable stream which contains data written to `process.stdout` inside the worker thread.
		If `stdout: true` was not passed to the `Worker` constructor, then data will be piped to the parent thread's
		`process.stdout` stream.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_stdout
	**/
	var stdout:IWritable;

	/**
		Stop all JavaScript execution in the worker thread as soon as possible.
		Returns a Promise for the exit code that is fulfilled when the `'exit'` event is emitted.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_terminate
	**/
	function terminate():Promise<Int>;

	/**
		An integer identifier for the referenced thread.
		Inside the worker thread, it is available as `require('worker_threads').threadId`.
		This value is unique for each `Worker` instance inside a single process.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_threadid_1
	**/
	static var threadId:Int;

	/**
		Calling `unref()` on a worker will allow the thread to exit if this is the only active handle in the event
		system.
		If the worker is already `unref()`ed calling `unref()` again will have no effect.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_worker_unref
	**/
	function unref():Void;
}

typedef WorkerOptions = {
	/**
		List of arguments which would be stringified and appended to `process.argv` in the worker.
		This is mostly similar to the `workerData` but the values will be available on the global `process.argv` as if
		they were passed as CLI options to the script.
	**/
	@:optional var argv:Array<Dynamic>;

	/**
		If set, specifies the initial value of `process.env` inside the Worker thread. As a special value,
		`worker.SHARE_ENV` may be used to specify that the parent thread and the child thread should share their
		environment variables; in that case, changes to one thread’s `process.env` object will affect the other thread
		as well.

		Default: `process.env`.
	**/
	@:optional var env:DynamicAccess<String>;

	/**
		If `true`, interpret the first argument to the constructor as a script that is executed once the worker is
		online.
	**/
	@:optional var eval:Bool;

	/**
		List of node CLI options passed to the worker.
		V8 options (such as `--max-old-space-size`) and options that affect the process (such as `--title`) are not
		supported.
		If set, this will be provided as `process.execArgv` inside the worker.
		By default, options will be inherited from the parent thread.
	**/
	@:optional var execArgv:Array<String>;

	/**
		If this is set to `true`, then `worker.stdin` will provide a writable stream whose contents will appear as
		`process.stdin` inside the Worker.
		By default, no data is provided.
	**/
	@:optional var stdin:Bool;

	/**
		If this is set to `true`, then `worker.stdout` will not automatically be piped through to `process.stdout` in
		the parent.
	**/
	@:optional var stdout:Bool;

	/**
		If this is set to `true`, then `worker.stderr` will not automatically be piped through to `process.stderr` in
		the parent.
	**/
	@:optional var stderr:Bool;

	/**
		Any JavaScript value that will be cloned and made available as `require('worker_threads').workerData`.
		The cloning will occur as described in the HTML structured clone algorithm, and an error will be thrown if the
		object cannot be cloned (e.g. because it contains `function`s).
	**/
	@:optional var workerData:Dynamic;

	/**
		An optional set of resource limits for the new JS engine instance.
		Reaching these limits will lead to termination of the `Worker` instance.
		These limits only affect the JS engine, and no external data, including no `ArrayBuffer`s.
		Even if these limits are set, the process may still abort if it encounters a global out-of-memory situation.
	**/
	@:optional var resourceLimits:ResourceLimits;
}
