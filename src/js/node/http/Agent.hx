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
import js.node.net.Socket;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	An `Agent` is responsible for managing connection persistence and reuse for HTTP clients.
	It maintains a queue of pending requests for a given host and port, reusing a single socket connection for each
	until the queue is empty, at which time the socket is either destroyed or put into a pool where it is kept to be
	used again for requests to the same host and port.
	Whether it is destroyed or pooled depends on the `keepAlive` option.

	@see https://nodejs.org/api/http.html#http_class_http_agent
**/
@:jsRequire("http", "Agent")
extern class Agent {
	/**
		`options` in `socket.connect()` are also supported.

		@see https://nodejs.org/api/http.html#http_class_http_agent
	**/
	function new(?options:HttpAgentOptions);

	/**
		Produces a socket/stream to be used for HTTP requests.

		@see https://nodejs.org/api/http.html#http_agent_createconnection_options_callback
	**/
	#if haxe4
	function createConnection(options:SocketConnectOptionsTcp, ?callback:(err:Error, stream:Socket) -> Void):Socket;
	#else
	function createConnection(options:SocketConnectOptionsTcp, ?callback:Error->Socket->Void):Socket;
	#end

	/**
		Called when `socket` is detached from a request and could be persisted by the `Agent`.

		@see https://nodejs.org/api/http.html#http_agent_keepsocketalive_socket
	**/
	function keepSocketAlive(socket:Socket):Void;

	/**
		Called when `socket` is attached to `request` after being persisted because of the keep-alive options.

		@see https://nodejs.org/api/http.html#http_agent_reusesocket_socket_request
	**/
	function reuseSocket(socket:Socket, request:ClientRequest):Void;

	/**
		Destroy any sockets that are currently in use by the agent.

		@see https://nodejs.org/api/http.html#http_agent_destroy
	**/
	function destroy():Void;

	/**
		An object which contains arrays of sockets currently awaiting use by the agent when `keepAlive` is enabled.
		Do not modify.

		@see https://nodejs.org/api/http.html#http_agent_freesockets
	 */
	var freeSockets(default, null):DynamicAccess<Array<Socket>>;

	/**
		Get a unique name for a set of request options, to determine whether a connection can be reused.
		For an HTTP agent, this returns `host:port:localAddress` or `host:port:localAddress:family`.
		For an HTTPS agent, the name includes the CA, cert, ciphers, and other HTTPS/TLS-specific options that determine
		socket reusability.

		@see https://nodejs.org/api/http.html#http_agent_getname_options
	**/
	function getName(options:js.node.Http.HttpRequestOptions):String;

	/**
		By default set to 256.
		For agents with `keepAlive` enabled, this sets the maximum number of sockets that will be left open in the free
		state.

		@see https://nodejs.org/api/http.html#http_agent_maxfreesockets
	**/
	var maxFreeSockets:Float;

	/**
		By default set to `Infinity`.
		Determines how many concurrent sockets the agent can have open per origin.
		Origin is the returned value of `agent.getName()`.

		@see https://nodejs.org/api/http.html#http_agent_maxsockets
	**/
	var maxSockets:Float;

	/**
		An object which contains queues of requests that have not yet been assigned to sockets.
		Do not modify.

		@see https://nodejs.org/api/http.html#http_agent_requests
	**/
	var requests(default, null):DynamicAccess<Array<ClientRequest>>;

	/**
		An object which contains arrays of sockets currently in use by the agent.
		Do not modify.

		@see https://nodejs.org/api/http.html#http_agent_sockets
	**/
	var sockets(default, null):DynamicAccess<Array<Socket>>;
}

/**
	Options for `Agent` constructor.
**/
typedef HttpAgentOptions = {
	/**
		Keep sockets around even when there are no outstanding requests, so they can be used for future requests without
		having to reestablish a TCP connection.
		Not to be confused with the `keep-alive` value of the `Connection` header.
		The `Connection: keep-alive` header is always sent when using an agent except when the `Connection` header is
		explicitly specified or when the `keepAlive` and `maxSockets` options are respectively set to `false` and
		`Infinity`, in which case `Connection: close` will be used.

		Default: `false`.
	**/
	@:optional var keepAlive:Bool;

	/**
		When using the `keepAlive` option, specifies the
		[initial delay](https://nodejs.org/api/net.html#net_socket_setkeepalive_enable_initialdelay) for TCP Keep-Alive
		packets.
		Ignored when the `keepAlive` option is `false` or `undefined`.

		Default: `1000`.
	**/
	@:optional var keepAliveMsecs:Int;

	/**
		Maximum number of sockets to allow per host.
		Each request will use a new socket until the maximum is reached.

		Default: `Infinity`.
	**/
	@:optional var maxSockets:Int;

	/**
		Maximum number of sockets to leave open in a free state.
		Only relevant if `keepAlive` is set to `true`.

		Default: `256`.
	**/
	@:optional var maxFreeSockets:Int;

	/**
		Socket timeout in milliseconds.
		This will set the timeout when the socket is created.
	**/
	@:optional var timeout:Int;
}
