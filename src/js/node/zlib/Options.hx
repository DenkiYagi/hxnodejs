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
	Each zlib-based class takes an `options` object. All options are optional.

	@see https://nodejs.org/api/zlib.html#zlib_class_options
**/
typedef Options = {
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

