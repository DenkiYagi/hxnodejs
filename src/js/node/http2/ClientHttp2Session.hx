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
	Enumeration of events for `ClientHttp2Session` objects.
**/
@:enum abstract ClientHttp2SessionEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'altsvc'` event is emitted whenever an `ALTSVC` frame is received by the client.
		The event is emitted with the `ALTSVC` value, origin, and stream ID.
		If no `origin` is provided in the `ALTSVC` frame,
		`origin` will be an empty string.

		@see https://nodejs.org/api/http2.html#http2_event_altsvc
	**/
	var Altsvc:ClientHttp2SessionEvent<String->String->Int->Void> = "altsvc";

	/**
		The `'origin'` event is emitted whenever an `ORIGIN` frame is received by the client.
		The event is emitted with an array of `origin` strings.
		The `http2session.originSet` will be updated to include the received origins.

		@see https://nodejs.org/api/http2.html#http2_event_origin
	**/
	var Origin:ClientHttp2SessionEvent<Array<String>->Void> = "origin";
}

/**
	@see https://nodejs.org/api/http2.html#http2_class_clienthttp2session
**/
@:jsRequire("http2", "ClientHttp2Session")
extern class ClientHttp2Session extends Http2Session {
	/**
		For HTTP/2 Client `Http2Session` instances only,
		the `Http2Session.request()` creates and returns an `Http2Stream` instance
		that can be used to send an HTTP/2 request to the connected server.

		@see https://nodejs.org/api/http2.html#http2_clienthttp2session_request_headers_options
	**/
	function request(headers:HeadersObject, ?options:RequestOptions):ClientHttp2Stream;
}

/**
	Options for `ClientHttp2Session.request()`.
**/
typedef RequestOptions = {
	/**
		`true` if the `Http2Stream` writable side should be closed initially,
		such as when sending a `GET` request that should not expect a payload body.
	**/
	var endStream:Bool;

	/**
		When `true` and `parent` identifies a parent Stream,
		the created stream is made the sole direct dependency of the parent,
		with all other existing dependents made a dependent of the newly created stream.
		Default: `false`.
	**/
	@:optional var exclusive:Bool;

	/**
		Specifies the numeric identifier of a stream the newly created stream is dependent on.
	**/
	var parent:Int;

	/**
		Specifies the relative dependency of a stream in relation to other streams with the same `parent`.
		The value is a number between `1` and `256` (inclusive).
	**/
	var weight:Int;

	/**
		When `true`, the `Http2Stream` will emit the `'wantTrailers'` event after the final `DATA` frame has been sent.
	**/
	var waitForTrailers:Bool;
}
