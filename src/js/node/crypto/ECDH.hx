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

import haxe.extern.EitherType;
import js.node.Buffer;

@:enum abstract ECDHFormat(String) from String to String {
	var Compressed = "compressed";
	var Uncompressed = "uncompressed";
	var Hybrid = "hybrid";
}

/**
	The ECDH class is a utility for creating Elliptic Curve Diffie-Hellman (ECDH) key exchanges.

	@see https://nodejs.org/api/crypto.html#crypto_class_ecdh
**/
extern class ECDH {
	/**
		Converts the EC Diffie-Hellman public key specified by `key` and `curve` to the format specified by `format`. The `format` argument specifies point encoding and can be `'compressed'`, `'uncompressed'` or `'hybrid'`. The supplied key is interpreted using the specified `input_encoding`, and the returned key is encoded using the specified `output_encoding`.

		@see https://nodejs.org/api/crypto.html#crypto_class_method_ecdh_convertkey_key_curve_inputencoding_outputencoding_format
     **/
	@:overload(function(key:Buffer, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): EitherType<Buffer, String> {})
	function convertKey(key:String, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): EitherType<Buffer, String>;

	/**
		Computes the shared secret using `other_public_key` as the other party's public key and returns the computed shared secret. The supplied key is interpreted using specified `input_encoding`, and the returned secret is encoded using the specified `output_encoding`. If the `input_encoding` is not provided, `other_public_key` is expected to be a `Buffer`.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_computesecret_otherpublickey_inputencoding_outputencoding
	**/
	@:overload(function(other_public_key:String, input_encoding:String, output_encoding:String):String {})
	@:overload(function(other_public_key:String, input_encoding:String):Buffer {})
	function computeSecret(other_public_key:Buffer):Buffer;

	/**
		Generates private and public EC Diffie-Hellman key values, and returns the public key in the specified `format` and `encoding`. This key should be transferred to the other party.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_generatekeys_encoding_format
	**/
	@:overload(function(encoding:String, ?format:ECDHFormat):String {})
	function generateKeys(?format:ECDHFormat):Buffer;

	/**
		If `encoding` is specified, a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_getprivatekey_encoding
	**/
	@:overload(function():Buffer {})
	function getPrivateKey(encoding:String):String;

	/**
		The `format` argument specifies point encoding and can be `'compressed'` or `'uncompressed'`. If `format` is not specified the point will be returned in `'uncompressed'` format.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_getpublickey_encoding_format
	**/
	function getPublicKey(?encoding:String, ?format:ECDHFormat):EitherType<String, Buffer>;

	/**
		Sets the EC Diffie-Hellman private key. If `private_key` is not valid for the curve specified when the `ECDH` object was created, an error is thrown. Upon setting the private key, the associated public point (key) is also generated and set in the `ECDH` object.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setprivatekey_privatekey_encoding
	**/
	@:overload(function(private_key:Buffer):Void {})
	function setPrivateKey(private_key:String, encoding:String):Void;

	/**
		Sets the EC Diffie-Hellman public key. There is not normally a reason to call this method because `ECDH` only requires a private key and the other party's public key to compute the shared secret. Typically either `Ecdh.generateKeys()` or `Ecdh.setPrivateKey()` will be called. The `Ecdh.setPrivateKey()` method attempts to generate the public point/key associated with the private key being set.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setpublickey_publickey_encoding
	**/
	@:deprecated @:overload(function(public_key:Buffer):Void {})
	function setPublicKey(public_key:String, encoding:String):Void;
}
