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

package js.node.http;

import haxe.DynamicAccess;
import js.node.Buffer;
import js.node.events.EventEmitter.Event;
import js.node.net.Socket;
import js.node.stream.Writable;

/**
	Enumeration of events emitted by `ClientRequest`
**/
@:enum abstract ClientRequestEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when the request has been aborted by the client.
		This event is only emitted on the first call to `abort()`.

		@see https://nodejs.org/api/http.html#http_event_abort
	**/
	var Abort:ClientRequestEvent<Void->Void> = "abort";

	/**
		Emitted each time a server responds to a request with a `CONNECT` method.
		If this event is not being listened for, clients receiving a `CONNECT` method will have their connections closed.

		@see https://nodejs.org/api/http.html#http_event_connect
	**/
	#if haxe4
	var Connect:ClientRequestEvent<(response:IncomingMessage, socket:Socket, head:Buffer) -> Void> = "connect";
	#else
	var Connect:ClientRequestEvent<IncomingMessage->Socket->Buffer->Void> = "connect";
	#end

	/**
		Emitted when the server sends a '100 Continue' HTTP response, usually
		because the request contained 'Expect: 100-continue'.
		This is an instruction that the client should send the request body.

		@see https://nodejs.org/api/http.html#http_event_continue
	**/
	var Continue:ClientRequestEvent<Void->Void> = "continue";

	/**
		Emitted when the server sends a 1xx intermediate response (excluding 101 Upgrade).
		The listeners of this event will receive an object containing the HTTP version, status code, status message,
		key-value headers object, and array with the raw header names followed by their respective values.

		@see https://nodejs.org/api/http.html#http_event_information
	**/
	var Information:ClientRequestEvent<InformationEventData->Void> = "information";

	/**
		Emitted when a response is received to this request. This event is emitted only once.

		@see https://nodejs.org/api/http.html#http_event_response
	**/
	var Response:ClientRequestEvent<IncomingMessage->Void> = "response";

	/**
		This event is guaranteed to be passed an instance of the `net.Socket` class, a subclass of `stream.Duplex`,
		unless the user specifies a socket type other than `net.Socket`.

		@see https://nodejs.org/api/http.html#http_event_socket
	**/
	var Socket:ClientRequestEvent<Socket->Void> = "socket";

	/**
		Emitted when the underlying socket times out from inactivity.
		This only notifies that the socket has been idle.
		The request must be aborted manually.

		@see https://nodejs.org/api/http.html#http_event_timeout
	**/
	var Timeout:ClientRequestEvent<Socket->Void> = "timeout";

	/**
		Emitted each time a server responds to a request with an upgrade.
		If this event is not being listened for and the response status code is 101 Switching Protocols, clients
		receiving an upgrade header will have their connections closed.

		@see https://nodejs.org/api/http.html#http_event_upgrade
	**/
	#if haxe4
	var Upgrade:ClientRequestEvent<(response:IncomingMessage, socket:Socket, head:Buffer) -> Void> = "upgrade";
	#else
	var Upgrade:ClientRequestEvent<IncomingMessage->Socket->Buffer->Void> = "upgrade";
	#end
}

