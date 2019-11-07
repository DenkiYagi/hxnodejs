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
import js.lib.ArrayBufferView;
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
	static var constants(default, null):Constants;

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
	static function createDeflate(?options:Options):Deflate;

	/**
		Creates and returns a new `DeflateRaw` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createdeflateraw_options
	**/
	static function createDeflateRaw(?options:Options):DeflateRaw;

	/**
		Creates and returns a new `Gunzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_creategunzip_options
	**/
	static function createGunzip(?options:Options):Gunzip;

	/**
		Creates and returns a new `Gzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_creategzip_options
	**/
	static function createGzip(?options:Options):Gzip;

	/**
		Creates and returns a new `Inflate` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createinflate_options
	**/
	static function createInflate(?options:Options):Inflate;

	/**
		Creates and returns a new `InflateRaw` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createinflateraw_options
	**/
	static function createInflateRaw(?options:Options):InflateRaw;

	/**
		Creates and returns a new `Unzip` object.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_createunzip_options
	**/
	static function createUnzip(?options:Options):Unzip;

	/**
		Compress a string with `Brotli`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_brotlicompress_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:BrotliOptions, callback:Null<Error>->Buffer->Void):Void {})
	static function brotliCompress(buf:String, ?options: BrotliOptions, callback:Null<Error>->Buffer->Void):Void;

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
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function deflate(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Deflate`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflatesync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function deflateSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflateraw_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function deflateRaw(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `DeflateRaw`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_deflaterawsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function deflateRawSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_gunzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function gunzip(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Gunzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_gunzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function gunzipSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_gzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function gzip(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Compress a chunk of data with `Gzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_gzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function gzipSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflate_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function inflate(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Inflate`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflatesync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function inflateSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflateraw_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function inflateRaw(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `InflateRaw`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_inflaterawsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function inflateRawSync(buf:String, ?options:Options):Buffer;

	/**
		@see https://nodejs.org/api/zlib.html#zlib_zlib_unzip_buffer_options_callback
	**/
	@:overload(function(buf:Buffer, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	@:overload(function(buf:ArrayBufferView, ?options:Options, callback:Null<Error>->Buffer->Void):Void {})
	static function unzip(buf:String, ?options:Options, callback:Null<Error>->Buffer->Void):Void;

	/**
		Decompress a chunk of data with `Unzip`.

		@see https://nodejs.org/api/zlib.html#zlib_zlib_unzipsync_buffer_options
	**/
	@:overload(function(buf:Buffer, ?options:Options):Buffer {})
	@:overload(function(buf:ArrayBufferView, ?options:Options):Buffer {})
	static function unzipSync(buf:String, ?options:Options):Buffer;
}
