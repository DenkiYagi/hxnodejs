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

package js.node.zlib;

import haxe.Constraints; // for haxe.Function

/**
	Not exported by the `zlib` module.
	It is documented here because it is the base class of the compressor/decompressor classes.

	@see https://nodejs.org/api/zlib.html#zlib_class_zlib_zlibbase
**/
extern class ZlibBase extends js.node.stream.Transform<ZlibBase> {

	/**
		Deprecated alias for `bytesWritten`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_bytesread
	**/
	@:deprecated
	static var bytesRead(default, null):Int;

	/**
		The `Zlib.bytesWritten` property specifies the number of bytes written to the engine, before the bytes are processed (compressed or decompressed, as appropriate for the derived class).

		@see https://nodejs.org/api/zlib.html#zlib_zlib_byteswritten
	**/
	static var bytesWritten(default, null):Int;

	/**
		Close the underlying handle.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_close_callback
	**/
	static function close(callback:haxe.Function):Void;

	/**
		Flush pending data. Don't call this frivolously, premature flushes negatively impact the effectiveness of the compression algorithm.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_flush_kind_callback
	**/
	static function flush(?kind:Int, callback:haxe.Function):Void;

	/**
		This function is only available for zlib-based streams, i.e. not Brotli.

		Dynamically update the compression level and compression strategy. Only applicable to deflate algorithm.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_params_level_strategy_callback
	**/
	static function params(level:Int, strategy:Int, callback:haxe.Function):Void;

	/**
		Reset the compressor/decompressor to factory defaults. Only applicable to the inflate and deflate algorithms.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_reset
	**/
	static function reset():Void;
}