/**
	This object is created internally and returned from `http.request()`.
	It represents an in-progress request whose header has already been queued.
	The header is still mutable using the `setHeader(name, value)`, `getHeader(name)`, `removeHeader(name)` API.
	The actual header will be sent along with the first data chunk or when calling `request.end()`.

	@see https://nodejs.org/api/http.html#http_class_http_clientrequest
**/
@:jsRequire("http", "ClientRequest")
extern class ClientRequest extends Writable<ClientRequest> {
	/**
		Marks the request as aborting.
		Calling this will cause remaining data in the response to be dropped and the socket to be destroyed.

		@see https://nodejs.org/api/http.html#http_request_abort
	**/
	function abort():Void;

	/**
		The `request.aborted` property will be `true` if the request has been aborted.

		@see https://nodejs.org/api/http.html#http_request_aborted
	**/
	var aborted(default, null):Bool;

	/**
		See `request.socket`.

		@see https://nodejs.org/api/http.html#http_request_connection
	**/
	@:deprecated
	var connection(default, null):Socket;

	/**
		Finishes sending the request.
		If any parts of the body are unsent, it will flush them to the stream.
		If the request is chunked, this will send the terminating `'0\r\n\r\n'`.

		@see https://nodejs.org/api/http.html#http_request_end_data_encoding_callback
	**/
	@:overload(function(?data:String, ?encoding:String, ?callback:Void->Void):ClientRequest {})
	function end(?data:Buffer, ?encoding:String, ?callback:Void->Void):ClientRequest;

	/**
		The `request.finished` property will be `true` if `request.end()` has been called.
		`request.end()` will automatically be called if the request was initiated via `http.get()`.

		@see https://nodejs.org/api/http.html#http_request_finished
	**/
	@:deprecated
	var finished(default, null):Bool;

	/**
		Flushes the request headers.

		@see https://nodejs.org/api/http.html#http_request_flushheaders
	**/
	function flushHeaders():Void;

	/**
		Reads out a header on the request.
		The name is case-insensitive.
		The type of the return value depends on the arguments provided to `request.setHeader()`.

		@see https://nodejs.org/api/http.html#http_request_getheader_name
	**/
	function getHeader(name:String):haxe.extern.EitherType<String, Array<String>>;

	/**
		Limits maximum response headers count.
		If set to 0, no limit will be applied.

		@see https://nodejs.org/api/http.html#http_request_maxheaderscount
	**/
	var maxHeadersCount:Null<Int>;

	/**
		The request path.

		@see https://nodejs.org/api/http.html#http_request_path
	**/
	var path(default, null):String;

	/**
		Removes a header that's already defined into headers object.

		@see https://nodejs.org/api/http.html#http_request_removeheader_name
	**/
	function removeHeader(name:String):Void;

	/**
		When sending request through a keep-alive enabled agent, the underlying socket might be reused.
		But if server closes connection at unfortunate time, client may run into a 'ECONNRESET' error.

		@see https://nodejs.org/api/http.html#http_request_reusedsocket
	**/
	var reusedSocket(default, null):Bool;

	/**
		Sets a single header value for headers object.
		If this header already exists in the to-be-sent headers, its value will be replaced.
		Use an array of strings here to send multiple headers with the same name.
		Non-string values will be stored without modification.
		Therefore, `request.getHeader()` may return non-string values.
		However, the non-string values will be converted to strings for network transmission.

		@see https://nodejs.org/api/http.html#http_request_setheader_name_value
	**/
	@:overload(function(name:String, value:Array<String>):Void {})
	function setHeader(name:String, value:String):Void;

	/**
		Once a socket is assigned to this request and is connected `socket.setNoDelay()` will be called.

		@see https://nodejs.org/api/http.html#http_request_setnodelay_nodelay
	**/
	function setNoDelay(?noDelay:Bool):Void;

	/**
		Once a socket is assigned to this request and is connected `socket.setKeepAlive()` will be called.

		@see https://nodejs.org/api/http.html#http_request_setsocketkeepalive_enable_initialdelay
	**/
	@:overload(function(?initialDelay:Int):Void {})
	function setSocketKeepAlive(enable:Bool, ?initialDelay:Int):Void;

	/**
		Once a socket is assigned to this request and is connected `socket.setTimeout()` will be called.

		@see https://nodejs.org/api/http.html#http_request_settimeout_timeout_callback
	**/
	function setTimeout(timeout:Int, ?callback:Socket->Void):ClientRequest;

	/**
		Reference to the underlying socket.
		Usually users will not want to access this property.
		In particular, the socket will not emit `'readable'` events because of how the protocol parser attaches to the socket.
		The socket may also be accessed via `request.connection`.

		@see https://nodejs.org/api/http.html#http_request_socket
	**/
	var socket(default, null):Socket;

	// This field is defined in super class.
	// var writableEnded(default, null):Bool;
	// var writableFinished(default, null):Bool;

	/**
		Sends a chunk of the body.
		By calling this method many times, a request body can be sent to a server — in that case it is suggested to use
		the `['Transfer-Encoding', 'chunked']` header line when creating the request.

		@see https://nodejs.org/api/http.html#http_request_write_chunk_encoding_callback
	**/
	@:overload(function(chunk:String, ?encoding:String, ?callback:Void->Void):Bool {})
	function write(chunk:Buffer, ?encoding:String, ?callback:Void->Void):Bool;
}

typedef InformationEventData = {
	var httpVersion:String;
	var httpVersionMajor:Int;
	var httpVersionMinor:Int;
	var statusCode:Int;
	var statusMessage:String;
	var headers:DynamicAccess<String>;
	var rawHeaders:Array<String>;
}
