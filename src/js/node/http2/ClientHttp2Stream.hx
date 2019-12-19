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
import js.node.Http2.HeadersObject;
import js.node.events.EventEmitter.Event;

/**
	Enumeration of events for `ClientHttp2Stream` objects.
**/
@:enum abstract ClientHttp2StreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when the server sends a `100 Continue` status,
		usually because the request contained `Expect: 100-continue`.
		This is an instruction that the client should send the request body.

		@see https://nodejs.org/api/http2.html#http2_event_continue
	**/
	var Continue:ClientHttp2StreamEvent<Void->Void> = "continue";

	/**
		The `'headers'` event is emitted when an additional block of headers is received for a stream,
		such as when a block of `1xx` informational headers is received.
		The listener callback is passed the HTTP/2 Headers Object and flags associated with the headers.

		@see https://nodejs.org/api/http2.html#http2_event_headers
	**/
	var Headers:ClientHttp2StreamEvent<HeadersObject->Int->Void> = "header";

	/**
		The `'push'` event is emitted when response headers for a Server Push stream are received.
		The listener callback is passed the HTTP/2 Headers Object and flags associated with the headers.

		@see https://nodejs.org/api/http2.html#http2_event_push
	**/
	var Push:ClientHttp2StreamEvent<HeadersObject->Int->Void> = "push";

	/**
		The `'response'` event is emitted when a response `HEADERS` frame has been received
		for this stream from the connected HTTP/2 server.
		The listener is invoked with two arguments: an Object containing the received HTTP/2 Headers Object,
		and flags associated with the headers.

		@see https://nodejs.org/api/http2.html#http2_event_response
	**/
	var Response:ClientHttp2StreamEvent<HeadersObject->Int->Void> = "response";
}

/**
	The `ClientHttp2Stream` class is an extension of `Http2Stream` that is used exclusively on HTTP/2 Clients.
	`Http2Stream` instances on the client provide events
	such as `'response'` and `'push'` that are only relevant on the client.

	@see  https://nodejs.org/api/http2.html#http2_class_clienthttp2stream
**/
extern class ClientHttp2Stream extends Http2Stream {}
