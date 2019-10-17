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

package js.node.cluster;

import js.node.child_process.ChildProcess;
import js.node.Cluster.ListeningEventAddress;
import js.node.events.EventEmitter;
import js.node.events.EventEmitter.Event;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by the `Worker` class.
**/
@:enum abstract WorkerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Similar to the `cluster.on('disconnect')` event, but specific to this worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_disconnect
	**/
	var Disconnect:WorkerEvent<Void->Void> = "disconnect";

	/**
		This event is the same as the one provided by `child_process.fork()`.

		@see https://nodejs.org/api/cluster.html#cluster_event_error
	**/
	var Error:WorkerEvent<Error->Void> = "error";

	/**
		Similar to the `cluster.on('exit')` event, but specific to this worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_exit
	**/
	var Exit:WorkerEvent<Int->String->Void> = "exit";

	/**
		Similar to the `cluster.on('listening')` event, but specific to this worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_listening
	**/
	var Listening:WorkerEvent<ListeningEventAddress->Void> = "listening";

	/**
		Similar to the `'message'` event of `cluster`, but specific to this worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_message
	**/
	var Message:WorkerEvent<Dynamic->Dynamic->Void> = "message";

	/**
		Similar to the `cluster.on('online')` event, but specific to this worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_online
	**/
	var Online:WorkerEvent<Void->Void> = "online";
}

/**
	A `Worker` object contains all public information and method about a worker.

	@see https://nodejs.org/api/cluster.html#cluster_class_worker
**/
extern class Worker extends EventEmitter<Worker> {
	/**
		In a worker, this function will close all servers, wait for the `'close'` event on those servers, and then
		disconnect the IPC channel.

		@see https://nodejs.org/api/cluster.html#cluster_worker_disconnect
	**/
	function disconnect():Worker;

	/**
		This property is `true` if the worker exited due to `.kill()` or `.disconnect()`.
		If the worker exited any other way, it is `false`.
		If the worker has not exited, it is `undefined`.

		@see https://nodejs.org/api/cluster.html#cluster_worker_exitedafterdisconnect
	**/
	var exitedAfterDisconnect:Null<Bool>;

	/**
		Each new worker is given its own unique id, this id is stored in the `id`.

		@see https://nodejs.org/api/cluster.html#cluster_worker_id
	**/
	var id(default, null):Int;

	/**
		This function returns `true` if the worker is connected to its master via its IPC channel, `false` otherwise.
		A worker is connected to its master after it has been created.
		It is disconnected after the `'disconnect'` event is emitted.

		@see https://nodejs.org/api/cluster.html#cluster_worker_isconnected
	**/
	function isConnected():Bool;

	/**
		This function returns `true` if the worker's process has terminated (either because of exiting or being
		signaled).
		Otherwise, it returns `false`.

		@see https://nodejs.org/api/cluster.html#cluster_worker_isdead
	**/
	function isDead():Bool;

	/**
		This function will kill the worker.
		In the master, it does this by disconnecting the `worker.process`, and once disconnected, killing with `signal`.
		In the worker, it does it by disconnecting the channel, and then exiting with code `0`.

		@see https://nodejs.org/api/cluster.html#cluster_worker_kill_signal_sigterm
	**/
	function kill(?signal:String):Void;

	/**
		All workers are created using `child_process.fork()`, the returned object from this function is stored as
		`.process`.
		In a worker, the global `process` is stored.

		@see https://nodejs.org/api/cluster.html#cluster_worker_process
	**/
	var process:ChildProcess;

	/**
		Send a message to a worker or master, optionally with a handle.

		@see https://nodejs.org/api/cluster.html#cluster_worker_send_message_sendhandle_callback
	**/
	function send(message:Dynamic, ?sendHandle:Dynamic, ?callback:Null<Error>->Void):Bool;
}
