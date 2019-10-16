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

import js.node.events.EventEmitter;

/**
	Enumeration of events for `ReadStream` objects.
**/
@:enum abstract WriteStreamEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		The 'resize' event is emitted whenever either of the `WriteStream.columns` or `WriteStream.rows` properties have changed.
		No arguments are passed to the listener callback when called.

		@see https://nodejs.org/api/tty.html#tty_event_resize
	**/
	var Resize:WriteStreamEvent<Void->Void> = "resize";
}

/**
	Represents the writable side of a TTY.
	In normal circumstances, `process.stdout` and `process.stderr` will be the only `tty.WriteStream` instances created for a Node.js process and
	there should be no reason to create additional instances.

	@see https://nodejs.org/api/tty.html#tty_class_tty_writestream
**/
@:jsRequire("tty", "WriteStream")
extern class WriteStream extends js.node.net.Socket {

	/**
		`WriteStream.clearLine()` clears the current line of this `WriteStream` in a direction identified by `dir`.

		@see https://nodejs.org/api/tty.html#tty_writestream_clearline_dir_callback
	**/
	function clearLine(dir:Int, ?callback:haxe.Constraints.Function):Bool;

	/**
		`WriteStream.clearScreenDown()` clears this `WriteStream` from the current cursor down.

		@see https://nodejs.org/api/tty.html#tty_writestream_clearscreendown_callback
	**/
	function clearScreenDown(?callback:haxe.Constraints.Function):Bool;


	/**
		A number specifying the number of columns the TTY currently has.
		This property is updated whenever the 'resize' event is emitted.

		@see https://nodejs.org/api/tty.html#tty_writestream_columns
	**/
	var columns(default, null):Int;

	/**
		`WriteStream.cursorTo()` moves this WriteStream's cursor to the specified position.

		@see https://nodejs.org/api/tty.html#tty_writestream_cursorto_x_y_callback
	**/
	function cursorTo(x:Int, ?y:Int, ?callback:haxe.Constraints.Function):Bool;

	/**
		Use this to determine what colors the terminal supports.
		Due to the nature of colors in terminals it is possible to either have false positives or false negatives.
		It depends on process information and the environment variables that may lie about what terminal is used.
		It is possible to pass in an `env` object to simulate the usage of a specific terminal.
		This can be useful to check how specific environment settings behave.

		@see https://nodejs.org/api/tty.html#tty_writestream_getcolordepth_env
	**/
	function getColorDepth(?env:haxe.DynamicAccess<String>):Int;

	/**
		`WriteStream.getWindowSize()` returns the size of the TTY corresponding to this `WriteStream`.
		The array is of the type `[numColumns, numRows]` where `numColumns` and `numRows` represent the number of columns and rows in the corresponding TTY.

		@see https://nodejs.org/api/tty.html#tty_writestream_getwindowsize
	**/
	function getWindowSize():Array<Int>;

	/**
		Returns `true` if the `WriteStream` supports at least as many colors as provided in `count`.
		Minimum support is 2 (black and white).

		@see https://nodejs.org/api/tty.html#tty_writestream_hascolors_count_env
	**/
	function hasColors():Bool;

	/**
		`WriteStream.moveCursor()` moves this `WriteStream`'s cursor relative to its current position.

		@see https://nodejs.org/api/tty.html#tty_writestream_movecursor_dx_dy_callback
	**/
	function moveCursor(dx:Int, dy:Int, ?callback:haxe.Constraints.Function):Bool;

	/**
		A `number` specifying the number of rows the TTY currently has.
		This property is updated whenever the `'resize'` event is emitted.

		@see https://nodejs.org/api/tty.html#tty_writestream_rows
	**/
	var rows(default, null):Int;
}
