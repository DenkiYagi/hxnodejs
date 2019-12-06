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
import js.node.stream.Duplex;
import js.node.events.EventEmitter.Event;
import js.node.events.EventEmitter;
import js.node.Http2.HeadersObject;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `Http2Stream` objects.
**/
@:enum abstract Http2StreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The `'aborted'` event is emitted whenever a `Http2Stream` instance
		is abnormally aborted in mid-communication.
		Its listener does not expect any arguments.

		@see https://nodejs.org/api/http2.html#http2_event_aborted
	**/
	var Aborted:Http2StreamEvent<Void->Void> = "aborted";

	/**
		The `'close'` event is emitted when the `Http2Stream` is destroyed.
		Once this event is emitted, the `Http2Stream` instance is no longer usable.

		@see https://nodejs.org/api/http2.html#http2_event_close_1
	**/
	var Close:Http2StreamEvent<Void->Void> = "close";

	/**
		The `'error'` event is emitted when an error occurs during the processing of an `Http2Stream`.

		@see https://nodejs.org/api/http2.html#http2_event_error_1
	**/
	var Error:Http2StreamEvent<Error->Void> = "error";

	/**
		The `'frameError'` event is emitted when an error occurs while attempting to send a frame.
		When invoked, the handler function will receive an integer argument identifying the frame type,
		and an integer argument identifying the error code.
		The `Http2Stream` instance will be destroyed immediately after the `'frameError'` event is emitted.

		@see https://nodejs.org/api/http2.html#http2_event_frameerror_1
	**/
	var FrameError:Http2StreamEvent<Int->Int->Void> = "frameError";

	/**
		The `'timeout'` event is emitted after no activity is received for this `Http2Stream`
		within the number of milliseconds set using `http2stream.setTimeout()`.

		@see https://nodejs.org/api/http2.html#http2_event_timeout_1
	**/
	var Timeout:Http2StreamEvent<Void->Void> = "timeout";

	/**
		The `'trailers'` event is emitted when a block of headers associated with
		trailing header fields is received.
		The listener callback is passed the HTTP/2 Headers Object and flags associated with the headers.

		@see https://nodejs.org/api/http2.html#http2_event_trailers
	**/
	var Tailer:Http2StreamEvent<HeadersObject->Int->Void> = "trailers";

	/**
		The `'wantTrailers'` event is emitted when the `Http2Stream` has queued the final DATA frame
		to be sent on a frame and the `Http2Stream` is ready to send trailing headers.
		When initiating a request or response,
		the `waitForTrailers` option must be set for this event to be emitted.

		@see https://nodejs.org/api/http2.html#http2_event_wanttrailers
	**/
	var WantTrailers:Http2StreamEvent<Void->Void> = "wantTrailers";
}

