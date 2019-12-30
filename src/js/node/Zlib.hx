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
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.lib.ArrayBufferView;
import js.node.Buffer;
import js.node.zlib.BrotliCompress;
import js.node.zlib.BrotliDecompress;
import js.node.zlib.Deflate;
import js.node.zlib.DeflateRaw;
import js.node.zlib.Gunzip;
import js.node.zlib.Gzip;
import js.node.zlib.Inflate;
import js.node.zlib.InflateRaw;
import js.node.zlib.Unzip;

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
	static var constants(default, null):js.node.zlib.Constants;

	/**
		Creates and returns a new `BrotliCompress` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createbrotlicompress_options
	**/
	static function createBrotliCompress(?options:BrotliOptions):BrotliCompress;

	/**
		Creates and returns a new `BrotliDecompress` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createbrotlidecompress_options
	**/
	static function createBrotliDecompress(?options:BrotliOptions):BrotliDecompress;

	/**
		Creates and returns a new `Deflate` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createdeflate_options
	**/
	static function createDeflate(?options:ZlibOptions):Deflate;

	/**
		Creates and returns a new `DeflateRaw` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createdeflateraw_options
	**/
	static function createDeflateRaw(?options:ZlibOptions):DeflateRaw;

	/**
		Creates and returns a new `Gunzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_creategunzip_options
	**/
	static function createGunzip(?options:ZlibOptions):Gunzip;

	/**
		Creates and returns a new `Gzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_creategzip_options
	**/
	static function createGzip(?options:ZlibOptions):Gzip;

	/**
		Creates and returns a new `Inflate` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createinflate_options
	**/
	static function createInflate(?options:ZlibOptions):Inflate;

	/**
		Creates and returns a new `InflateRaw` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createinflateraw_options
	**/
	static function createInflateRaw(?options:ZlibOptions):InflateRaw;

	/**
		Creates and returns a new `Unzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createunzip_options
	**/
	static function createUnzip(?options:ZlibOptions):Unzip;

	/**
		Compress a string with `Brotli`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_brotlicompress_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function brotliCompress(buf:String, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `BrotliCompress`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_brotlicompresssync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:BrotliOptions):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:BrotliOptions):Void {})
	static function brotliCompressSync(buf:String, ?options:BrotliOptions):Void;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_brotlidecompress_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function brotliDecompress(buf:String, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `BrotliDecompress`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_brotlidecompresssync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:BrotliOptions):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:BrotliOptions):Void {})
	static function brotliDecompressSync(buf:String, ?options:BrotliOptions):Void;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflate_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function deflate(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Deflate`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflatesync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function deflateSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflateraw_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function deflateRaw(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `DeflateRaw`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflaterawsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function deflateRawSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_gunzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function gunzip(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Gunzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_gunzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function gunzipSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_gzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function gzip(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Gzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_gzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function gzipSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflate_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function inflate(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Inflate`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflatesync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function inflateSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflateraw_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function inflateRaw(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `InflateRaw`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflaterawsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function inflateRawSync(buf:String, ?options:ZlibOptions):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_unzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function unzip(buf:String, ?options:ZlibOptions, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Unzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_unzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:ZlibOptions):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:ZlibOptions):Buffer {})
	static function unzipSync(buf:String, ?options:ZlibOptions):Buffer;
}

/**
	Each Brotli-based class takes an `options` object. All options are optional.

	@see https://nodejs.org/api/zlib.html#zlib_class_brotlioptions
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

	/**
		Key-value object containing indexed Brotli parameters.
	**/
	@:optional var params:EitherType<BrotliCompressorOptions, BrotliDecompressorOptions>;
}

