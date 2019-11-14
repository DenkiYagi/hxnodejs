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

package js.node.fs;

import js.node.events.EventEmitter.Event;
import haxe.extern.EitherType;

/**
	Enumeration of events emitted by the `ReadStream` objects.
**/
@:enum abstract ReadStreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when the `fs.ReadStream`'s underlying file descriptor has been closed.

		@see https://nodejs.org/api/fs.html#fs_event_close_1
	**/
	var Close:ReadStreamEvent<Void->Void> = "close";

	/**
		Emitted when the `fs.ReadStream`'s file descriptor has been opened.

		@see https://nodejs.org/api/fs.html#fs_event_open
	**/
	var Open:ReadStreamEvent<Int->Void> = "open";

	/**
		Emitted when the `fs.ReadStream` is ready to be used.

		@see https://nodejs.org/api/fs.html#fs_event_ready
	**/
	var Ready:ReadStreamEvent<Void->Void> = "ready";
}

/**
	A successful call to `fs.createReadStream()` will return a new `fs.ReadStream` object.

	@see https://nodejs.org/api/fs.html#fs_class_fs_readstream
**/
@:jsRequire("fs", "ReadStream")
extern class ReadStream extends js.node.stream.Readable<ReadStream> {
	/**
		The number of bytes that have been read so far.

		@see https://nodejs.org/api/fs.html#fs_readstream_bytesread
	**/
	var bytesRead:Int;

	/**
		The path to the file the stream is reading from as specified in the first argument to `fs.createReadStream()`.
		If `path` is passed as a string, then `readStream.path` will be a string.
		If `path` is passed as a `Buffer`, then `readStream.path` will be a `Buffer`.
	**/
	var path:EitherType<String, Buffer>;

	/**
		This property is `true` if the underlying file has not been opened yet, i.e. before the `'ready'` event is
		emitted.

		@see https://nodejs.org/api/fs.html#fs_readstream_pending
	**/
	var pending:Bool;
}
