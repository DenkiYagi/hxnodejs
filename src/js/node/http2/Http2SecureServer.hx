package js.node.http2;

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
import js.node.dgram.Socket;
import js.node.Http2.HeadersObject;
import js.node.events.EventEmitter.Event;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `Http2SecureServer` objects.
**/
@:enum abstract Http2SecureServerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		If a `'request'` listener is registered or `Http2.createSecureServer()` is supplied a callback function,
		the `'checkContinue'` event is emitted each time a request
		with an HTTP `Expect: 100-continue` is received.
		If this event is not listened for,
		the server will automatically respond with a status `100 Continue` as appropriate.

		@see https://nodejs.org/api/http2.html#http2_event_checkcontinue_1
	**/
	var CheckContinue:Http2SecureServerEvent<Http2ServerRequest->Http2ServerResponse->Void> = "checkCountinue";

	/**
		Emitted each time there is a request.
		There may be multiple requests per session.
		See the Compatibility API.

		@see https://nodejs.org/api/http2.html#http2_event_request_1
	**/
	var Request:Http2SecureServerEvent<Http2ServerRequest->Http2ServerResponse->Void> = "request";

	/**
		The `'session'` event is emitted when a new `Http2Session` is created by the `Http2SecureServer`.

		@see https://nodejs.org/api/http2.html#http2_event_session_1
	**/
	var Session:Http2SecureServerEvent<Http2Session->Void> = "session";

	/**
		The `'sessionError'` event is emitted when an `'error'` event is emitted
		by an `Http2Session` object associated with the `Http2SecureServer`.

		@see https://nodejs.org/api/http2.html#http2_event_sessionerror_1
	**/
	var SessionError:Http2SecureServerEvent<Error->Void> = "sessionError";

	/**
		The `'stream'` event is emitted when a `'stream'` event has been emitted
		by an `Http2Session` associated with the server.

		@see https://nodejs.org/api/http2.html#http2_event_stream_2
	**/
	var Stream:Http2SecureServerEvent<Http2Stream->HeadersObject->Int->Void> = "stream";

	/**
		The `'timeout'` event is emitted when there is no activity on the Server
		for a given number of milliseconds set using `http2secureserver.setTimeout()`.
		Default: 2 minutes.

		@see https://nodejs.org/api/http2.html#http2_event_timeout_3
	**/
	var Timeout:Http2SecureServerEvent<Int->Void> = "timeout";

	/**
		The `'unknownProtocol'` event is emitted when a connecting client fails to
		negotiate an allowed protocol (i.e. HTTP/2 or HTTP/1.1).
		The event handler receives the socket for handling.
		If no listener is registered for this event, the connection is terminated.
		See the Compatibility API.

		@see https://nodejs.org/api/http2.html#http2_event_unknownprotocol
	**/
	var UnknownProtocol:Http2SecureServerEvent<Socket->Void> = "unknownProtocol";
}

/**
	Instances of `Http2SecureServer` are created using the `Http2.createSecureServer()` function.
	The `Http2SecureServer` class is not exported directly by the `http2` module.

	@see https://nodejs.org/api/http2.html#http2_class_http2secureserver
**/
@:jsRequire("http2", "Http2SecureServer")
extern class Http2SecureServer extends js.node.tls.Server {
	/**
		Stops the server from establishing new sessions.
		This does not prevent new request streams from being created
		due to the persistent nature of HTTP/2 sessions.
		To gracefully shut down the server, call `http2session.close()` on all active sessions.

		@see https://nodejs.org/api/http2.html#http2_server_close_callback
	**/
	function close(?callback:Void->Void):Void;

	/**
		Used to set the timeout value for http2 server requests,
		and sets a callback function that is called
		when there is no activity on the `Http2Server` after `msecs` millisec

		@see https://nodejs.org/api/http2.html#http2_server_settimeout_msecs_callback
	**/
	function setTimeout(?msecs:Int, ?callback:Void->Void):Http2Server;
}
