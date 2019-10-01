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
	/**
		Brotli Flush operation constants

		@see https://nodejs.org/api/zlib.html#zlib_flush_operations
	**/
	var BROTLI_OPERATION_EMIT_METADATA(default, null):Int;
}

/**
	There are several options that can be set on Brotli encoders, affecting compression efficiency and speed.

	@see https://nodejs.org/api/zlib.html#zlib_compressor_options
**/
typedef BrotliCompressorOptions = {
	/**
	**/
	@:optional var BROTLI_PARAM_MODE:BrotliParamMode;

	/**
		Ranges from `BROTLI_MIN_QUALITY` to `BROTLI_MAX_QUALITY`, with a default of `BROTLI_DEFAULT_QUALITY`
	**/
	@:optional var BROTLI_PARAM_QUALITY:Int;

	/**
		Integer value representing the expected input size; defaults to 0 for an unknown input size.
	**/
	@:optional var BROTLI_PARAM_SIZE_HINT:Int;

	/**
		Ranges from `BROTLI_MIN_WINDOW_BITS` to `BROTLI_MAX_WINDOW_BITS`, with a default of `BROTLI_DEFAULT_WINDOW`,
		or up to `BROTLI_LARGE_MAX_WINDOW_BITS` if the `BROTLI_PARAM_LARGE_WINDOW` flag is set.
	**/
	@:optional var BROTLI_PARAM_LGWIN:Int;

	/**
		Ranges from `BROTLI_MIN_INPUT_BLOCK_BITS` to `BROTLI_MAX_INPUT_BLOCK_BITS`.
	**/
	@:optional var BROTLI_PARAM_LGBLOCK:Int;

	/**
		Boolean flag that decreases compression ratio in favour of decompression speed.
	**/
	@:optional var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING:Bool;

	/**
		Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
	**/
	@:optional var BROTLI_PARAM_LARGE_WINDOW:Bool;

	/**
		Ranges from 0 to `BROTLI_MAX_NPOSTFIX`.
	**/
	@:optional var BROTLI_PARAM_NPOSTFIX:Int;

	/**
		Ranges from `0` to `15 << NPOSTFIX` in steps of `1 << NPOSTFIX`.
	**/
	@:optional var BROTLI_PARAM_NDIRECT:Int;
}

/**
	A value type for `BROTLI_PARAM_MODE` of `BrotliCompressorOptions`
**/
@:enum abstract BrotliParamMode(String) {
	/**
		(default)
	**/
	var BROTLI_MODE_GENERIC = "BROTLI_MODE_GENERIC";

	/**
		adjusted for UTF-8 text
	**/
	var BROTLI_MODE_TEXT = "BROTLI_MODE_TEXT";

	/**
		adjusted for WOFF 2.0 fonts
	**/
	var BROTLI_MODE_FONT = "BROTLI_MODE_FONT";
}

/**
	Advanced options for controlling Brotli Decompression

	@see https://nodejs.org/api/zlib.html#zlib_decompressor_options
**/
typedef BrotliDecompressOptions = {
	/**
		Boolean flag that affects internal memory allocation patterns.
	**/
	@:optional var BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION:Bool;

	/**
		Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
	**/
	@:optional var BROTLI_DECODER_PARAM_LARGE_WINDOW:Bool;
}
