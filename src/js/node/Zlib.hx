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
	static var constants(default, null):ZlibConstants;

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
	@:optional var params:EitherType<BrotliCompressorParams, BrotliDecompressorOptions>;
}

abstract BrotliCompressorParams(Dynamic) {
	public function new() {
		this = {};
	}

	public var BROTLI_PARAM_MODE(get, set):BrotliParamMode;

	extern inline function get_BROTLI_PARAM_MODE() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_MODE);
	}

	extern inline function set_BROTLI_PARAM_MODE(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_MODE, value);
	}

	/**
		Ranges from `BROTLI_MIN_QUALITY` to `BROTLI_MAX_QUALITY`, with a default of `BROTLI_DEFAULT_QUALITY`
	**/
	public var BROTLI_PARAM_QUALITY(get, set):Int;

	extern inline function get_BROTLI_PARAM_QUALITY() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_QUALITY);
	}

	extern inline function set_BROTLI_PARAM_QUALITY(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_QUALITY, value);
	}

	/**
		Integer value representing the expected input size; defaults to 0 for an unknown input size.
	**/
	public var BROTLI_PARAM_SIZE_HINT(get, set):Int;

	extern inline function get_BROTLI_PARAM_SIZE_HINT() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_SIZE_HINT);
	}

	extern inline function set_BROTLI_PARAM_SIZE_HINT(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_SIZE_HINT, value);
	}

	/**
		Ranges from `BROTLI_MIN_WINDOW_BITS` to `BROTLI_MAX_WINDOW_BITS`, with a default of `BROTLI_DEFAULT_WINDOW`,
		or up to `BROTLI_LARGE_MAX_WINDOW_BITS` if the `BROTLI_PARAM_LARGE_WINDOW` flag is set.
	**/
	public var BROTLI_PARAM_LGWIN(get, set):Int;

	extern inline function get_BROTLI_PARAM_LGWIN() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_LGWIN);
	}

	extern inline function set_BROTLI_PARAM_LGWIN(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_LGWIN, value);
	}

	/**
		Ranges from `BROTLI_MIN_INPUT_BLOCK_BITS` to `BROTLI_MAX_INPUT_BLOCK_BITS`.
	**/
	public var BROTLI_PARAM_LGBLOCK(get, set):Int;

	extern inline function get_BROTLI_PARAM_LGBLOCK() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_LGBLOCK);
	}

	extern inline function set_BROTLI_PARAM_LGBLOCK(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_LGBLOCK, value);
	}

	/**
		Boolean flag that decreases compression ratio in favour of decompression speed.
	**/
	public var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING(get, set):Bool;

	extern inline function get_BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING);
	}

	extern inline function set_BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING, value);
	}

	/**
		Boolean flag enabling “Large Window Brotli” mode (not compatible with the Brotli format as standardized in RFC 7932).
	**/
	public var BROTLI_PARAM_LARGE_WINDOW(get, set):Bool;

	extern inline function get_BROTLI_PARAM_LARGE_WINDOW() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_LARGE_WINDOW);
	}

	extern inline function set_BROTLI_PARAM_LARGE_WINDOW(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_LARGE_WINDOW, value);
	}

	/**
		Ranges from 0 to `BROTLI_MAX_NPOSTFIX`.
	**/
	public var BROTLI_PARAM_NPOSTFIX(get, set):Int;

	extern inline function get_BROTLI_PARAM_NPOSTFIX() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_NPOSTFIX);
	}

	extern inline function set_BROTLI_PARAM_NPOSTFIX(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_NPOSTFIX, value);
	}

	/**
		Ranges from `0` to `15 << NPOSTFIX` in steps of `1 << NPOSTFIX`.
	**/
	public var BROTLI_PARAM_NDIRECT(get, set):Int;

	extern inline function get_BROTLI_PARAM_NDIRECT() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_NDIRECT);
	}

	extern inline function set_BROTLI_PARAM_NDIRECT(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_NDIRECT, value);
	}
}

/**
	A value type for `BROTLI_PARAM_MODE` of `BrotliCompressorOptions`
**/
abstract BrotliParamMode(Int) {
	/**
		(default)
	**/
	public static var BROTLI_MODE_GENERIC(get, never):BrotliParamMode;

	static extern inline function get_BROTLI_MODE_GENERIC() {
		return cast Zlib.constants.BROTLI_MODE_GENERIC;
	}

	/**
		adjusted for UTF-8 text
	**/
	public static var BROTLI_MODE_TEXT(get, never):BrotliParamMode;

	static extern inline function get_BROTLI_MODE_TEXT() {
		return cast Zlib.constants.BROTLI_MODE_TEXT;
	}

	/**
		adjusted for WOFF 2.0 fonts
	**/
	public static var BROTLI_MODE_FONT(get, never):BrotliParamMode;

	static extern inline function get_BROTLI_MODE_FONT() {
		return cast Zlib.constants.BROTLI_MODE_FONT;
	}
}

