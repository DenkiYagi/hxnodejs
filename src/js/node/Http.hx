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

package js.node;

import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.node.http.*;
import js.node.net.Socket;
import js.node.stream.Duplex;
import js.node.url.URL;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	The HTTP interfaces in Node.js are designed to support many features of the protocol which have been traditionally
	difficult to use.
	In particular, large, possibly chunk-encoded, messages.
	The interface is careful to never buffer entire requests or responses — the user is able to stream data.

	@see https://nodejs.org/api/http.html#http_http
**/
@:jsRequire("http")
extern class Http {
	/**
		A list of the HTTP methods that are supported by the parser.

		@see https://nodejs.org/api/http.html#http_http_methods
	**/
	static var METHODS:Array<String>;

	/**
		A collection of all the standard HTTP response status codes, and the short description of each.
		For example, `http.STATUS_CODES[404] === 'Not Found'`.

		@see https://nodejs.org/api/http.html#http_http_status_codes
	**/
	static var STATUS_CODES(default, null):DynamicAccess<String>;

	/**
		Returns a new instance of `http.Server`.

		@see https://nodejs.org/api/http.html#http_http_createserver_options_requestlistener
	**/
	#if haxe4
	@:overload(function(options:HttpCreateServerOptions, ?requestListener:(request:IncomingMessage, response:ServerResponse) -> Void):Server {})
	static function createServer(?requestListener:(request:IncomingMessage, response:ServerResponse) -> Void):Server;
	#else
	@:overload(function(options:HttpCreateServerOptions, ?requestListener:IncomingMessage->ServerResponse->Void):Server {})
	static function createServer(?requestListener:IncomingMessage->ServerResponse->Void):Server;
	#end

	/**
		Since most requests are GET requests without bodies, Node.js provides this convenience method.
		The only difference between this method and `http.request()` is that it sets the method to GET and calls
		`req.end()` automatically.
		The callback must take care to consume the response data for reasons stated in `http.ClientRequest` section.

		@see https://nodejs.org/api/http.html#http_http_get_options_callback
		@see https://nodejs.org/api/http.html#http_http_get_url_options_callback
	**/
	@:overload(function(url:URL, ?options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest {})
	@:overload(function(url:String, ?options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest {})
	static function get(options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest;

	/**
		Global instance of `Agent` which is used as the default for all HTTP client requests.

		@see https://nodejs.org/api/http.html#http_http_globalagent
	**/
	static var globalAgent:Agent;

	/**
		Read-only property specifying the maximum allowed size of HTTP headers in bytes.
		Defaults to 8KB.
		Configurable using the `--max-http-header-size` CLI option.

		@see https://nodejs.org/api/http.html#http_http_maxheadersize
	**/
	static var maxHeaderSize(default, null):Int;

	/**
		Node.js maintains several connections per server to make HTTP requests.
		This function allows one to transparently issue requests.

		@see https://nodejs.org/api/http.html#http_http_request_options_callback
		@see https://nodejs.org/api/http.html#http_http_request_url_options_callback
	**/
	@:overload(function(url:URL, ?options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest {})
	@:overload(function(url:String, ?options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest {})
	static function request(options:HttpRequestOptions, ?callback:IncomingMessage->Void):ClientRequest;
}

typedef HttpCreateServerOptions = {
	/**
		Specifies the `IncomingMessage` class to be used.
		Useful for extending the original `IncomingMessage`.

		Default: `IncomingMessage`.
	**/
	@:optional var IncomingMessage:Class<Dynamic>;

	/**
		Specifies the `ServerResponse` class to be used.
		Useful for extending the original `ServerResponse`.

		Default: `ServerResponse`.
	**/
	@:optional var ServerResponse:Class<Dynamic>;
}

/**
	Type of the options object passed to `Http.request`.
**/
typedef HttpRequestOptions = {
	/**
		Controls Agent behavior.
		Possible values:

		- `undefined` (default): use `http.globalAgent` for this host and port.
		- `Agent` object: explicitly use the passed in `Agent`.
		- `false`: causes a new `Agent` with default values to be used.
	**/
	@:optional var agent:EitherType<Agent, Bool>;

	/**
		Basic authentication i.e. `'user:password'` to compute an Authorization header.
	**/
	@:optional var auth:String;

	/**
		A function that produces a socket/stream to use for the request when the `agent` option is not used.
		This can be used to avoid creating a custom `Agent` class just to override the default `createConnection`
		function.
		See `agent.createConnection()` for more details.
		Any Duplex stream is a valid return value.
	**/
	#if haxe4
	@:optional var createConnection:(options:SocketConnectOptionsTcp, ?callabck:(err:Error, stream:IDuplex) -> Void) -> IDuplex;
	#else
	@:optional var createConnection:SocketConnectOptionsTcp->?(Error->IDuplex->Void)->IDuplex;
	#end

	/**
		Default port for the protocol.

		Default: `agent.defaultPort` if an `Agent` is used, else `undefined`.
	**/
	@:optional var defaultPort:Int;

	/**
		IP address family to use when resolving `host` or `hostname`.
		Valid values are `4` or `6`.
		When unspecified, both IP v4 and v6 will be used.
	**/
	@:optional var family:js.node.Dns.DnsAddressFamily;

	/**
		An object containing request headers.
	**/
	@:optional var headers:DynamicAccess<EitherType<String, Array<String>>>;

	/**
		A domain name or IP address of the server to issue the request to.

		Default: `'localhost'`.
	**/
	@:optional var host:String;

	/**
		Alias for `host`.
		To support `url.parse()`, hostname will be used if both `host` and `hostname` are specified.
	**/
	@:optional var hostname:String;

	/**
		Local interface to bind for network connections.
	**/
	@:optional var localAddress:String;

	/**
		Custom lookup function.

		Default: `dns.lookup()`.
	**/
	// TODO: Update when DNS is updated.
	@:optional var lookup:Dynamic;

	/**
		Optionally overrides the value of `--max-http-header-size` for requests received from the server, i.e. the
		maximum length of response headers in bytes.

		Default: 8192 (8KB).
	**/
	@:optional var maxHeaderSize:Int;

	/**
		A string specifying the HTTP request method.

		Default: `'GET'`.
	**/
	@:optional var method:Method;

	/**
		Request path.
		Should include query string if any.
		E.G. `'/index.html?page=12'`.
		An exception is thrown when the request path contains illegal characters.
		Currently, only spaces are rejected but that may change in the future.

		Default: `'/'`.
	**/
	@:optional var path:String;

	/**
		Port of remote server.

		Default: `defaultPort` if set, else `80`.
	**/
	@:optional var port:Int;

	/**
		Protocol to use.

		Default: `'http:'`.
	**/
	@:optional var protocol:String;

	/**
		Specifies whether or not to automatically add the `Host` header.
		Defaults to `true`.
	**/
	@:optional var setHost:Bool;

	/**
		Unix Domain Socket (cannot be used if one of `host` or `port` is specified, those specify a TCP Socket).
	**/
	@:optional var socketPath:String;

	/**
		A number specifying the socket timeout in milliseconds.
		This will set the timeout before the socket is connected.
	**/
	@:optional var timeout:Int;
}
