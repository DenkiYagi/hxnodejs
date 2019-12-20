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
import js.node.net.Server;
import js.node.Http2.HeadersObject;
import js.node.events.EventEmitter.Event;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `Http2Server` objects.
**/
@:enum abstract Http2ServerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		If a `'request'` listener is registered or `Http2.createServer()` is supplied a callback function,
		the `'checkContinue'` event is emitted each time a request
		with an HTTP `Expect: 100-continue` is received.
		If this event is not listened for, the server will automatically respond
		with a status `100 Continue` as appropriate.

		@see https://nodejs.org/api/http2.html#http2_event_checkcontinue
	**/
	var CheckContinue:Http2ServerEvent<Http2ServerRequest->Http2ServerResponse->Void> = "checkCountinue";

	/**
		Emitted each time there is a request.
		There may be multiple requests per session.
		See the Compatibility API.

		@see https://nodejs.org/api/http2.html#http2_event_request
	**/
	var Request:Http2ServerEvent<Http2ServerRequest->Http2ServerResponse->Void> = "request";

	/**
		The `'session'` event is emitted when a new `Http2Session` is created by the `Http2Server`.

		@see https://nodejs.org/api/http2.html#http2_event_session
	**/
	var Session:Http2ServerEvent<Http2Session->Void> = "session";

	/**
		The `'sessionError'` event is emitted when an `'error'` event is emitted
		by an `Http2Session` object associated with the `Http2Server`.

		@see https://nodejs.org/api/http2.html#http2_event_sessionerror
	**/
	var SessionError:Http2ServerEvent<Error->Void> = "sessionError";

	/**
		The `'stream'` event is emitted when a `'stream'` event has been emitted
		by an `Http2Session` associated with the server.

		@see https://nodejs.org/api/http2.html#http2_event_stream_1
	**/
	var Stream:Http2ServerEvent<Http2Stream->HeadersObject->Int->Void> = "stream";

	/**
		The `'timeout'` event is emitted when there is no activity on the Server
		for a given number of milliseconds set using `http2server.setTimeout()`.
		Default: 0 (no timeout)

		@see https://nodejs.org/api/http2.html#http2_event_timeout_2
	**/
	var Timeout:Http2ServerEvent<Void->Void> = "timeout";
}

/**
	@see https://nodejs.org/api/http2.html#http2_class_clienthttp2session
**/
extern class Http2Server extends Server {
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
