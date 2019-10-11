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

package js.node.dgram;

import js.lib.Uint8Array;
import haxe.Constraints.Function;
import js.node.events.EventEmitter;
import js.node.net.Socket.SocketAdress;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by `Socket` object.
**/
@:enum abstract SocketEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'close'` event is emitted after a socket is closed with `close()`.

		@see https://nodejs.org/api/dgram.html#dgram_event_close
	**/
	var Close:SocketEvent<Void->Void> = "close";

	/**
		The `'connect'` event is emitted after a socket is associated to a remote address as a result of a successful
		`connect()` call.

		@see https://nodejs.org/api/dgram.html#dgram_event_connect
	**/
	var Connect:SocketEvent<Void->Void> = "connect";

	/**
		The `'error'` event is emitted whenever any error occurs.

		@see https://nodejs.org/api/dgram.html#dgram_event_error
	**/
	var Error:SocketEvent<Error->Void> = "error";

	/**
		The `'listening'` event is emitted whenever a socket begins listening for datagram messages.

		@see https://nodejs.org/api/dgram.html#dgram_event_listening
	**/
	var Listening:SocketEvent<Void->Void> = "listening";

	/**
		The `'message'` event is emitted when a new datagram is available on a socket.

		@see https://nodejs.org/api/dgram.html#dgram_event_message
	**/
	var Message:SocketEvent<MessageListener> = "message";
}

// TODO: fix SocketAdress
typedef MessageListener = Buffer->SocketAdress->Void;

/**
	Encapsulates the datagram functionality.

	@see https://nodejs.org/api/dgram.html#dgram_class_dgram_socket
**/
@:jsRequire("dgram", "Socket")
extern class Socket extends EventEmitter<Socket> {
	@:overload(function(type:SocketType, ?callback:MessageListener):Void {})
	private function new(options:SocketOptions, ?callback:MessageListener);

	/**
		Tells the kernel to join a `multicast` group at the given `multicastAddress` and multicastInterface using the
		`IP_ADD_MEMBERSHIP` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_addmembership_multicastaddress_multicastinterface
	**/
	function addMembership(multicastAddress:String, ?multicastInterface:String):Void;

	/**
		Returns an object containing the address information for a socket.

		@see https://nodejs.org/api/dgram.html#dgram_socket_address
	**/
	function address():SocketAdress;

	/**
		For UDP sockets, causes the `dgram.Socket` to listen for datagram messages on a named `port` and optional
		`address`.

		@see https://nodejs.org/api/dgram.html#dgram_socket_bind_port_address_callback
	**/
	@:overload(function(?port:Int, ?address:String, ?callback:Void->Void):Void {})
	function bind(options:SocketBindOptions, ?callback:Void->Void):Void;

	/**
		Close the underlying socket and stop listening for data on it.

		@see https://nodejs.org/api/dgram.html#dgram_socket_close_callback
	**/
	function close(?callback:Void->Void):Void;

	/**
		Associates the dgram.Socket to a remote address and port.

		@see https://nodejs.org/api/dgram.html#dgram_socket_connect_port_address_callback
	**/
	function connect(port:Int, ?address:String, ?callback:Void->Void):Void;

	/**
		A synchronous function that disassociates a connected `dgram.Socket` from its remote address.

		@see https://nodejs.org/api/dgram.html#dgram_socket_disconnect
	**/
	function disconnect():Void;

	/**
		Instructs the kernel to leave a multicast group at `multicastAddress` using the `IP_DROP_MEMBERSHIP` socket
		option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_dropmembership_multicastaddress_multicastinterface
	**/
	function dropMembership(multicastAddress:String, ?multicastInterface:String):Void;

	/**
		The `SO_RCVBUF` socket receive buffer size in bytes.

		@see https://nodejs.org/api/dgram.html#dgram_socket_getrecvbuffersize
	**/
	function getRecvBufferSize():Int;

	/**
		The `SO_SNDBUF` socket send buffer size in bytes.

		@see https://nodejs.org/api/dgram.html#dgram_socket_getsendbuffersize
	**/
	function getSendBufferSize():Int;

	/**
		By default, binding a socket will cause it to block the Node.js process from exiting as long as the socket is open.

		@see https://nodejs.org/api/dgram.html#dgram_socket_ref
	**/
	function ref():Void;

	/**
		Returns an object containing the `address`, `family`, and `port` of the remote endpoint.

		@see https://nodejs.org/api/dgram.html#dgram_socket_remoteaddress
	**/
	function remoteAddress():SocketAdress;

	/**
		Broadcasts a datagram on the socket.

		@see https://nodejs.org/api/dgram.html#dgram_socket_send_msg_offset_length_port_address_callback
	**/
	@:overload(function(msg:Buffer, ?offset:Int, ?length:Int, ?port:Int, ?address:String, ?callback:Error->Void):Void {})
	@:overload(function(msg:Uint8Array, ?offset:Int, ?length:Int, ?port:Int, ?address:String, ?callback:Error->Void):Void {})
	@:overload(function(msg:String, ?offset:Int, ?length:Int, ?port:Int, ?address:String, ?callback:Error->Void):Void {})
	function send(msg:Array<Dynamic>, ?offset:Int, ?length:Int, ?port:Int, ?address:String, ?callback:Error->Void):Void;

	/**
		Sets or clears the `SO_BROADCAST` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setbroadcast_flag
	**/
	function setBroadcast(flag:Bool):Void;

	/**
		Sets the default outgoing multicast interface of the socket to a chosen interface or back to system interface
		selection.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setmulticastinterface_multicastinterface
	**/
	function setMulticastInterface(multicastInterface:String):Void;

	/**
		Sets or clears the `IP_MULTICAST_LOOP` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setmulticastloopback_flag
	**/
	function setMulticastLoopback(flag:Bool):Void;

	/**
		Sets the `IP_MULTICAST_TTL` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setmulticastttl_ttl
	**/
	function setMulticastTTL(ttl:Int):Void;

	/**
		Sets the `SO_RCVBUF` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setrecvbuffersize_size
	**/
	function setRecvBufferSize(size:Int):Void;

	/**
		Sets the `SO_SNDBUF` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setsendbuffersize_size
	**/
	function setSendBufferSize(size:Int):Void;

	/**
		Sets the `IP_TTL` socket option.

		@see https://nodejs.org/api/dgram.html#dgram_socket_setttl_ttl
	**/
	function setTTL(ttl:Int):Void;

	/**
		By default, binding a socket will cause it to block the Node.js process from exiting as long as the socket is
		open.

		@see https://nodejs.org/api/dgram.html#dgram_socket_unref
	**/
	function unref():Void;
}

/**
	Enumeration of possible datagram socket types.
**/
@:enum abstract SocketType(String) from String to String {
	var Udp4 = "udp4";
	var Udp6 = "udp6";
}

/**
	Options object used by `Dgram.createSocket`.
**/
typedef SocketOptions = {
	/**
		The family of socket.
	**/
	var type:SocketType;

	/**
		When `true` `socket.bind()` will reuse the address, even if another process has already bound a socket on it.

		Default: `false`.
	**/
	@:optional var reuseAddr:Bool;

	/**
		Setting `ipv6Only` to `true` will disable dual-stack support, i.e., binding to address `::` won't make `0.0.0.0`
		be bound.

		Default: `false`.
	**/
	@:optional var ipv6Only:Bool;

	/**
		Sets the `SO_RCVBUF` socket value.
	**/
	@:optional var recvBufferSize:Int;

	/**
		Sets the `SO_SNDBUF` socket value.
	**/
	@:optional var sendBufferSize:Int;

	/**
		Custom lookup function.

		Default: `dns.lookup()`.
	**/
	@:optional var lookup:Function;
}

/**
	Options object used by `Socket.bind` method.
**/
typedef SocketBindOptions = {
	@:optional var port:Int;
	@:optional var address:String;
	@:optional var exclusive:Bool;
	@:optional var fd:Int;
}
