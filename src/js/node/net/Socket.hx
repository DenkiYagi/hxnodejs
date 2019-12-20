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

import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.lib.ArrayBufferView;
import js.node.Dns;
import js.node.events.EventEmitter.Event;

/**
	Enumeration of events for `Socket` objects.
**/
@:enum abstract SocketEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted once the socket is fully closed.
		The argument hadError is a boolean which says if the socket was closed due to a transmission error.

		@see https://nodejs.org/api/net.html#net_event_close_1
	**/
	var Close:SocketEvent<Bool->Void> = "close";

	/**
		Emitted when a socket connection is successfully established.
		See `net.createConnection`.

		@see https://nodejs.org/api/net.html#net_event_connect
	**/
	var Connect:SocketEvent<Void->Void> = "connect";

	/**
		Emitted when data is received.
		The argument data will be a `Buffer` or `String`.
		Encoding of data is set by `Socket.setEncoding()`.

		@see https://nodejs.org/api/net.html#net_event_data
	**/
	var Data:SocketEvent<EitherType<Buffer, String>->Void> = "data";

	/**
		Emitted when the write buffer becomes empty.
		Can be used to throttle uploads.

		@see https://nodejs.org/api/net.html#net_event_drain
	**/
	var Drain:SocketEvent<Void->Void> = "drain";

	/**
		Emitted when the other end of the socket sends a FIN packet, thus ending the readable side of the socket.

		@see https://nodejs.org/api/net.html#net_event_end
	**/
	var End:SocketEvent<Void->Void> = "end";

	/**
		Emitted when an error occurs.
		The `'close'` event will be called directly following this event.

		@see https://nodejs.org/api/net.html#net_event_error_1
	**/
	var Error:SocketEvent<Error->Void> = "error";

	/**
		Emitted after resolving the hostname but before connecting.
		Not applicable to UNIX sockets.

		@see https://nodejs.org/api/net.html#net_event_lookup
	**/
	var Lookup:SocketEvent<Null<Error>->String->Null<String>->String->Void> = "lookup";

	/**
		Emitted when a socket is ready to be used.

		@see https://nodejs.org/api/net.html#net_event_ready
	**/
	var Ready:SocketEvent<Void->Void> = "ready";

	/**
		Emitted if the socket times out from inactivity.
		This is only to notify that the socket has been idle.
		The user must manually close the connection.

		@see https://nodejs.org/api/net.html#net_event_timeout
	**/
	var Timeout:SocketEvent<Void->Void> = "timeout";
}

/**
	Options for creating new `Socket` object.
**/
typedef SocketOptions = {
	/**
		allows you to specify the existing file descriptor of socket.
	**/
	@:optional var fd:Int;

	/*+
		Indicates whether half-opened TCP connections are allowed.
		See `Net.createServer()` and the `'end'` event for details.
		Default: `false`.
	**/
	@:optional var allowHalfOpen:Bool;

	/**
		allow reads on this socket (NOTE: Works only when `fd` is passed)
		Default: `false`.
	**/
	@:optional var readable:Bool;

	/**
		allow writes on this socket (NOTE: Works only when `fd` is passed)
		Default: `false`
	**/
	@:optional var writable:Bool;
}

/**
	A member that both `SocketConnectOptionsTcp` and `SocketConnectOptionsUnix` contain
**/
typedef Onread = {
	var buffer:EitherType<EitherType<Buffer, ArrayBufferView>, Void->EitherType<Buffer, ArrayBufferView>>;
	var callback:Int->EitherType<Buffer, ArrayBufferView>->Bool;
};

/**
	Options for the `Socket.connect` method (TCP version).
**/
typedef SocketConnectOptionsTcp = {
	/**
		Port the client should connect to
	**/
	var port:Int;

	/**
		Host the client should connect to.
		Defaults to 'localhost'.
	**/
	@:optional var host:String;

	/**
		Local interface to bind to for network connections.
	**/
	@:optional var localAddress:String;

	/**
		Local port to bind to for network connections.
	**/
	@:optional var localPort:Int;

	/**
		Version of IP stack. Defaults to 4.
	**/
	@:optional var family:DnsAddressFamily;

	/**
		`Dns.lookup()` hints
	**/
	@:optional var hints:Int;

	/**
		Custom lookup function. Defaults to `Dns.lookup`.
	**/
	@:optional var lookup:String->DnsLookupOptions->DnsLookupCallbackSingle->Void;

	/**
		If specified, incoming data is stored in a single `buffer` and passed to the supplied `callback`
		when data arrives on the socket.
		Note: this will cause the streaming functionality to not provide any data,
		however events like `'error'`, `'end'`, and `'close'` will still be emitted as normal and methods
		like `pause()` and `resume()` will also behave as expected.
	**/
	@:optional var onread:Onread;
}

