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

import js.node.net.Socket;
import js.node.net.Server;

typedef NetCreateServerOptions = {
	/**
		Indicates whether half-opened TCP connections are allowed.
		Default: false
	**/
	@:optional var allowHalfOpen:Bool;

	/**
		Indicates whether the socket should be paused on incoming connections.
		Default: false.
	**/
	@:optional var pauseOnConnect:Bool;
}

/**
	Options for the `Net.connect` method (TCP version).
**/
typedef NetConnectOptionsTcp = {
	> SocketOptions,
	> SocketConnectOptionsTcp,
}

/**
	Options for the `Net.connect` method (Local domain socket version).
**/
typedef NetConnectOptionsUnix = {
	> SocketOptions,
	> SocketConnectOptionsUnix,
}

/**
	Enumeration of possible values for `Net.isIP` return.
**/
@:enum abstract NetIsIPResult(Int) to Int {
	var Invalid = 0;
	var IPv4 = 4;
	var IPv6 = 6;
}

/**
	The net module provides you with an asynchronous network wrapper.
	It contains methods for creating both servers and clients (called streams).
**/
@:jsRequire("net")
extern class Net {
	/**
		Aliases to `Net.createConnection()`.

		@see https://nodejs.org/api/net.html#net_net_connect
		@see https://nodejs.org/api/net.html#net_net_connect_options_connectlistener
		@see https://nodejs.org/api/net.html#net_net_connect_port_host_connectlistener
	**/
	@:overload(function(path:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(port:Int, ?host:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(options:NetConnectOptionsTcp):Socket {})
	static function connect(options:NetConnectOptionsUnix, ?connectListener:Void->Void):Socket;

	/**
		A factory function, which creates a new `net.Socket`, immediately initiates connection with `socket.connect()`,
		then returns the `net.Socket` that starts the connection.

		@see https://nodejs.org/api/net.html#net_net_createconnection
	**/
	@:overload(function(path:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(port:Int, ?host:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(options:NetConnectOptionsTcp, ?connectListener:Void->Void):Socket {})
	static function createConnection(options:NetConnectOptionsUnix, ?connectListener:Void->Void):Socket;

	/**
		Creates a new TCP or IPC server.

		@see https://nodejs.org/api/net.html#net_net_createserver_options_connectionlistener
	**/
	static function createServer(?options:NetCreateServerOptions, ?connectionListener:Socket->Void):Server;

	/**
		Tests if input is an IP address.
		Returns `0` for invalid strings, returns `4` for IP version 4 addresses, and returns `6` for IP version 6 addresses.

		@see https://nodejs.org/api/net.html#net_net_isip_input
	**/
	function isIP(input:String):Int;

	/**
		Returns `true` if input is a version 4 IP address, otherwise returns `false`.

		@see https://nodejs.org/api/net.html#net_net_isipv4_input
	**/
	static function isIPv4(input:String):Bool;

	/**
		Returns `true` if input is a version 6 IP address, otherwise returns `false`.

		@see https://nodejs.org/api/net.html#net_net_isipv6_input
	**/
	static function isIPv6(input:String):Bool;
}