/**
	Advanced options for controlling Brotli Decompression

	@see https://nodejs.org/api/zlib.html#zlib_decompressor_options
**/
abstract BrotliDecompressorOptions(Dynamic) {
	public function new() {
		this = {};
	}

	public var BROTLI_PARAM_MODE(get, set):BrotliParamMode;

	extern inline function get_BROTLI_PARAM_MODE() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_PARAM_MODE);
	}

	extern inline function set_BROTLI_PARAM_MODE(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_PARAM_MODE, value);
	}

	/**
		Boolean flag that affects internal memory allocation patterns.
	**/
	public var BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION(get, set):Bool;

	extern inline function get_BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION() {
		return js.Syntax.code("{0}[{1}]", this, Zlib.constants.BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION);
	}

	extern inline function set_BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION(value) {
		return js.Syntax.code("{0}[{1}] = {2}", this, Zlib.constants.BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION, value);
	}
}

/**
	Each zlib-based class takes an `options` object. All options are optional.

	@see https://nodejs.org/api/zlib.html#zlib_class_options
**/
@:native("Options")
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

/**
	@see https://nodejs.org/api/zlib.html#zlib_constants
**/
typedef ZlibConstants = {
	var Z_NO_FLUSH(default, never):Int;
	var Z_PARTIAL_FLUSH(default, never):Int;
	var Z_SYNC_FLUSH(default, never):Int;
	var Z_FULL_FLUSH(default, never):Int;
	var Z_FINISH(default, never):Int;
	var Z_BLOCK(default, never):Int;
	var Z_TREES(default, never):Int;

	var Z_OK(default, never):Int;
	var Z_STREAM_END(default, never):Int;
	var Z_NEED_DICT(default, never):Int;
	var Z_ERRNO(default, never):Int;
	var Z_STREAM_ERROR(default, never):Int;
	var Z_DATA_ERROR(default, never):Int;
	var Z_MEM_ERROR(default, never):Int;
	var Z_BUF_ERROR(default, never):Int;
	var Z_VERSION_ERROR(default, never):Int;
	var Z_NO_COMPRESSION(default, never):Int;
	var Z_BEST_SPEED(default, never):Int;
	var Z_BEST_COMPRESSION(default, never):Int;
	var Z_DEFAULT_COMPRESSION(default, never):Int;
	var Z_FILTERED(default, never):Int;
	var Z_HUFFMAN_ONLY(default, never):Int;
	var Z_RLE(default, never):Int;
	var Z_FIXED(default, never):Int;
	var Z_DEFAULT_STRATEGY(default, never):Int;
	// Brotli Flush operations
	var BROTLI_OPERATION_PROCESS(default, never):Int;
	var BROTLI_OPERATION_FLUSH(default, never):Int;
	var BROTLI_OPERATION_FINISH(default, never):Int;
	var BROTLI_OPERATION_EMIT_METADATA(default, never):Int;
	// BROTLI_PARAM_MODE
	var BROTLI_PARAM_MODE(default, never):Int;
	var BROTLI_MODE_GENERIC(default, never):Int;
	var BROTLI_MODE_TEXT(default, never):Int;
	var BROTLI_MODE_FONT(default, never):Int;
	// BROTLI_PARAM_QUALITY
	var BROTLI_PARAM_QUALITY(default, never):Int;
	var BROTLI_MIN_QUALITY(default, never):Int;
	var BROTLI_MAX_QUALITY(default, never):Int;
	var BROTLI_DEFAULT_QUALITY(default, never):Int;
	// BROTLI_PARAM_SIZE_HINT
	var BROTLI_PARAM_SIZE_HINT(default, never):Int;
	// BROTLI_PARAM_LGWIN
	var BROTLI_PARAM_LGWIN(default, never):Int;
	var BROTLI_MIN_WINDOW_BITS(default, never):Int;
	var BROTLI_MAX_WINDOW_BITS(default, never):Int;
	var BROTLI_DEFAULT_WINDOW(default, never):Int;
	var BROTLI_LARGE_MAX_WINDOW_BITS(default, never):Int;
	var BROTLI_PARAM_LARGE_WINDO(default, never):Int;
	// BROTLI_PARAM_LGBLOCK
	var BROTLI_PARAM_LGBLOCK(default, never):Int;
	var BROTLI_MIN_INPUT_BLOCK_BITS(default, never):Int;
	var BROTLI_MAX_INPUT_BLOCK_BITS(default, never):Int;
	// BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING
	var BROTLI_PARAM_DISABLE_LITERAL_CONTEXT_MODELING(default, never):Int;
	// BROTLI_PARAM_LARGE_WINDOW
	var BROTLI_PARAM_LARGE_WINDOW(default, never):Int;
	// BROTLI_PARAM_NPOSTFIX
	var BROTLI_PARAM_NPOSTFIX(default, never):Int;
	var BROTLI_MAX_NPOSTFIX(default, never):Int;
	// BROTLI_PARAM_NDIRECT
	var BROTLI_PARAM_NDIRECT(default, never):Int;
	// BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION
	var BROTLI_DECODER_PARAM_DISABLE_RING_BUFFER_REALLOCATION(default, never):Int;
	// BROTLI_DECODER_PARAM_LARGE_WINDOW
	var BROTLI_DECODER_PARAM_LARGE_WINDOW(default, never):Int;
}
