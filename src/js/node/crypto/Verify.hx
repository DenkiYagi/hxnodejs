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

import js.node.crypto.Constants;
import js.lib.ArrayBufferView;
import js.node.Buffer;
import js.node.stream.Writable;

/**
	The `Verify` class is a utility for verifying signatures. It can be used in one of two ways:

	* As a writable stream where written data is used to validate against the supplied signature, or
	* Using the verify.update() and verify.verify() methods to verify the signature.

	The `Crypto.createVerify()` method is used to create `Verify` instances. `Verify` objects are not to be created directly using the `new` keyword.

	@see https://nodejs.org/api/crypto.html#crypto_class_verify
**/
extern class Verify extends Writable<Sign> {
	/**
		Updates the `Verify` content with the given data, the encoding of which is given in input_encoding.
		If `input_encoding` is not provided, and the `data` is a string, an encoding of `'utf8'` is enforced.
		If data is a `Buffer` or `Arraybufferview`, then `input_encoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_verify_update_data_inputencoding
	**/
	@:overload(function(data:Buffer):Void {})
	@:overload(function(data:ArrayBufferView):Void {})
	function update(data:String, ?input_encoding:String):Void;

	/**
		Verifies the provided data using the given `object` and `signature`.

		@see https://nodejs.org/api/crypto.html#crypto_verify_verify_object_signature_signatureencoding
	**/
	@:overload(function(object:VerifyOptions, signature:String, signature_format:String):Bool {})
	@:overload(function(object:VerifyOptions, signature:Buffer):Bool {})
	@:overload(function(object:VerifyOptions, signature:ArrayBufferView):Bool {})
	@:overload(function(object:String, signature:String, signature_format:String):Bool {})
	@:overload(function(object:String, signature:Buffer):Bool {})
	@:overload(function(object:String, signature:ArrayBufferView):Bool {})
	@:overload(function(object:Buffer, signature:String, signature_format:String):Bool {})
	@:overload(function(object:Buffer, signature:Buffer):Bool {})
	@:overload(function(object:Buffer, signature:ArrayBufferView):Bool {})
	@:overload(function(object:KeyObject, signature:String, signature_format:String):Bool {})
	@:overload(function(object:KeyObject, signature:Buffer):Bool {})
	function verify(object:KeyObject, signature:ArrayBufferView):Bool;
}

/**
	An options type for `scrypt` and `scryptSync` methods of `Crypto`.
**/
typedef VerifyOptions = {
	/**
		Optional padding value for RSA.
	**/
	@:optional var padding:Int;

	/**
		salt length for when padding is `RsaPkcs1PssPassin`.
		The special value `Crypto.Constants.RSA_PSS_SALTLEN_DIGEST` sets the salt length to the digest size,
		`Crypto.Constants.RSA_PSS_SALTLEN_AUTO` (default) causes it to be determined automatically.
	**/
	@:optional var saltLength: Int;
}

