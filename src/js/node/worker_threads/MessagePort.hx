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

import js.node.events.EventEmitter;

@:enum abstract MessagePortEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'close'` event is emitted once either side of the channel has been disconnected.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_close
	**/
	var Close:MessagePortEvent<Void->Void> = "close";

	/**
		The `'message'` event is emitted for any incoming message, containing the cloned input of `port.postMessage()`.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_event_message
	**/
	var Message:MessagePortEvent<Dynamic->Void> = "message";
}

/**
	Instances of the `worker.MessagePort` class represent one end of an asynchronous, two-way communications channel.
	It can be used to transfer structured data, memory regions and other `MessagePort`s between different `Worker`s.

	@see https://nodejs.org/api/worker_threads.html#worker_threads_class_messageport
**/
@:jsRequire("worker_threads", "MessagePort")
extern class MessagePort extends EventEmitter<MessagePort> {
	/**
		Disables further sending of messages on either side of the connection.
		This method can be called when no further communication will happen over this `MessagePort`.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_port_close
	**/
	function close():Void;

	/**
		Sends a JavaScript value to the receiving side of this channel.
		`value` will be transferred in a way which is compatible with the HTML structured clone algorithm.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_port_postmessage_value_transferlist
	**/
	function postMessage(value:Dynamic, ?transferList:Array<Dynamic>):Void;

	/**
		Opposite of `unref()`.
		Calling `ref()` on a previously `unref()`ed port will not let the program exit if it's the only active handle
		left (the default behavior).
		If the port is `ref()`ed, calling `ref()` again will have no effect.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_port_ref
	**/
	function ref():Void;

	/**
		Starts receiving messages on this `MessagePort`.
		When using this port as an event emitter, this will be called automatically once `'message'` listeners are
		attached.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_port_start
	**/
	function start():Void;

	/**
		Calling `unref()` on a port will allow the thread to exit if this is the only active handle in the event system.
		If the port is already `unref()`ed calling `unref()` again will have no effect.

		@see https://nodejs.org/api/worker_threads.html#worker_threads_port_unref
	**/
	function unref():Void;
}
