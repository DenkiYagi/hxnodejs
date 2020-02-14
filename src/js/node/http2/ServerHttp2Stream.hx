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
import js.html.idb.FileHandle;
import js.node.fs.Stats;
import js.node.events.EventEmitter.Event;
import js.node.stream.Readable.IReadable;
import js.node.Http2.HeadersObject;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events for `ServerHttp2Stream` objects.
**/
@:enum abstract ServerHttp2StreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Inherited from `Http2Stream`.
	**/
	var Aborted:ServerHttp2StreamEvent<Void->Void> = "aborted";

	/**
		Inherited from `Http2Stream`.
	**/
	var Close:ServerHttp2StreamEvent<Void->Void> = "close";

	/**
		Inherited from `Http2Stream`.
	**/
	var Error:ServerHttp2StreamEvent<Error->Void> = "error";

	/**
		Inherited from `Http2Stream`.
	**/
	var FrameError:ServerHttp2StreamEvent<Int->Int->Int->Void> = "frameError";

	/**
		Inherited from `Http2Stream`.
	**/
	var Timeout:ServerHttp2StreamEvent<Void->Void> = "timeout";

	/**
		Inherited from `Http2Stream`.
	**/
	var Tailer:ServerHttp2StreamEvent<HeadersObject->Int->Void> = "trailers";

	/**
		Inherited from `Http2Stream`.
	**/
	var WantTrailers:ServerHttp2StreamEvent<Void->Void> = "wantTrailers";

	/**
		Inherited from `stream.Duplee`.
	**/
	var Drain:ServerHttp2StreamEvent<Void->Void> = "drain";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Finish:ServerHttp2StreamEvent<Void->Void> = "finish";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Pipe:ServerHttp2StreamEvent<IReadable->Void> = "pipe";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Unpipe:ServerHttp2StreamEvent<IReadable->Void> = "unpipe";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Data:ServerHttp2StreamEvent<Dynamic->Void> = "data";

	/**
		Inherited from `stream.Duplex`.
	**/
	var End:ServerHttp2StreamEvent<Void->Void> = "end";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Pause:ServerHttp2StreamEvent<Void->Void> = "pause";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Readable:ServerHttp2StreamEvent<Void->Void> = "readable";

	/**
		Inherited from `stream.Duplex`.
	**/
	var Resume:ServerHttp2StreamEvent<Void->Void> = "resume";
}

/**
	The `ServerHttp2Stream` class is an extension of `Http2Stream` that is used
	exclusively on HTTP/2 Servers.
	`Http2Stream` instances on the server provide additional methods
	such as `pushStream()` and `respond()` that are only relevant on the server.

	@see https://nodejs.org/api/http2.html#http2_class_serverhttp2stream
**/
extern class ServerHttp2Stream extends Http2Stream {
	/**
		Sends an additional informational `HEADERS` frame to the connected HTTP/2 peer.

		@see https://nodejs.org/api/http2.html#http2_http2stream_additionalheaders_headers
	**/
	function additionalHeaders(headers:HeadersObject):Void;

	/**
		True if headers were sent, false otherwise (read-only).

		@see https://nodejs.org/api/http2.html#http2_http2stream_headerssent
	**/
	var headersSent(default, null):Bool;

	/**
		Read-only property mapped to the `SETTINGS_ENABLE_PUSH` flag
		of the remote client's most recent `SETTINGS` frame.
		Will be `true` if the remote peer accepts push streams, false otherwise.
		Settings are the same for every `Http2Stream` in the same `Http2Session`.

		@see https://nodejs.org/api/http2.html#http2_http2stream_pushallowed
	**/
	var pushAllowed(default, null):Bool;

	/**
		Initiates a push stream.
		The callback is invoked with the new `Http2Stream` instance created for the push stream
		passed as the second argument, or an `Error` passed as the first argument.

		@see https://nodejs.org/api/http2.html#http2_http2stream_pushstream_headers_options_callback
	**/
	function pushStream(headers:HeadersObject, ?options:PushStreamOptions, callback:Null<Error>->ServerHttp2Stream->HeadersObject->Void):Void;

	/**
		When the `options.waitForTrailers` option is set, the `'wantTrailers'` event will be emitted
		immediately after queuing the last chunk of payload data to be sent.
		The `http2stream.sendTrailers()` method can then be used to sent trailing header fields to the peer.

		@see https://nodejs.org/api/http2.html#http2_http2stream_respond_headers_options
	**/
	function respond(?headers:HeadersObject, ?options:RespondOptions):Void;

	/**
		Initiates a response whose data is read from the given file descriptor.
		No validation is performed on the given file descriptor.
		If an error occurs while attempting to read data using the file descriptor,
		the `Http2Stream` will be closed using an `RST_STREAM` frame using the standard `INTERNAL_ERROR` code.

		@see https://nodejs.org/api/http2.html#http2_http2stream_respondwithfd_fd_headers_options
	**/
	@:overload(function(fs:Int, ?headers:HeadersObject, ?options:RespondWithFDOptions):Void {})
	function respondWithFD(fs:FileHandle, ?headers:HeadersObject, ?options:RespondWithFDOptions):Void;

	/**
		Sends a regular file as the response.
		The `path` must specify a regular file or an `'error'` event will be emitted on the `Http2Stream` object.

		@see https://nodejs.org/api/http2.html#http2_http2stream_respondwithfile_path_headers_options
	**/
	@:overload(function(path:String, ?headers:HeadersObject, ?options:RespondWithFileOptions):Void {})
	@:overload(function(path:Buffer, ?headers:HeadersObject, ?options:RespondWithFileOptions):Void {})
	function respondWithFile(path:Url, ?headers:HeadersObject, ?options:RespondWithFileOptions):Void;
}

typedef PushStreamOptions = {
	/**
		When `true` and `parent` identifies a parent Stream,
		the created stream is made the sole direct dependency of the parent,
		with all other existing dependents made a dependent of the newly created stream.

		Default: `false`.
	**/
	@:optional var exclusive:Bool;

	/**
		Specifies the numeric identifier of a stream the newly created stream is dependent on.
	**/
	@:optional var parent:Int;
}

typedef RespondOptions = {
	/**
		Set to `true` to indicate that the response will not include payload data.
	**/
	@:optional var endStream:Bool;

	/**
		When `true`, the `Http2Stream` will emit the `'wantTrailers'` event
		after the final `DATA` frame has been sent.
	**/
	@:optional var waitForTrailers:Bool;
}

typedef RespondWithFDOptions = {
	/**
	**/
	@:optional var statCehck:Stats->HeadersObject->Void;

	/**
		When `true`, the `Http2Stream` will emit the `'wantTrailers'` event
		after the final `DATA` frame has been sent.
	**/
	@:optional var waitForTrailers:Bool;

	/**
		The offset position at which to begin reading.
	**/
	@:optional var offset:Int;

	/**
		The amount of data from the fd to send.
	**/
	@:optional var length:Int;
}

typedef RespondWithFileOptions = {
	/**
	**/
	@:optional var statCheck:Stats->HeadersObject->Void;

	/**
		Callback function invoked in the case of an error before send.
	**/
	@:optional var onError:Error->Void;

	/**
		When `true`, the `Http2Stream` will emit the `'wantTrailers'` event after the final `DATA` frame has been sent.
	**/
	@:optional var waitForTrailers:Bool;

	/**
		The offset position at which to begin reading.
	**/
	@:optional var offset:Int;

	/**
		The amount of data from the fd to send.
	**/
	@:optional var length:Int;
}
