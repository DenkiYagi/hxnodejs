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
import haxe.extern.EitherType;
import js.node.net.Socket;
import js.node.tls.TLSSocket;
import js.node.stream.Readable;
import js.node.Http2.HeadersObject;
import js.node.events.EventEmitter.Event;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `Http2ServerRequest` objects.
**/
@:enum abstract Http2ServerRequestEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'aborted'` event is emitted whenever a `Http2ServerRequest` instance
		is abnormally aborted in mid-communication.

		@see https://nodejs.org/api/http2.html#http2_event_aborted_1
	**/
	var Aborted:Http2ServerRequestEvent<Void->Void> = "aborted";

	/**
		Indicates that the underlying `Http2Stream` was closed.
		Just like `'end'`, this event occurs only once per response.

		@see https://nodejs.org/api/http2.html#http2_event_close_2
	**/
	var Close:Http2ServerRequestEvent<Void->Void> = "close";

	/**
		Inherited from `stream.Readable`.
	**/
	var Data:Http2ServerRequestEvent<Dynamic->Void> = "data";

	/**
		Inherited from `stream.Readable`.
	**/
	var End:Http2ServerRequestEvent<Void->Void> = "end";

	/**
		Inherited from `stream.Readable`.
	**/
	var Error:Http2ServerRequestEvent<Error->Void> = "error";

	/**
		Inherited from `stream.Readable`.
	**/
	var Pause:Http2ServerRequestEvent<Void->Void> = "pause";

	/**
		Inherited from `stream.Readable`.
	**/
	var Readable:Http2ServerRequestEvent<Void->Void> = "readable";

	/**
		Inherited from `stream.Readable`.
	**/
	var Resume:Http2ServerRequestEvent<Void->Void> = "resume";
}

/**
	A `Http2ServerRequest` object is created by `http2.Server` or `http2.SecureServer`
	and passed as the first argument to the `'request'` event.
	It may be used to access a request status, headers, and data.

	@see https://nodejs.org/api/http2.html#http2_class_http2_http2serverrequest
**/
@:jsRequire("http2", "Http2ServerRequest")
extern class Http2ServerRequest extends Readable<Http2ServerRequest> {
	/**
		The `request.aborted` property will be `true` if the request has been aborted.

		@see https://nodejs.org/api/http2.html#http2_request_aborted
	**/
	var aborted(default, null):Bool;

	/**
		The request authority pseudo header field.
		It can also be accessed via `req.headers[':authority']`.

		@see https://nodejs.org/api/http2.html#http2_request_authority
	**/
	var authority(default, null):String;

	/**
		The `request.complete` property will be `true`
		if the request has been completed, aborted, or destroyed.

		@see https://nodejs.org/api/http2.html#http2_request_complete
	**/
	var complete(default, null):Bool;

	/**
		See `request.socket`.
		@see https://nodejs.org/api/http2.html#http2_request_connection
	**/
	@:deprecated
	var connection(default, null):EitherType<Socket, TLSSocket>;

	/**
		Calls `destroy()` on the `Http2Stream` that received the `Http2ServerRequest`.
		If `error` is provided,
		an `'error'` event is emitted and error is passed as an argument
		to any listeners on the event.

		@see https://nodejs.org/api/http2.html#http2_request_destroy_error
	**/
	function destroy(?error:Error):Void;

	/**
		The request/response headers object.

		@see https://nodejs.org/api/http2.html#http2_request_headers
	**/
	var headers(default, null):HeadersObject;

	/**
		In case of server request, the HTTP version sent by the client.
		In the case of client response, the HTTP version of the connected-to server.
		Returns `'2.0'`.

		@see https://nodejs.org/api/http2.html#http2_request_httpversion
	**/
	var httpVersion(default, null):String;

	/**
		The request method as a string.
		Read-only.
		Examples: `'GET'`, `'DELETE'`.

		@see  https://nodejs.org/api/http2.html#http2_request_method
	**/
	var method(default, null):String;

	/**
		The raw request/response headers list exactly as they were received.

		@see https://nodejs.org/api/http2.html#http2_request_rawheaders
	**/
	var rawHeaders:Array<String>;

	/**
		The raw request/response trailer keys and values exactly as they were received.
		Only populated at the `'end'` event.

		@see https://nodejs.org/api/http2.html#http2_request_rawtrailers
	**/
	var rawTrailer:Array<String>;

	/**
		The request scheme pseudo header field indicating the scheme portion of the target URL.

		@see  https://nodejs.org/api/http2.html#http2_request_scheme
	**/
	var scheme:String;

	/**
		Sets the `Http2Stream`'s timeout value to `msecs`.
		If a callback is provided, then it is added as a listener
		on the `'timeout'` event on the response object.

		@see https://nodejs.org/api/http2.html#http2_request_settimeout_msecs_callback
	**/
	function setTimeout(msecs:Int, callback:Void->Void):Http2ServerRequest;

	/**
		Returns a `Proxy` object that acts as a `net.Socket` (or `tls.TLSSocket`) but
		applies getters, setters, and methods based on HTTP/2 logic.

		@see https://nodejs.org/api/http2.html#http2_request_socket
	**/
	var socket(default, null):EitherType<Socket, TLSSocket>;

	/**
		The `Http2Stream` object backing the request.

		@see https://nodejs.org/api/http2.html#http2_request_stream
	**/
	var stream(default, null):Http2Stream;

	/**
		The request/response trailers object.
		Only populated at the `'end'` event.

		@see https://nodejs.org/api/http2.html#http2_request_trailers
	**/
	var trailers(default, null):Class<Dynamic>;

	/**
		Request URL string.
		This contains only the URL that is present in the actual HTTP request.
		If the request is:
		```
		GET /status?name=ryan HTTP/1.1\r\n
		Accept: text/plain\r\n
		\r\n
		```
		Then `request.url` will be:
		```
		'/status?name=ryan'
		```

		@see https://nodejs.org/api/http2.html#http2_request_url
	**/
	var url(default, null):String;
}
