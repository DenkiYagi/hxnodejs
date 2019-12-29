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
import js.node.Fs.FsPath;

/**
	Enumeration of events emitted by the `WriteStream` objects.
**/
@:enum abstract WriteStreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when the `WriteStream`'s underlying file descriptor has been closed.

		@see https://nodejs.org/api/fs.html#fs_event_close_2
	**/
	var Close:WriteStreamEvent<Void->Void> = "close";

	/**
		Emitted when the `WriteStream`'s file is opened.

		@see https://nodejs.org/api/fs.html#fs_event_open_1
	**/
	#if haxe4
	var Open:WriteStreamEvent<(fd:Int) -> Void> = "open";
	#else
	var Open:WriteStreamEvent<Int->Void> = "open";
	#end

	/**
		Emitted when the `fs.WriteStream` is ready to be used.

		@see https://nodejs.org/api/fs.html#fs_event_ready_1
	**/
	var Ready:WriteStreamEvent<Void->Void> = "ready";
}

/**
	@see https://nodejs.org/api/fs.html#fs_class_fs_writestream
**/
@:jsRequire("fs", "WriteStream")
extern class WriteStream extends js.node.stream.Writable<WriteStream> {
	/**
		The number of bytes written so far.
		Does not include data that is still queued for writing.

		@see https://nodejs.org/api/fs.html#fs_writestream_byteswritten
	**/
	var bytesWritten(default, null):Int;

	/**
		The path to the file the stream is writing to as specified in the first argument to `fs.createWriteStream()`.
		If `path` is passed as a string, then `writeStream.path` will be a string.
		If `path` is passed as a `Buffer`, then `writeStream.path` will be a `Buffer`.

		@see https://nodejs.org/api/fs.html#fs_writestream_path
	**/
	var path(default, null):FsPath;

	/**
		This property is `true` if the underlying file has not been opened yet, i.e. before the `'ready'` event is
		emitted.

		@see https://nodejs.org/api/fs.html#fs_writestream_pending
	**/
	var pending(default, null):Bool;
}
