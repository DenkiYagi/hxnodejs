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

package js.node.tls;

/**
	The `tls.CryptoStream` class represents a stream of encrypted data.
	This class is deprecated and should no longer be used.

	@see https://nodejs.org/api/tls.html#tls_class_cryptostream
**/
@:deprecated
@:jsRequire("tls", "CryptoStream")
extern class CryptoStream {
	/**
		The `cryptoStream.bytesWritten` property returns the total number of bytes written to the underlying socket
		including the bytes required for the implementation of the TLS protocol.

		@see https://nodejs.org/api/tls.html#tls_cryptostream_byteswritten
	**/
	var authorizationError(default, null):Int;
}

