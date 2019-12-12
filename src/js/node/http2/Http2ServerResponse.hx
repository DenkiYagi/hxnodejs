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
import haxe.display.JsonModuleTypes.JsonFunctionSignature;
import js.node.stream.Readable;
import js.node.Http2.HeadersObject;
import js.node.events.EventEmitter.Event;

/**
	Enumeration of events for `Http2ServerResponse` objects.
**/
@:enum abstract Http2ServerResponseEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Indicates that the underlying Http2Stream was terminated
		before `response.end()` was called or able to flush.

		@see https://nodejs.org/api/http2.html#http2_event_close_3
	**/
	var Close:Http2ServerResponseEvent<Void->Void> = "close";

	/**
		Emitted when the response has been sent.
		More specifically, this event is emitted when the last segment of the response headers and body
		have been handed off to the HTTP/2 multiplexing for transmission over the network.
		It does not imply that the client has received anything yet.

		@see https://nodejs.org/api/http2.html#http2_event_finish
	**/
	var Finish:Http2ServerResponseEvent<Void->Void> = "finish";
}

/**
	  This object is created internally by an HTTP server — not by the user. It is passed as the second parameter to the 'request' event.

	@see https://nodejs.org/api/http2.html#http2_class_http2_http2serverresponse
**/
@:jsRequire("http2", "Http2ServerResponse")
extern class Http2ServerResponse extends Stream<Http2ServerResponse> {
	/**
		This method adds HTTP trailing headers (a header but at the end of the message) to the response.

		@see https://nodejs.org/api/http2.html#http2_response_addtrailers_headers
	**/
	function addTrailers(headers:HeadersObject):Void;

	/**
		See `response.socket`.
		@see https://nodejs.org/api/http2.html#http2_response_connection
	**/
	@:deprecated
	var connection:EitherType<Socket, TLSSocket>;

	/**
		This method signals to the server that all of the response headers and body have been sent;
		that server should consider this message complete.
		The method, `response.end()`, MUST be called on each response.

		@see https://nodejs.org/api/http2.html#http2_response_end_data_encoding_callback
	**/
	@:overload(function(?data:String, ?encoding:String, ?callback:Void->Void):Http2ServerResponse {})
	function end(?data:Buffer, ?encoding:String, ?callback:Void->Void):Http2ServerResponse;

	/**
		Boolean value that indicates whether the response has completed.
		Starts as `false`.
		After `response.end()` executes, the value will be `true`.

		@see https://nodejs.org/api/http2.html#http2_response_finished
	**/
	var finished(default, null):Bool;

	/**
		Reads out a header that has already been queued but not sent to the client.
		The name is case-insensitive.

		@see https://nodejs.org/api/http2.html#http2_response_getheader_name
	**/
	function getHeader(name:String):String;

	/**
		Returns an array containing the unique names of the current outgoing headers.
		All header names are lowercase.

		@see https://nodejs.org/api/http2.html#http2_response_getheadernames
	**/
	function getHeaderNames():Array<String>;

	/**
		Returns a shallow copy of the current outgoing headers. Since a shallow copy is used,
		array values may be mutated without additional calls to various header-related http module methods.
		The keys of the returned object are the header names and the values are the respective header values.
		All header names are lowercase.

		@see https://nodejs.org/api/http2.html#http2_response_getheaders
	**/
	function getHeaders():Class<Dynamic>;

	/**
		Returns `true` if the header identified by `name` is currently set in the outgoing headers.
		The header name matching is case-insensitive.

		@see https://nodejs.org/api/http2.html#http2_response_hasheader_name
	**/
	function hasHeader(name:String):Bool;

	/**
		True if headers were sent, false otherwise (read-only).

		@see https://nodejs.org/api/http2.html#http2_response_headerssent
	**/
	var headersSend(default, null):Bool;

	/**
		Removes a header that has been queued for implicit sending.

		@see https://nodejs.org/api/http2.html#http2_response_removeheader_name
	**/
	function removeHeader(name:String):Void;

	/**
		When true, the Date header will be automatically generated and sent in the response
		if it is not already present in the headers.
		Defaults to true.

		@see https://nodejs.org/api/http2.html#http2_response_senddate
	**/
	var sendDate(default, null):Bool;

	/**
		Sets a single header value for implicit headers.
		If this header already exists in the to-be-sent headers, its value will be replaced.
		Use an array of strings here to send multiple headers with the same name.

		@see https://nodejs.org/api/http2.html#http2_response_setheader_name_value
	**/
	@:overload(function(name:String, values:String):Void {})
	function setHeader(name:String, values:Array<String>):Void;

	/**
		Sets the `Http2Stream`'s timeout value to msecs.
		If a callback is provided,
		then it is added as a listener on the `'timeout'` event on the response object.

		@see https://nodejs.org/api/http2.html#http2_response_settimeout_msecs_callback
	**/
	function setTimeout(msecs:Int, ?callback:Void->Void):Http2ServerResponse;

	/**
		Returns a `Proxy` object that acts as a `net.Socket` (or `tls.TLSSocket`)
		but applies getters, setters, and methods based on HTTP/2 logic.

		@see https://nodejs.org/api/http2.html#http2_response_socket
	**/
	var socket:EitherType<Socket, TLSSocket>;

	/**
		When using implicit headers (not calling `response.writeHead()` explicitly),
		this property controls the status code that will be sent to the client when the headers get flushed.

		@see https://nodejs.org/api/http2.html#http2_response_statuscode
	**/
	var statusCode(default, null):Int;

	/**
		Status message is not supported by HTTP/2 (RFC 7540 8.1.2.4).
		It returns an empty string.

		@see https://nodejs.org/api/http2.html#http2_response_statusmessage
	**/
	var statusMessage(default, null):String;
}
