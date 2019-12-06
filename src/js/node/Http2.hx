package js.node;

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
	The http2 module provides an implementation of the HTTP/2 protocol.

	The Core API provides a low-level interface designed specifically around support for HTTP/2 protocol features.
	It is specifically not designed for compatibility with the existing HTTP/1 module API.
	However, the Compatibility API is.

	The `http2` Core API is much more symmetric between client and server than the `http` API.
	For instance, most events, like `'error'`, `'connect'` and `'stream'`, can be emitted either by client-side code or server-side code.

	@see https://nodejs.org/api/http2.html#http2_http_2
**/
@:jsRequire("http2")
extern class Http2 {}

/**
	Type of the argument for
	* `Http2.getDefaultSettings()`
	* `Http2.getPackedSettings()`
	* `Http2.createServer()`
	* `Http2.createSecureServer()`
	* `Http2Session.settings()`
	* `Http2Session.localSettings`
	* `Http2Session.remoteSettings`
**/
typedef Http2SettingsObject = {
	/**
		Specifies the maximum number of bytes used for header compression.
		The minimum allowed value is 0. The maximum allowed value is 2^32-1.
		Default: `4,096` octets.
	**/
	var headerTableSize:Int;

	/**
		Specifies `true` if HTTP/2 Push Streams are to be permitted on the Http2Session instances.
	**/
	var enablePush:Bool;

	/**
		Specifies the senders initial window size for stream-level flow control. The minimum allowed value is 0.
		The maximum allowed value is 2^32-1.
		Default: `65,535` bytes.
	**/
	var initialWindowSize:Int;

	/**
		Specifies the size of the largest frame payload.
		The minimum allowed value is 16,384.
		The maximum allowed value is 2^24-1.
		Default: `16,384` bytes.
	**/
	var maxFrameSize:Int;

	/**
		Specifies the maximum number of concurrent streams permitted on an `Http2Session`.
		There is no default value which implies, at least theoretically,
		2^32-1 streams may be open concurrently at any given time in an `Http2Session`.
		The minimum value is 0.
		The maximum allowed value is 2^32-1.
		Default: `4294967295`.
	**/
	var maxConcurrentStreams:Int;

	/**
		Specifies the maximum size (uncompressed octets) of header list that will be accepted.
		The minimum allowed value is 0.
		The maximum allowed value is 2^32-1.
		Default: `65535`.
	**/
	var maxHeaderListSize:Int;

	/**
		Specifies `true` if the "Extended Connect Protocol" defined by RFC 8441 is to be enabled.
		This setting is only meaningful if sent by the server.
		Once the `enableConnectProtocol` setting has been enabled for a given `Http2Session`,
		it cannot be disabled.
	**/
	var enableConnectProtocol:Bool;
}

/**
	Headers are represented as own-properties on JavaScript objects.
	The property keys will be serialized to lower-case.
	Property values should be strings (if they are not they will be coerced to strings) or
	an `Array` of strings (in order to send more than one value per header field).

	@see https://nodejs.org/api/http2.html#http2_headers_object
**/
typedef HeadersObject = {
	@:optional @:native(":status") var status:Int;
	@:optional @:native(":method") var method:String;
	@:optional @:native(":authority") var authority:String;
	@:optional @:native(":scheme") var scheme:String;
	@:optional @:native(":path") var path:String;
	@:optional @:native(":protocol") var protocol:String;
	@:optional var age:String;
	@:optional var authorization:String;
	@:optional @:native("access-control-allow-credentials") var access_control_allow_credentials:String;
	@:optional @:native("access-control-max-age") var access_control_max_age:String;
	@:optional @:native("access-control-requenst-method") var access_control_request_method:String;
	@:optional @:native("content-encoding") var content_encoding:String;
	@:optional @:native("content-language") var content_language:String;
	@:optional @:native("content-length") var content_length:String;
	@:optional @:native("content-location") var content_location:String;
	@:optional @:native("content-md5") var content_md5:String;
	@:optional @:native("content-range") var content_range:String;
	@:optional @:native("content-type") var content_type:String;
	@:optional var date:String;
	@:optional var dnt:String;
	@:optional var etag:String;
	@:optional var expires:String;
	@:optional var from:String;
	@:optional @:native("if-match") var if_match:String;
	@:optional @:native("if-modified-since") var if_modified_since:String;
	@:optional @:native("if-none-match") var if_none_match:String;
	@:optional @:native("if-range") var if_range:String;
	@:optional @:native("if-unmodified-since") var if_unmodified_since:String;
	@:optional @:native("last-modified") var last_modified:String;
	@:optional @:native("location") var location:String;
	@:optional @:native("max-forwards") var max_forwards:String;
	@:optional @:native("proxy-authorization") var proxy_authorization:String;
	@:optional var range:String;
	@:optional var referer:String;
	@:optional @:native("retry-after") var retry_after:String;
	@:optional var tk:String;
	@:optional @:native("upgrade-insecure-requests") var upgrade_insecure_requests:String;
	@:optional @:native("user-agent") var user_agent:String;
	@:optional @:native("x-content-type-options") var x_content_type_options:String;
	@:optional @:native("set-cookie") var set_cookie:Array<String>;
}
