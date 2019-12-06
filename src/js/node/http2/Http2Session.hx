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
import js.node.events.EventEmitter.Event;
import js.node.events.EventEmitter;
import js.node.net.Socket;
import js.node.tls.TLSSocket;
import js.node.Http2.Http2SettingsObject;
import haxe.extern.EitherType;
import haxe.io.ArrayBufferView;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `Http2Session` objects.
**/
@:enum abstract Http2SessionEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'close'` event is emitted once the `Http2Session` has been destroyed.
		Its listener does not expect any arguments.
	**/
	var Close:Http2SessionEvent<Void->Void> = "close";

	/**
		The `'connect'` event is emitted once the `Http2Session` has been successfully connected to
		the remote peer and communication may begin.
	**/
	var Connect:Http2SessionEvent<Http2Session->Socket->Void> = "connect";

	/**
		The `'error'` event is emitted when an error occurs during the processing of an `Http2Session`.
	**/
	var Error:Http2SessionEvent<Error->Void> = "error";

	/**
		The `'frameError'` event is emitted when an error occurs while attempting to send a frame on the session.
		If the frame that could not be sent is associated with a specific `Http2Stream`,
		an attempt to emit a `'frameError'` event on the `Http2Stream` is made.
	**/
	var FrameError:Http2SessionEvent<Int->Int->Int->Void> = "frameError";

	/**
		The `'goaway'` event is emitted when a GOAWAY frame is received.
	**/
	var Goaway:Http2SessionEvent<Int->Int->Buffer->Void> = "goaway";

	/**
		The `'localSettings'` event is emitted when an acknowledgment `SETTINGS` frame has been received.
	**/
	var LocalSettings:Http2SessionEvent<Http2SettingsObject->Void> = "localSettings";

	/**
		The `'ping'` event is emitted whenever a PING frame is received from the connected peer.
	**/
	var Ping:Http2SessionEvent<Http2SettingsObject->Void> = "ping";

	/**
		The `'remoteSettings'` event is emitted when a new SETTINGS frame is received from the connected peer.
	**/
	var remoteSettings:Http2SessionEvent<Http2SettingsObject->Void> = "remoteSettings";

	/**
		The `'stream'` event is emitted when a new Http2Stream is created.
	**/
	var Stream:Http2SessionEvent<Http2SettingsObject->Void> = "stream";

	/**
		After the `Http2session.setTimeout()` method is used to set the timeout period for this Http2Session,
		the `'timeout'` event is emitted if there is no activity on the `Http2Session`
		after the configured number of milliseconds.
		Its listener does not expect any arguments.
	**/
	var Timeout:Http2SessionEvent<Void->Void> = "timeout";
}

/**
	Instances of the `Http2.Http2Session` class represent an active communications session between an HTTP/2 client and server.
	Instances of this class are not intended to be constructed directly by user code.

	@see https://nodejs.org/api/http2.html#http2_class_http2session
**/
@:jsRequire("http2", "Http2Session")
extern class Http2Session extends EventEmitter<Http2Session> {
	/**
		Value will be `null` if the `Http2Session` is not yet connected to a socket,
		`h2c` if the `Http2Session` is not connected to a `TLSSocket`,
		or will return the value of the connected `TLSSocket`'s own `alpnProtocol` property.

		@see https://nodejs.org/api/http2.html#http2_http2session_alpnprotocol
	**/
	var alpnProtocol(default, null):Null<String>;

	/**
		Gracefully closes the `Http2Session`,
		allowing any existing streams to complete on their own and
		preventing new `Http2Stream` instances from being created.
		Once closed, `http2session.destroy()` might be called
		if there are no open `Http2Stream` instances.

		@see https://nodejs.org/api/http2.html#http2_http2session_close_callback
	**/
	function close(?callback:Void->Void):Void;

	/**
		Will be `true` if this `Http2Session` instance has been closed, otherwise `false`.

		@see https://nodejs.org/api/http2.html#http2_http2session_closed
	**/
	var closed(default, null):Bool;

	/**
		Will be `true` if this `Http2Session` instance is still connecting,
		will be set to `false` before emitting `connect` event and/or calling the `Http2.connect` callback.

		@see https://nodejs.org/api/http2.html#http2_http2session_connecting
	**/
	var connectiong(default, null):Bool;

	/**
		Immediately terminates the Http2Session and the associated `net.Socket` or `tls.TLSSocket`.

		@see https://nodejs.org/api/http2.html#http2_http2session_destroy_error_code
	**/
	function destroy(?error:Error, ?code:Int):Void;

	/**
		Will be `true` if this `Http2Session` instance has been destroyed and must no longer be used,
		otherwise `false`.

		@see https://nodejs.org/api/http2.html#http2_http2session_destroy_error_code
	**/
	var destroyed(default, null):Bool;

	/**
		Value is `null` if the `Http2Session` session socket has not yet been connected,
		`true` if the `Http2Session` is connected with a `TLSSocket`,
		and `false` if the `Http2Session` is connected to any other kind of socket or stream.

		@see https://nodejs.org/api/http2.html#http2_http2session_encrypted
	**/
	var encrypted(default, null):Null<Bool>;

	/**
		Transmits a `GOAWAY` frame to the connected peer without shutting down the `Http2Session`.

		@see https://nodejs.org/api/http2.html#http2_http2session_goaway_code_laststreamid_opaquedata
	**/
	@:overload(function(?code:Int, ?lastStreamID:Int, ?opaqueData:Buffer):Void {})
	function goaway(?code:Int, ?lastStreamID:Int, ?opaqueData:ArrayBufferView):Void;

	/**
		A prototype-less object describing the current local settings of this `Http2Session`.
		The local settings are local to this `Http2Session` instance.

		@see https://nodejs.org/api/http2.html#http2_http2session_localsettings
	**/
	var localSettings(default, null):Http2SettingsObject;

	/**
		If the `Http2Session` is connected to a `TLSSocket`,
		the originSet property will return an `Array` of origins
		for which the `Http2Session` may be considered authoritative.

		@see https://nodejs.org/api/http2.html#http2_http2session_originset
	**/
	var originSet(default, null):Null<Array<String>>;

	/**
		Indicates whether the Http2Session is currently waiting for acknowledgment of a sent `SETTINGS` frame.
		Will be `true` after calling the `http2session.settings()` method.
		Will be `false` once all sent `SETTINGS` frames have been acknowledged.

		@see https://nodejs.org/api/http2.html#http2_http2session_pendingsettingsack
	**/
	var pendingSettingsAck(default, null):Bool;

	/**
		Sends a `PING` frame to the connected HTTP/2 peer.
		A `callback` function must be provided.
		The method will return `true` if the `PING` was sent, `false` otherwise.

		@see https://nodejs.org/api/http2.html#http2_http2session_ping_payload_callback
	**/
	@:overload(function(?payload:Buffer, callback:Null<Error>->Int->?Buffer->Void):Bool {})
	function ping(?payload:ArrayBufferView, callback:Null<Error>->Int->?Buffer->Void):Bool;

	/**
		Calls `ref()` on this `Http2Session` instance's underlying `net.Socket`.

		@see https://nodejs.org/api/http2.html#http2_http2session_ref
	**/
	function ref():Socket;

	/**
		A prototype-less object describing the current remote settings of this `Http2Session`.
		The remote settings are set by the connected HTTP/2 peer.

		@see https://nodejs.org/api/http2.html#http2_http2session_remotesettings
	**/
	var remoteSettings(default, null):Http2SettingsObject;

	/**
		Used to set a callback function that is called when there is no activity on the `Http2Session` after `msecs` milliseconds.
		The given `callback` is registered as a listener on the `'timeout'` event.

			   @see https://nodejs.org/api/http2.html#http2_http2session_settimeout_msecs_callback
	**/
	function setTimeout(msecs:Int, callback:Void->Void):Void;

	/**
		Returns a `Proxy` object that acts as a `net.Socket` (or `tls.TLSSocket`)
		but limits available methods to ones safe to use with HTTP/2.

		@see https://nodejs.org/api/http2.html#http2_http2session_socket
	**/
	var socket(default, null):EitherType<Socket, TLSSocket>;

	/**
		Provides miscellaneous information about the current state of the `Http2Session`.

		@see https://nodejs.org/api/http2.html#http2_http2session_state
	**/
	var state(default, null):Http2StateObject;

	/**
		Provides miscellaneous information about the current state of the `Http2Session`.

		@see https://nodejs.org/api/http2.html#http2_http2session_state
	**/
	function settings(?settings:Http2SettingsObject, callback:Null<Error>->Http2SettingsObject->Int->Void):Void;

	/**
		The `http2session.type` will be equal to `http2.constants.NGHTTP2_SESSION_SERVER`
		if this `Http2Session` instance is a server,
		and `http2.constants.NGHTTP2_SESSION_CLIENT`
		if the instance is a client.

		@see https://nodejs.org/api/http2.html#http2_http2session_type
	**/
	var type(default, null):Int;

	/**
		Calls `unref()` on this `Http2Session` instance's underlying `net.Socket`.

		@see https://nodejs.org/api/http2.html#http2_http2session_unref
	**/
	function unref():Socket;
}

typedef Http2StateObject = {
	/**
		The current local (receive) flow control window size for the `Http2Session`.
	**/
	var effectiveLocalWindowSize:Int;

	/**
		The current number of bytes that have been received since the last flow control `WINDOW_UPDATE`.
	**/
	var effectiveRecvDataLength:Int;

	/**
		The numeric identifier to be used the next time
		a new `Http2Stream` is created by this `Http2Session`.
	**/
	var nextStreamID:Int;

	/**
		The number of bytes that the remote peer can send without receiving a `WINDOW_UPDATE`.
	**/
	var localWindowSize:Int;

	/**
		The numeric id of the `Http2Stream` for which a `HEADERS` or `DATA` frame
		was most recently received.
	**/
	var lastProcStreamID:Int;

	/**
		The number of bytes that this `Http2Session` may send without receiving a `WINDOW_UPDATE`.
	**/
	var remoteWindowSize:Int;

	/**
		The number of frames currently within the outbound queue for this `Http2Session`.
	**/
	var outboundQueueSize:Int;

	/**
		The current size in bytes of the outbound header compression state table.
	**/
	var deflateDynamicTableSize:Int;

	/**
		The current size in bytes of the inbound header compression state table.
	**/
	var inflateDynamicTableSize:Int;
}
