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
extern class Http2Constants {
	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x00
		Name: No Error
	**/
	var NGHTTP2_NO_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x01
		Name: Protocol Error
	**/
	var NGHTTP2_PROTOCOL_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x02
		Name: Internal Error
	**/
	var NGHTTP2_INTERNAL_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x03
		Name: Flow Control Error
	**/
	var NGHTTP2_FLOW_CONTROL_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x04
		Name: Settings Timeout
	**/
	var NGHTTP2_SETTINGS_TIMEOUT(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x05
		Name: Stream Closed
	**/
	var NGHTTP2_STREAM_CLOSED(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x06
		Name: Frame Size Error
	**/
	var NGHTTP2_FRAME_SIZE_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x07
		Name: Refused Stream
	**/
	var NGHTTP2_REFUSED_STREAM(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x08
		Name: Cancel
	**/
	var NGHTTP2_CANCEL(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x09
		Name: Compression Error
	**/
	var NGHTTP2_COMPRESSION_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x0a
		Name: Connect Error
	**/
	var NGHTTP2_CONNECT_ERROR(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x0b
		Name: Enhance Your Calm
	**/
	var NGHTTP2_ENHANCE_YOUR_CALM(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x0c
		Name: Inadequate Security
	**/
	var NGHTTP2_INADEQUATE_SECURITY(default, never):Int;

	/**
		Error Code for `RST_STREAM` and `GOAWAY`
		Value: 0x0d
		Name: HTTP/1.1 Required
	**/
	var NGHTTP2_HTTP_1_1_REQUIRED(default, never):Int;

	var NGHTTP2_SESSION_SERVER(default, never):Int;

	/**
		`Http2Session`'s type in `http2session.type`
	**/
	var NGHTTP2_SESSION_CLIENT(default, never):Int;

	/**
		No padding is applied.
	**/
	var PADDING_STRATEGY_NONE(default, never):Int;

	/**
		The maximum amount of padding, determined by the internal implementation, is applied.
	**/
	var PADDING_STRATEGY_MAX(default, never):Int;

	/**
		Attempts to apply enough padding to ensure that the total frame length,
		including the 9-byte header, is a multiple of 8.
		For each frame, there is a maximum allowed number of padding bytes that is determined
		by current flow control state and settings.
		If this maximum is less than the calculated amount needed to ensure alignment,
		the maximum is used and the total frame length is not necessarily aligned at 8 bytes.
	**/
	var PADDING_STRATEGY_ALIGNED(default, never):Int;
}