/**
	Options for the `Socket.connect` method (Local domain socket version).
**/
typedef SocketConnectOptionsUnix = {
	/**
		Path the client should connect to
	**/
	var path:String;

	/**
		If specified, incoming data is stored in a single `buffer` and passed to the supplied `callback`
		when data arrives on the socket.
		Note: this will cause the streaming functionality to not provide any data,
		however events like `'error'`, `'end'`, and `'close'` will still be emitted as normal and methods
		like `pause()` and `resume()` will also behave as expected.
	**/
	@:optional var onread:Onread;
}

/**
	Bound address, the address family name and port of the socket as reported by the operating system.
**/
typedef SocketAddress = {
	/**
		Connection port.
	**/
	var port:Int;

	/**
		IP Family.
	**/
	var family:SocketAddressFamily;

	/**
		IP Address.
	**/
	var address:String;
}

/**
	Enumeration of possible socket family values.
**/
@:enum abstract SocketAddressFamily(String) to String {
	var IPv4 = "IPv4";
	var IPv6 = "IPv6";
}

/**
	This class is an abstraction of a TCP socket or a streaming `IPC` endpoint
	(uses named pipes on Windows, and Unix domain sockets otherwise).
	It is also an `EventEmitter`.

	@see https://nodejs.org/api/net.html#net_class_net_socket
**/
@:jsRequire("net", "Socket")
extern class Socket extends js.node.stream.Duplex<Socket> {
	/**
		Creates a new socket object.

		@see https://nodejs.org/api/net.html#net_new_net_socket_options
	**/
	function new(?options:SocketOptions);

	/**
		Returns the bound address, the address `family` name and `port` of the socket as reported by the operating system:
		`{ port: 12346, family: 'IPv4', address: '127.0.0.1' }`

		@see https://nodejs.org/api/net.html#net_socket_address
	**/
	function address():SocketAddress;

	/**
		`net.Socket` has the property that `socket.write()` always works.
		This is to help users get up and running quickly.
		The computer cannot always keep up with the amount of data that is written to a socket.
		The network connection simply might be too slow.
		Node.js will internally queue up the data written to a socket and send it out over the wire when it is possible.
		(Internally it is polling on the socket's file descriptor for being writable).

		@see https://nodejs.org/api/net.html#net_socket_buffersize
	**/
	var bufferSize:Int;

	/**
		The amount of received bytes.

		@see https://nodejs.org/api/net.html#net_socket_bytesread
	**/
	var bytesRead(default, null):Int;

	/**
		The amount of bytes sent.

		@see https://nodejs.org/api/net.html#net_socket_byteswritten
	**/
	var bytesWritten(default, null):Int;

	/**
		Initiate a connection on a given socket.

		@see https://nodejs.org/api/net.html#net_socket_connect
	**/
	@:overload(function(path:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(port:Int, ?host:String, ?connectListener:Void->Void):Socket {})
	@:overload(function(options:SocketConnectOptionsTcp, connectListener:Void->Void):Socket {})
	function connect(options:SocketConnectOptionsUnix, ?connectListener:Void->Void):Socket;

	/**
		If `true`, `socket.connect(options[, connectListener])` was called and has not yet finished.
		It will stay `true` until the socket becomes connected,
		then it is set to `false` and the `'connect'` event is emitted.
		Note that the `socket.connect(options[, connectListener])` callback is a listener
		for the `'connect'` event.

		@see https://nodejs.org/api/net.html#net_socket_connecting
	**/
	var connectiong(default, null):Bool;

	#if haxe4
	/**
		Ensures that no more I/O activity happens on this socket.
		Only necessary in case of errors (parse error or so).

		@see https://nodejs.org/api/net.html#net_socket_destroy_exception
	**/
	function destroy(?exception:Error):Socket;
	#end

	/**
		A boolean value that indicates if the connection is destroyed or not.
		Once a connection is destroyed no further data can be transferred using it.

		@see https://nodejs.org/api/net.html#net_socket_destroyed

		define in Stream/Readable.hx
	**/
	// var destroyed(default, null):Bool;

	/**
		Half-closes the socket. i.e., it sends a FIN packet. It is possible the server will still send some data.

		@see https://nodejs.org/api/net.html#net_socket_end_data_encoding_callback
	**/
	@:overload(function(?data:String, ?encoding:String, ?callback:Void->Void):Socket {})
	@:overload(function(?data:Buffer, ?encoding:String, ?callback:Void->Void):Socket {})
	function end(?data:ArrayBufferView, ?encoding:String, ?callback:Void->Void):Socket;

	/**
		The string representation of the local IP address the remote client is connecting on.
		For example, in a server listening on `'0.0.0.0'`, if a client connects on `'192.168.1.1'`,
		the value of socket.localAddress would be `'192.168.1.1'`.

		@see https://nodejs.org/api/net.html#net_socket_localaddress
	**/
	var localAddress(default, null):String;

	/**
		The numeric representation of the local port.
		For example, `80` or `21`.

		@see https://nodejs.org/api/net.html#net_socket_localport
	**/
	var localPort(default, null):Int;

	/**
		Pauses the reading of data.
		That is, `'data'` events will not be emitted. Useful to throttle back an upload.

		@see https://nodejs.org/api/net.html#net_socket_pause
	**/
	function pause():Socket;

	/**
		This is `true` if the socket is not connected yet,
		either because `.connect()` has not yet been called or
		because it is still in the process of connecting (see `socket.connecting`).

		@see https://nodejs.org/api/net.html#net_socket_pending
	**/
	var pending(default, null):Bool;

	/**
		Opposite of `unref()`, calling `ref()` on a previously `unref`ed socket will not let the program exit
		if it's the only socket left (the default behavior).
		If the socket is `ref`ed calling ref again will have no effect.

		@see https://nodejs.org/api/net.html#net_socket_ref
	**/
	function ref():Socket;

	/**
		The string representation of the remote IP address.
		For example, `'74.125.127.100'` or `'2001:4860:a005::68'`.
		Value may be `null` if the socket is destroyed (for example, if the client disconnected).

		@see https://nodejs.org/api/net.html#net_socket_remoteaddress
	**/
	var remoteAddress(default, null):Null<String>;

	/**
		The string representation of the remote IP family.
		`'IPv4'` or `'IPv6'`.

		@see https://nodejs.org/api/net.html#net_socket_remotefamily
	**/
	var remoteFamily(default, null):SocketAddressFamily;

	/**
		The numeric representation of the remote port.
		For example, `80` or `21`.

		@see https://nodejs.org/api/net.html#net_socket_remoteport
	**/
	var remotePort(default, null):Int;

	/**
		Resumes reading after a call to `socket.pause()`.

		@see https://nodejs.org/api/net.html#net_socket_resume
	**/
	function resume():Socket;

	/**
		Set the encoding for the socket as a Readable Stream.
		See `readable.setEncoding()` for more information.

		@see https://nodejs.org/api/net.html#net_socket_setencoding_encoding
	**/
	function setEncoding(?encoding:String):Socket;

	/**
		Enable/disable keep-alive functionality, and optionally set the initial delay
		before the first keepalive probe is sent on an idle socket.

		@see https://nodejs.org/api/net.html#net_socket_setkeepalive_enable_initialdelay
	**/
	function setKeepAlive(?enable:Bool, ?initialDelay:Int):Socket;

	/**
		Disables the Nagle algorithm.
		By default TCP connections use the Nagle algorithm, they buffer data before sending it off.
		Setting true for noDelay will immediately fire off data each time `socket.write()` is called.

		@see https://nodejs.org/api/net.html#net_socket_setnodelay_nodelay
	**/
	function setNoDelay(?noDelay:Bool):Socket;

	/**
		Sets the socket to timeout after timeout milliseconds of inactivity on the socket.
		By default net.Socket do not have a timeout.

		@see https://nodejs.org/api/net.html#net_socket_settimeout_timeout_callback
	**/
	function setTimeout(timeout:Int, ?callback:Void->Void):Socket;

	/**
		Calling `unref()` on a socket will allow the program to exit if this is the only active socket in the event system.
		If the socket is already `unref`ed calling `unref()` again will have no effect.

		@see https://nodejs.org/api/net.html#net_socket_unref
	**/
	function unref():Socket;

	/**
		Sends data on the socket.
		The second parameter specifies the encoding in the case of a string — it defaults to UTF8 encoding.

		@see https://nodejs.org/api/net.html#net_socket_write_data_encoding_callback
	**/
	@:overload(function(data:String, ?encoding:String, ?callback:Void->Void):Bool {})
	@:overload(function(data:Buffer, ?encoding:String, ?callback:Void->Void):Bool {})
	function write(data:ArrayBufferView, ?encoding:String, ?callback:Void->Void):Bool;
}
