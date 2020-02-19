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

package js.node.tty;

import haxe.extern.EitherType;
import js.node.events.EventEmitter.Event;
import js.node.stream.Readable.IReadable;
import js.node.Dns;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by `ReadStream` objects in addition to its parent class events.
**/
@:enum abstract ReadStreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		inherited from `net.Socket`.
	**/
	var Lookup:ReadStreamEvent<Null<Error>->String->DnsAddressFamily->Void> = "lookup";

	/**
		inherited from `net.Socket`.
	**/
	var Connect:ReadStreamEvent<Void->Void> = "connect";

	/**
		inherited from `net.Socket`.
	**/
	var Data:ReadStreamEvent<EitherType<Buffer, String>->Void> = "data";

	/**
		inherited from `net.Socket`.
	**/
	var End:ReadStreamEvent<Void->Void> = "end";

	/**
		inherited from `net.Socket`.
	**/
	var Timeout:ReadStreamEvent<Void->Void> = "timeout";

	/**
		inherited from `net.Socket`.
	**/
	var Drain:ReadStreamEvent<Void->Void> = "drain";

	/**
		inherited from `net.Socket`.
	**/
	var Error:ReadStreamEvent<Error->Void> = "error";

	/**
		inherited from `net.Socket`.
	**/
	var Close:ReadStreamEvent<Bool->Void> = "close";

	/**
		inherited from `net.Socket`.
	**/
	var Finish:ReadStreamEvent<Void->Void> = "finish";

	/**
		inherited from `net.Socket`.
	**/
	var Pipe:ReadStreamEvent<IReadable->Void> = "pipe";

	/**
		inherited from `net.Socket`.
	**/
	var Unpipe:ReadStreamEvent<IReadable->Void> = "unpipe";

	/**
		inherited from `net.Socket`.
	**/
	var Pause:ReadStreamEvent<Void->Void> = "pause";

	/**
		inherited from `net.Socket`.
	**/
	var Readable:ReadStreamEvent<Void->Void> = "readable";

	/**
		inherited from `net.Socket`.
	**/
	var Resume:ReadStreamEvent<Void->Void> = "resume";
}

/**
	A net.Socket subclass that represents the readable portion of a tty.
	In normal circumstances, process.stdin will be the only tty.ReadStream instance
	in any node program (only when isatty(0) is true).
**/
@:jsRequire("tty", "ReadStream")
extern class ReadStream extends js.node.net.Socket {
	/**
		A boolean that is initialized to false.
		It represents the current "raw" state of the tty.ReadStream instance.
	**/
	var isRaw(default, null):Bool;

	/**
		`mode` should be true or false.
		This sets the properties of the tty.ReadStream to act either as a raw device or default.
		`isRaw` will be set to the resulting mode.
	**/
	function setRawMode(mode:Bool):Void;
}
