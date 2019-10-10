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

package js.node.crypto;

import js.node.Buffer;
import js.lib.ArrayBufferView;

/**
	SPKAC is a Certificate Signing Request mechanism originally implemented by Netscape
	and was specified formally as part of HTML5's keygen element.

	@see https://nodejs.org/api/crypto.html#crypto_class_certificate
**/
@:jsRequire("crypto", "Certificate")
extern class Certificate {
	function new();

	/**
		Returns the challenge component of the `spkac` data structure, which includes a public key and a challenge.

		@see https://nodejs.org/api/crypto.html#crypto_certificate_exportchallenge_spkac
	**/
	@:overload(function(spkac:String):Buffer {})
	@:overload(function(spkac:Buffer):Buffer {})
	function exportChallenge(spkac:ArrayBufferView):Buffer;

	/**
		Returns the public key component of the `spkac` data structure, which includes a public key and a challenge.

		@see https://nodejs.org/api/crypto.html#crypto_certificate_exportpublickey_spkac_encoding
	**/
	@:overload(function(spkac:String, ?encoding:String):Buffer {})
	@:overload(function(spkac:Buffer, ?encoding:String):Buffer {})
	function exportPublicKey(spkac:ArrayBufferView, ?encoding:String):Buffer;

	/**
		Returns `true` if the given `spkac` data structure is valid, `false` otherwise.

		@see https://nodejs.org/api/crypto.html#crypto_certificate_verifyspkac_spkac
	**/
	@:overload(function(spkac:Buffer):Bool {})
	function verifySpkac(spkac:ArrayBufferView):Bool;
}
