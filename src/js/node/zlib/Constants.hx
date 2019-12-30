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

/**
	@see https://nodejs.org/api/zlib.html#zlib_constants
**/
@:jsRequire("zlib", "Constants")
extern class Constants {
	var Z_NO_FLUSH(default, null):Int;
	var Z_PARTIAL_FLUSH(default, null):Int;
	var Z_SYNC_FLUSH(default, null):Int;
	var Z_FULL_FLUSH(default, null):Int;
	var Z_FINISH(default, null):Int;
	var Z_BLOCK(default, null):Int;

	/**
		Allowed `flush` values.
	**/
	var Z_TREES(default, null):Int;

	var Z_OK(default, null):Int;
	var Z_STREAM_END(default, null):Int;
	var Z_NEED_DICT(default, null):Int;
	var Z_ERRNO(default, null):Int;
	var Z_STREAM_ERROR(default, null):Int;
	var Z_DATA_ERROR(default, null):Int;
	var Z_MEM_ERROR(default, null):Int;
	var Z_BUF_ERROR(default, null):Int;

	/**
		Return codes for the compression/decompression functions.
		Negative values are errors, positive values are used for special but normal events.
	**/
	var Z_VERSION_ERROR(default, null):Int;

	var Z_NO_COMPRESSION(default, null):Int;
	var Z_BEST_SPEED(default, null):Int;
	var Z_BEST_COMPRESSION(default, null):Int;

	/**
		Compression levels.
	**/
	var Z_DEFAULT_COMPRESSION(default, null):Int;

	var Z_FILTERED(default, null):Int;
	var Z_HUFFMAN_ONLY(default, null):Int;
	var Z_RLE(default, null):Int;
	var Z_FIXED(default, null):Int;

	/**
		Compression strategy.
	**/
	var Z_DEFAULT_STRATEGY(default, null):Int;

	var BROTLI_OPERATION_PROCESS(default, null):Int;
	var BROTLI_OPERATION_FLUSH(default, null):Int;
	var BROTLI_OPERATION_FINISH(default, null):Int;

	var BROTLI_PARAM_MODE(default, null):Int;
	var BROTLI_PARAM_QUALITY(default, null):Int;
	var BROTLI_PARAM_SIZE_HINT(default, null):Int;
	var BROTLI_PARAM_LGWIN(default, null):Int;
	var BROTLI_PARAM_LGBLOCK(default, null):Int;
	var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING(default, null):Int;
	var BROTLI_PARAM_LARGE_WINDOW(default, null):Int;
	var BROTLI_PARAM_NPOSTFIX(default, null):Int;
	var BROTLI_PARAM_NDIRECT(default, null):Int;

	/**
		Brotli Flush operation constants

		@see https://nodejs.org/api/zlib.html#zlib_flush_operations
	**/
	var BROTLI_OPERATION_EMIT_METADATA(default, null):Int;
}
