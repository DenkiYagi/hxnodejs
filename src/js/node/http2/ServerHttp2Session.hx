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
import haxe.extern.Rest;

/**
	@see https://nodejs.org/api/http2.html#http2_class_serverhttp2session
**/
extern class ServerHttp2Session extends Http2Session {
	/**
		Submits an `ALTSVC` frame (as defined by RFC 7838) to the connected client.

		@see https://nodejs.org/api/http2.html#http2_serverhttp2session_altsvc_alt_originorstream
	**/
	@:overload(function(alt:String, origin_or_stream:Int):Void {})
	@:overload(function(alt:String, origin_or_stream:String):Void {})
	@:overload(function(alt:String, origin_or_stream:Url):Void {})
	function altsvc(alt:String, origin_or_stream:{origin:String}):Void;

	/**
		Submits an `ORIGIN` frame (as defined by RFC 8336) to the connected client
		to advertise the set of origins
		for which the server is capable of providing authoritative responses.

		@see https://nodejs.org/api/http2.html#http2_serverhttp2session_origin_origins
	**/
	@:overload(function(origins:Rest<String>):Void {})
	@:overload(function(origins:Rest<Url>):Void {})
	function origin(origins:Rest<{origin:String}>):Void;
}
