package js.node.http2;

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
/**
	@see https://nodejs.org/api/http2.html#http2_http2_constants
**/
@:jsRequire("http2", "constants")
extern class Constants {
	var NGHTTP2_NO_ERROR:Int;
	var NGHTTP2_PROTOCOL_ERROR:Int;
	var NGHTTP2_INTERNAL_ERROR:Int;
	var NGHTTP2_FLOW_CONTROL_ERROR:Int;
	var NGHTTP2_SETTINGS_TIMEOUT:Int;
	var NGHTTP2_STREAM_CLOSED:Int;
	var NGHTTP2_FRAME_SIZE_ERROR:Int;
	var NGHTTP2_REFUSED_STREAM:Int;
	var NGHTTP2_CANCEL:Int;
	var NGHTTP2_COMPRESSION_ERROR:Int;
	var NGHTTP2_CONNECT_ERROR:Int;
	var NGHTTP2_ENHANCE_YOUR_CALM:Int;
	var NGHTTP2_INADEQUATE_SECURITY:Int;
	var NGHTTP2_HTTP_1_1_REQUIRED:Int;
}