/**
	Each instance of the Http2Stream class represents a bidirectional HTTP/2 communications stream
	over an Http2Session instance.
	Any single Http2Session may have up to 231-1 `Http2Stream` instances over its lifetime.

	@see https://nodejs.org/api/http2.html#http2_class_http2stream
**/
extern class Http2Stream extends Duplex<Http2Stream> {
	/**
		Set to `true` if the `Http2Stream` instance was aborted abnormally.
		When set, the `'aborted'` event will have been emitted.

		@see https://nodejs.org/api/http2.html#http2_http2stream_aborted
	**/
	var aborted(default, null):Bool;

	/**
		This property shows the number of characters currently buffered to be written.
		See `net.Socket.bufferSize` for details.

		@see https://nodejs.org/api/http2.html#http2_http2stream_buffersize
	**/
	var bufferSize(default, null):Int;

	/**
		Closes the `Http2Stream` instance by sending an `RST_STREAM` frame to the connected HTTP/2 peer.

		@see https://nodejs.org/api/http2.html#http2_http2stream_close_code_callback
	**/
	function close(code:Int, ?callback:Void->Void):Void;

	/**
		Set to `true` if the `Http2Stream` instance has been closed.

		@see https://nodejs.org/api/http2.html#http2_http2stream_closed
	**/
	var closed(default, null):Bool;

	/**
		Set to `true` if the `Http2Stream` instance has been destroyed and is no longer usable.

		@see https://nodejs.org/api/http2.html#http2_http2stream_destroyed
	**/
	// var destroyed(default, null):Bool; already defined at `js.node.stream.Readable`

	/**
		Set the `true` if the `END_STREAM` flag was set in the request or response HEADERS frame received,
		indicating that no additional data should be received and
		the readable side of the `Http2Stream` will be closed.

		@see https://nodejs.org/api/http2.html#http2_http2stream_endafterheaders
	**/
	var endAfterHeaders(default, null):Bool;

	/**
		The numeric stream identifier of this `Http2Stream` instance.
		Set to `null` if the stream identifier has not yet been assigned.

		@see https://nodejs.org/api/http2.html#http2_http2stream_id
	**/
	var id:Null<Int>;

	/**
		Set to `true` if the `Http2Stream` instance has not yet been assigned a numeric stream identifier.

		@see https://nodejs.org/api/http2.html#http2_http2stream_pending
	**/
	var pending(default, null):Bool;

	/**
		Updates the priority for this `Http2Stream` instance.

		@see https://nodejs.org/api/http2.html#http2_http2stream_priority_options
	**/
	function priority(options:PriorityOptions):Void;

	/**
		Set to the `RST_STREAM` error code reported when the `Http2Stream` is destroyed after either
		receiving an `RST_STREAM` frame from the connected peer, calling `http2stream.close()`, or `http2stream.destroy()`.
		Will be `null` if the `Http2Stream` has not been closed.

		@see https://nodejs.org/api/http2.html#http2_http2stream_rstcode
	**/
	var rstCode(default, null):Null<Int>;

	/**
		An object containing the outbound headers sent for this `Http2Stream`.

		@see https://nodejs.org/api/http2.html#http2_http2stream_sentheaders
	**/
	var sentHeaders(default, null):HeadersObject;

	/**
		An array of objects containing the outbound informational (additional) headers sent for this Http2Stream.

		@see https://nodejs.org/api/http2.html#http2_http2stream_sentinfoheaders
	**/
	var sentInfoHeaders(default, null):Array<HeadersObject>;

	/**
		An object containing the outbound trailers sent for this HttpStream.

		@see https://nodejs.org/api/http2.html#http2_http2stream_senttrailers
	**/
	var sentTrailers(default, null):HeadersObject;

	/**
		A reference to the `Http2Session` instance that owns this `Http2Stream`.
		The value will be undefined after the `Http2Stream` instance is destroyed.

		@see https://nodejs.org/api/http2.html#http2_http2stream_session
	**/
	var session(default, null):Http2Session;

	/**
		@see https://nodejs.org/api/http2.html#http2_http2stream_settimeout_msecs_callback
	**/
	function setTimeout(msecs:Int, callback:Void->Void):Void;

	/**
		Provides miscellaneous information about the current state of the `Http2Stream`.

		@see https://nodejs.org/api/http2.html#http2_http2stream_state
	**/
	var state(default, null):StateObject; // TODO

	/**
		Sends a trailing `HEADERS` frame to the connected HTTP/2 peer.
		This method will cause the `Http2Stream` to be immediately closed and must only be called
		after the `'wantTrailers'` event has been emitted.
		When sending a request or sending a response,
		the `options.waitForTrailers` option must be set in order to keep the `Http2Stream` open
		after the final `DATA` frame so that trailers can be sent.

		@see https://nodejs.org/api/http2.html#http2_http2stream_sendtrailers_headers
	**/
	function sendTrailers(headers:HeadersObject):Void;
}

typedef PriorityOptions = {
	/**
		When `true` and `parent` identifies a parent Stream,
		this stream is made the sole direct dependency of the parent,
		with all other existing dependents made a dependent of this stream.
		Default: `false`.
	**/
	var exclusive:Bool;

	/**
		Specifies the numeric identifier of a stream this stream is dependent on.
	**/
	var parent:Bool;

	/**
		Specifies the relative dependency of a stream in relation to other streams with the same `parent`.
		The value is a number between `1` and `256` (inclusive).
	**/
	var weight:Int;

	/**
		When `true`, changes the priority locally without sending a `PRIORITY` frame to the connected peer.
	**/
	var silent:Bool;
}

typedef StateObject = {
	/**
		The number of bytes the connected peer may send for
		this `Http2Stream` without receiving a `WINDOW_UPDATE`.
	**/
	var localWindowSize:Int;

	/**
		A flag indicating the low-level current state of the `Http2Stream` as determined by `nghttp2`.
	**/
	var state:Int;

	/**
		`1` if this `Http2Stream` has been closed locally.
	**/
	var localClose:Int;

	/**
		`1` if this `Http2Stream` has been closed remotely.
	**/
	var remoteClose:Int;

	/**
		The sum weight of all `Http2Stream` instances that depend on this `Http2Stream` as specified using `PRIORITY` frames.
	**/
	var sumDependencyWeight:Int;

	/**
		The priority weight of this `Http2Stream`.
	**/
	var weight:Int;
};