abstract BrotliCompressorOptions(Dynamic) {
	public function new() {
		this = {};
	}

	public var BROTLI_PARAM_MODE(get, set):BrotliParamMode;

	extern inline function get_BROTLI_PARAM_MODE() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_MODE);
	}

	extern inline function set_BROTLI_PARAM_MODE(value) {
		Reflect.setField(this, js.node.zlib.Constants.BROTLI_PARAM_MODE, value);
		return value;
	}

	// /**
	// 	Ranges from `BROTLI_MIN_QUALITY` to `BROTLI_MAX_QUALITY`, with a default of `BROTLI_DEFAULT_QUALITY`
	// **/
	// public var BROTLI_PARAM_QUALITY(get, set):Int;
	// /**
	// 	Integer value representing the expected input size; defaults to 0 for an unknown input size.
	// **/
	// public var BROTLI_PARAM_SIZE_HINT(get, set):Int;
	// /**
	// 	Ranges from `BROTLI_MIN_WINDOW_BITS` to `BROTLI_MAX_WINDOW_BITS`, with a default of `BROTLI_DEFAULT_WINDOW`,
	// 	or up to `BROTLI_LARGE_MAX_WINDOW_BITS` if the `BROTLI_PARAM_LARGE_WINDOW` flag is set.
	// **/
	// public var BROTLI_PARAM_LGWIN(get, set):Int;
	// /**
	// 	Ranges from `BROTLI_MIN_INPUT_BLOCK_BITS` to `BROTLI_MAX_INPUT_BLOCK_BITS`.
	// **/
	// public var BROTLI_PARAM_LGBLOCK(get, set):Int;
	// /**
	// 	Boolean flag that decreases compression ratio in favour of decompression speed.
	// **/
	// public var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING(get, set):Bool;
	// /**
	// 	Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
	// **/
	// public var BROTLI_PARAM_LARGE_WINDOW(get, set):Bool;
	// /**
	// 	Ranges from 0 to `BROTLI_MAX_NPOSTFIX`.
	// **/
	// public var BROTLI_PARAM_NPOSTFIX(get, set):Int;
	// /**
	// 	Ranges from `0` to `15 << NPOSTFIX` in steps of `1 << NPOSTFIX`.
	// **/
	// public var BROTLI_PARAM_NDIRECT(get, set):Int;
}

// /**
// 	There are several options that can be set on Brotli encoders, affecting compression efficiency and speed.
// 	@see https://nodejs.org/api/zlib.html#zlib_compressor_options
// **/
// typedef BrotliCompressorOptions = {
// 	/**
// 	**/
// 	@:optional var BROTLI_PARAM_MODE:BrotliParamMode;
// 	/**
// 		Ranges from `BROTLI_MIN_QUALITY` to `BROTLI_MAX_QUALITY`, with a default of `BROTLI_DEFAULT_QUALITY`
// 	**/
// 	@:optional var BROTLI_PARAM_QUALITY:Int;
// 	/**
// 		Integer value representing the expected input size; defaults to 0 for an unknown input size.
// 	**/
// 	@:optional var BROTLI_PARAM_SIZE_HINT:Int;
// 	/**
// 		Ranges from `BROTLI_MIN_WINDOW_BITS` to `BROTLI_MAX_WINDOW_BITS`, with a default of `BROTLI_DEFAULT_WINDOW`,
// 		or up to `BROTLI_LARGE_MAX_WINDOW_BITS` if the `BROTLI_PARAM_LARGE_WINDOW` flag is set.
// 	**/
// 	@:optional var BROTLI_PARAM_LGWIN:Int;
// 	/**
// 		Ranges from `BROTLI_MIN_INPUT_BLOCK_BITS` to `BROTLI_MAX_INPUT_BLOCK_BITS`.
// 	**/
// 	@:optional var BROTLI_PARAM_LGBLOCK:Int;
// 	/**
// 		Boolean flag that decreases compression ratio in favour of decompression speed.
// 	**/
// 	@:optional var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING:Bool;
// 	/**
// 		Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
// 	**/
// 	@:optional var BROTLI_PARAM_LARGE_WINDOW:Bool;
// 	/**
// 		Ranges from 0 to `BROTLI_MAX_NPOSTFIX`.
// 	**/
// 	@:optional var BROTLI_PARAM_NPOSTFIX:Int;
// 	/**
// 		Ranges from `0` to `15 << NPOSTFIX` in steps of `1 << NPOSTFIX`.
// 	**/
// 	@:optional var BROTLI_PARAM_NDIRECT:Int;
// }

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
typedef BrotliDecompressorOptions = {
	/**
		Boolean flag that affects internal memory allocation patterns.
	**/
	@:optional var BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION:Bool;

	/**
		Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
	**/
	@:optional var BROTLI_DECODER_PARAM_LARGE_WINDOW:Bool;
}

/**
	Each zlib-based class takes an `options` object. All options are optional.

	@see https://nodejs.org/api/zlib.html#zlib_class_options
**/
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

	/**
	**/
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
