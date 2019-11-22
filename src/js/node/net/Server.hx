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

package js.node.net;

#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.events.EventEmitter;
import js.node.net.Socket.SocketAddress;
import js.node.Net.NetCreateServerOptions;

/**
	Enumeration of events emitted by the `Server` objects
**/
@:enum abstract ServerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when the server closes.
		If connections exist, this event is not emitted until all connections are ended.

		@see https://nodejs.org/api/net.html#net_event_close
	**/
	var Close:ServerEvent<Void->Void> = "close";

	/**
		Emitted when a new connection is made. `socket` is an instance of `net.Socket`.

		@see https://nodejs.org/api/net.html#net_event_connection
	**/
	var Connection:ServerEvent<Socket->Void> = "connection";

	/**
		Emitted when an error occurs.
		Unlike `net.Socket`, the `'close'` event will not be emitted directly following this event unless `server.close()` is manually called.
		See the example in discussion of `server.listen()`.

		@see https://nodejs.org/api/net.html#net_event_error
	**/
	var Error:ServerEvent<Error->Void> = "error";

	/**
		Emitted when the server has been bound after calling `server.listen()`.

		@see https://nodejs.org/api/net.html#net_event_listening
	**/
	var Listening:ServerEvent<Void->Void> = "listening";
}

/**
	Options for the `Server.listen` method
**/
typedef ListenOptions = {
	@:optional var port:Int;
	@:optional var host:String;
	@:optional var path:String;
	@:optional var backlog:Int;
	@:optional var exclusive:Bool;
	@:optional var readableAll:Bool;
	@:optional var writableAll:Bool;
	@:optional var ipv6Only:Bool;
}

/**
	Options for the `Server.listen` method (TCP version).
**/
typedef ServerListenOptionsTcp = {
	@:optional var exclusive:Bool;
	@:optional var port:Int;
	@:optional var host:String;
	@:optional var backlog:Int;
}

/**
	Options for the `Server.listen` method (UNIX version).
**/
typedef ServerListenOptionsUnix = {
	@:optional var exclusive:Bool;
	@:optional var path:String;
}

/**
	This class is used to create a TCP or local server.

	@see https://nodejs.org/api/net.html#net_class_net_server
**/
@:jsRequire("net", "Server")
extern class Server extends EventEmitter<Server> {

	/**
		`net.Server` is an `EventEmitter`.

		@see https://nodejs.org/api/net.html#net_new_net_server_options_connectionlistener
	**/
	function new(?options:NetCreateServerOptions, ?connectionListener:Socket->Void);

	/**
		Returns the bound `address`, the address `family` name, and `port` of the server as reported by the operating system
		if listening on an IP socket (useful to find which port was assigned when getting an OS-assigned address):
		`{ port: 12346, family: 'IPv4', address: '127.0.0.1' }`.

		@see https://nodejs.org/api/net.html#net_server_address
	**/
	@:overload(function():SocketAddress {})
	function address():String;


	/**
		Stops the server from accepting new connections and keeps existing connections.
		This function is asynchronous, the server is finally closed when all connections are ended and the server emits a `'close'` event.
		The optional callback will be called once the `'close'` event occurs.
		Unlike that event, it will be called with an Error as its only argument if the server was not open when it was closed.

		@see https://nodejs.org/api/net.html#net_server_close_callback
	**/
	function close(?callback:Void->Void):Server;

	/**
		The number of concurrent connections on the server.

		@see https://nodejs.org/api/net.html#net_server_connections
	**/
	@:deprecated("please use `getConnections` instead")
	var connections(default, null):Null<Int>;

	/**
		Asynchronously get the number of concurrent connections on the server. Works when sockets were sent to forks.

		@see https://nodejs.org/api/net.html#net_server_getconnections_callback
	**/
	function getConnections(callback:Null<Error>->Int->Void):Server;

	/**
		Start a server listening for connections. A net.Server can be a TCP or an IPC server depending on what it listens to.

		@see https://nodejs.org/api/net.html#net_server_listen
	**/
	@:overload(function(handle:Server, ?backlog:Int, ?callback:Void->Void):Server {})
	@:overload(function(handle:Socket, ?backlog:Int, ?callback:Void->Void):Server {})
	@:overload(function(handle:{fd:Int}, ?backlog:Int, ?callback:Void->Void):Server {})
	@:overload(function(options:ListenOptions, ?callback:Void->Void):Server {})
	@:overload(function(path:String, ?backlog:Int, ?callback:Void->Void):Server {})
	function listen(?port:Int, ?host:String, ?backlog:Int, ?callback:Void->Void):Server;

	/**
		Indicates whether or not the server is listening for connections.

		@see https://nodejs.org/api/net.html#net_server_listening
	**/
	var listening(default, null):Bool;

	/**
		Set this property to reject connections when the server's connection count gets high.

		@see https://nodejs.org/api/net.html#net_server_maxconnections
	**/
	var maxConnections:Int;

	/**
		Opposite of `unref()`, calling `ref()` on a previously `unref` ed server will not let the program exit
		if it's the only server left (the default behavior).
		If the server is `ref` ed calling `ref()` again will have no effect.

		@see https://nodejs.org/api/net.html#net_server_ref
	**/
	function ref():Server;


	/**
		Calling `unref()` on a server will allow the program to exit
		if this is the only active server in the event system.
		If the server is already unrefed calling `unref()` again will have no effect.

		@see https://nodejs.org/api/net.html#net_server_unref
	**/
	function unref():Server;
}
