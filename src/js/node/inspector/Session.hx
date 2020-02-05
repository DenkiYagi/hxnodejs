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

package js.node.inspector;

#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.events.EventEmitter;
import js.node.events.EventEmitter.Event;

/**
	Enumeration of events for `Session` objects.
**/
@:enum abstract SessionEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when any notification from the V8 Inspector is received.
	**/
	var InspectorNorification:SessionEvent<Class<Dynamic>->Void> = "inspectorNotification";

	// TODO: inspector-protocol-method
}

/**
	The `inspector.Session` is used for dispatching messages to the V8 inspector back-end and
	receiving message responses and notifications.

	@see https://nodejs.org/api/inspector.html#inspector_class_inspector_session
**/
extern class Session extends EventEmitter<Session> {
	/**
		Create a new instance of the `inspector.Session` class.
		The inspector session needs to be connected through `session.connect()`
		before the messages can be dispatched to the inspector backend.

		@see https://nodejs.org/api/inspector.html#inspector_constructor_new_inspector_session
	**/
	public function new();

	/**
		Connects a session to the inspector back-end.

		@see https://nodejs.org/api/inspector.html#inspector_session_connect
	**/
	public static function connect():Void;

	/**
		Connects a session to the main thread inspector back-end.
		An exception will be thrown if this API was not called on a Worker thread.

		@see https://nodejs.org/api/inspector.html#inspector_session_connecttomainthread
	**/
	public static function connectToMainThread():Void;

	/**
		Immediately close the session. All pending message callbacks will be called with an error.
		`session.connect()` will need to be called to be able to send messages again.
		Reconnected session will lose all inspector state, such as enabled agents or configured breakpoints.

		@see https://nodejs.org/api/inspector.html#inspector_session_disconnect
	**/
	public static function disconnect():Void;

	/**
		Posts a message to the inspector back-end.
		`callback` will be notified when a response is received.
		`callback` is a function that accepts two optional arguments: error and message-specific result.

		@see https://nodejs.org/api/inspector.html#inspector_session_post_method_params_callback
	**/
	public static function post(method:String, ?params:Class<Dynamic>, ?callback:Null<Error>->Class<Dynamic>->Void):Void;
}
