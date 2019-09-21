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

package js.node;

import haxe.extern.EitherType;
import haxe.Constraints; // for haxe.Function
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.Buffer;
import js.node.zlib.*;

/**
	The zlib module provides compression functionality implemented
	using Gzip and Deflate/Inflate, as well as Brotli.

	@see https://nodejs.org/dist/latest-v12.x/docs/api/zlib.html#zlib_zlib
**/
@:jsRequire("zlib")
extern class Zlib {
	/**
		All of the constants defined in `zlib.h` are also defined on `require('zlib').constants`.
		In the normal course of operations, it will not be necessary to use these constants.
		They are documented so that their presence is not surprising.
		This section is taken almost directly from the [zlib documentation](https://zlib.net/manual.html#Constants).

		@see https://nodejs.org/api/zlib.html#zlib_zlib_constants
	**/
	static var constants(default, null):ZlibConstants;

	/**
		Deprecated alias for `bytesWritten`.
	**/
	@:deprecated
	static var bytesRead(default, null):Int;

	/**
		the number of bytes written to the engine, before the bytes are processed (compressed or decompressed, as appropriate for the derived class).
	**/
	static var bytesWritten(default, null):Int;

	/**
		Close the underlying handle.
	**/
	static function close(callback:haxe.Function):Void;

	/**
		Flush pending data. Don't call this frivolously, premature flushes negatively impact the effectiveness of the compression algorithm.

		@see https://nodejs.org/dist/latest-v12.x/docs/api/zlib.html#zlib_zlib_flush_kind_callback
	**/
	static function flush(?kind:Int, callback:haxe.Function):Void;

	/**
		This function is only available for zlib-based streams, i.e. not Brotli.

		Dynamically update the compression level and compression strategy. Only applicable to deflate algorithm.
	**/
	static function params(level:Int, strategy:Int, callback:haxe.Function):Void;

	/**
		Reset the compressor/decompressor to factory defaults. Only applicable to the inflate and deflate algorithms.
	**/
	static function reset():Void;

	/**
		Creates and returns a new `BrotliCompress` object.
	**/
	static function createBrotliCompress(?options:BrotliOptions):BrotliCompress;

	/**
		Creates and returns a new `BrotliDecompress` object.
	**/
	static function createBrotliDecompress(?options:BrotliOptions):BrotliDecompress;

	/**
		Creates and returns a new `Deflate` object.
	**/
	static function createDeflate(?options:ZlibOptions):Deflate;

	/**
		Creates and returns a new `DeflateRaw` object.
		@see https://nodejs.org/dist/latest-v12.x/docs/api/zlib.html#zlib_zlib_createdeflateraw_options
	**/
	static function createDeflateRaw(?options:ZlibOptions):DeflateRaw;

	/**
		Creates and returns a new `Gunzip` object.
	**/
	static function createGunzip(?options:ZlibOptions):Gunzip;

	/**
		Creates and returns a new `Gzip` object.
	**/
	static function createGzip(?options:ZlibOptions):Gzip;

	/**
		Creates and returns a new `Inflate` object.
	**/
	static function createInflate(?options:ZlibOptions):Inflate;

	/**
		Creates and returns a new `InflateRaw` object.
	**/
	static function createInflateRaw(?options:ZlibOptions):InflateRaw;

	/**
		Creates and returns a new `Unzip` object.
	**/
	static function createUnzip(?options:ZlibOptions):Unzip;

	/**
		Compress a string with `Brotli`.
	**/
	@:overload(function(buf:JsBuffer, options:BrotliOptions, callback:Error->Buffer->Void):Void {})
	static function brotliCompress(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Compress a chunk of data with `BrotliCompress`.
	**/
	@:overload(function(buf:JsBuffer, options:BrotliOptions):Void {})
	static function brotliCompressSync(buf:JsBuffer, options:BrotliOptions):Void;

	@:overload(function(buf:JsBuffer, options:BrotliOptions):Void {})
	static function brotliDecompress(buf:JsBuffer, options:BrotliOptions):Void;

	/**
		Decompress a chunk of data with `BrotliDecompress`.
	**/
	static function brotliDecompressSync(buf:JsBuffer, options:BrotliOptions):Void;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function deflate(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Deflate`.
	**/
	static function deflateSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function deflateRaw(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Compress a chunk of data with `DeflateRaw`.
	**/
	static function deflateRawSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function gunzip(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Gunzip`.
	**/
	static function gunzipSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function gzip(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Gzip`.
	**/
	static function gzipSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function inflate(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Inflate`.
	**/
	static function inflateSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function inflateRaw(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `InflateRaw`.
	**/
	static function inflateRawSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;

	@:overload(function(buf:JsBuffer, options:ZlibOptions, callback:Error->Buffer->Void):Void {})
	static function unzip(buf:JsBuffer, callback:Error->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Unzip`.
	**/
	static function unzipSync(buf:JsBuffer, ?options:ZlibOptions):Buffer;
}

typedef ZlibConstants = {
	/**
		Allowed `flush` values.
	**/
	var Z_NO_FLUSH(default, null):Int;

	var Z_PARTIAL_FLUSH(default, null):Int;
	var Z_SYNC_FLUSH(default, null):Int;
	var Z_FULL_FLUSH(default, null):Int;
	var Z_FINISH(default, null):Int;
	var Z_BLOCK(default, null):Int;
	var Z_TREES(default, null):Int;

	/**
		Return codes for the compression/decompression functions.
		Negative values are errors, positive values are used for special but normal events.
	**/
	var Z_OK(default, null):Int;

	var Z_STREAM_END(default, null):Int;
	var Z_NEED_DICT(default, null):Int;
	var Z_ERRNO(default, null):Int;
	var Z_STREAM_ERROR(default, null):Int;
	var Z_DATA_ERROR(default, null):Int;
	var Z_MEM_ERROR(default, null):Int;
	var Z_BUF_ERROR(default, null):Int;
	var Z_VERSION_ERROR(default, null):Int;

	/**
		Compression levels.
	**/
	var Z_NO_COMPRESSION(default, null):Int;

	var Z_BEST_SPEED(default, null):Int;
	var Z_BEST_COMPRESSION(default, null):Int;
	var Z_DEFAULT_COMPRESSION(default, null):Int;

	/**
		Compression strategy.
	**/
	var Z_FILTERED(default, null):Int;

	var Z_HUFFMAN_ONLY(default, null):Int;
	var Z_RLE(default, null):Int;
	var Z_FIXED(default, null):Int;
	var Z_DEFAULT_STRATEGY(default, null):Int;

	/**
		Brotli Flush operation constants

		@see https://nodejs.org/dist/latest-v12.x/docs/api/zlib.html#zlib_flush_operations
	**/
	var BROTLI_OPERATION_PROCESS(default, null):Int;

	var BROTLI_OPERATION_FLUSH(default, null):Int;
	var BROTLI_OPERATION_FINISH(default, null):Int;
	var BROTLI_OPERATION_EMIT_METADATA(default, null):Int;
}

typedef ZlibOptions = {
	/**
		default: `Zlib.Z_NO_FLUSH`
	**/
	@:optional var flush:Int;

	/**
		default: `Zlib.Z_FINISH`
	**/
	@:optional var finishFlush:Int;

	/**
		default: 16*1024
	**/
	@:optional var chunkSize:Int;

	@:optional var windowBits:Int;

	/**
		compression only
	**/
	@:optional var level:Int;

	/**
		compression only
	**/
	@:optional var memLevel:Int;

	/**
		compression only
	**/
	@:optional var strategy:Int;

	/**
		deflate/inflate only, empty dictionary by default
	**/
	@:optional var dictionary:Buffer;

	/**
		If `true`, returns an object with `buffer` and `engine`
	**/
	@:optional var info:Bool;
}

/**
	There are several options that can be set on Brotli encoders, affecting compression efficiency and speed.

	@see https://nodejs.org/api/zlib.html#zlib_compressor_options
**/
typedef BrotliParams = {
	@:optional var BROTLI_PARAM_MODE:BrotliParamMode;

	/**
		Ranges from BROTLI_MIN_QUALITY to BROTLI_MAX_QUALITY, with a default of BROTLI_DEFAULT_QUALITY
	**/
	@:optional var BROTLI_PARAM_QUALITY:Int;

	@:optional var BROTLI_PARAM_SIZE_HINT:Int;
	@:optional var BROTLI_PARAM_LGWIN:Int;
	@:optional var BROTLI_PARAM_LGBLOCK:Int;
	@:optional var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING:Bool;
	@:optional var BROTLI_PARAM_LARGE_WINDOW:Bool;
	@:optional var BROTLI_PARAM_NPOSTFIX:Int;
	@:optional var BROTLI_PARAM_NDIRECT:Int;
}

/**
	@see https://nodejs.org/api/zlib.html#zlib_compressor_options
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
	Advanced options for controlling Brotli Decompression:
**/
typedef BrotliDecompressOptions = {
	@:optional var BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION:Bool;
	@:optional var BROTLI_DECODER_PARAM_LARGE_WINDOW:Bool;
}

/**
	Each Brotli-based class takes an options object. All options are optional.

	@see https://nodejs.org/dist/latest-v12.x/docs/api/zlib.html#zlib_class_brotlioptions
**/
typedef BrotliOptions = {
	/**
		default: `Zlib.BROTLI_OPERATION_PROCESS`
	**/
	@:optional var flush:Int;

	/**
		default: `Zlib.BROTLI_OPERATION_FINISH`
	**/
	@:optional var finishFlush:Int;

	/**
		default: `16*1024`
	**/
	@:optional var chunkSize:Int;

	@:optional var params:BrotliParams;
}

private typedef JsBuffer = EitherType<String, Buffer>;
