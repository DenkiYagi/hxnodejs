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

/**
	Represents the readable side of a TTY.
	In normal circumstances `process.stdin` will be the only `tty.ReadStream` instance in a Node.js process and
	there should be no reason to create additional instances.

	@see https://nodejs.org/api/tty.html#tty_class_tty_readstream
**/
@:jsRequire("tty", "ReadStream")
extern class ReadStream extends js.node.net.Socket {
	/**
		A `boolean` that is `true` if the TTY is currently configured to operate as a raw device.
		Defaults to `false`.

		@see https://nodejs.org/api/tty.html#tty_readstream_israw
	**/
	var isRaw(default, null):Bool;

	/**
		Allows configuration of `tty.ReadStream` so that it operates as a raw device.

		@see https://nodejs.org/api/tty.html#tty_readstream_setrawmode_mode
	**/
	function setRawMode(mode:Bool):ReadStream;
}
