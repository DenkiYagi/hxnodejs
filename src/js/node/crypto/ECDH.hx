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
import js.node.Crypto.BinaryLike;
import js.node.Crypto.BufferLike;
import js.node.Buffer;

@:enum abstract ECDHFormat(String) from String to String {
	var Compressed = "compressed";
	var Uncompressed = "uncompressed";
	var Hybrid = "hybrid";
}

/**
	The `ECDH` class is a utility for creating Elliptic Curve Diffie-Hellman (ECDH) key exchanges.

	@see https://nodejs.org/api/crypto.html#crypto_class_ecdh
**/
extern class ECDH {
	/**
		Converts the EC Diffie-Hellman public key specified by `key` and `curve` to the format specified by `format`.
		The `format` argument specifies point encoding and can be `'compressed'`, `'uncompressed'` or `'hybrid'`.
		The supplied key is interpreted using the specified `inputEncoding`,
		and the returned key is encoded using the specified `outputEncoding`.

		@see https://nodejs.org/api/crypto.html#crypto_class_method_ecdh_convertkey_key_curve_inputencoding_outputencoding_format
	**/
	function convertKey(key:BinaryLike, curve:String, ?inputEncoding:String, ?outputEncoding:String, ?format:ECDHFormat):EitherType<Buffer, String>;

	/**
		Computes the shared secret using `otherPublicKey` as the other party's public key and returns the computed shared secret.
		The supplied key is interpreted using specified `inputEncoding`,
		and the returned secret is encoded using the specified `outputEncoding`.
		If the `inputEncoding` is not provided, `otherPublicKey` is expected to be a `Buffer` or `ArrayBufferView`.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_computesecret_otherpublickey_inputencoding_outputencoding
	**/
	function computeSecret(otherPublicKey:BinaryLike, ?inputEncoding:String, ?outputEncoding:String):EitherType<Buffer, String>;

	/**
		Generates private and public EC Diffie-Hellman key values, and returns the public key in the specified `format` and `encoding`.
		This key should be transferred to the other party.

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
		The `format` argument specifies point encoding and can be `'compressed'` or `'uncompressed'`.
		If `format` is not specified the point will be returned in `'uncompressed'` format.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_getpublickey_encoding_format
	**/
	@:overload(function(?encoding:String, ?format:ECDHFormat):String {})
	function getPublicKey(?encoding:String, ?format:ECDHFormat):Buffer;

	/**
		Sets the EC Diffie-Hellman private key.
		If `encoding` is provided, `privateKey` is expected to be a string;
		otherwise `privateKey` is expected to be a `BufferLike`.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setprivatekey_privatekey_encoding
	**/
	@:overload(function(privateKey:String, encoding:String):Void {})
	function setPrivateKey(privateKey:BufferLike, encoding:String):Void;

	/**
		Sets the EC Diffie-Hellman public key.
		If `encoding` is provided `publicKey` is expected to be a string;
		otherwise a `BufferLike` is expected.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setpublickey_publickey_encoding
	**/
	@:deprecated
	@:overload(function(privateKey:String, encoding:String):Void {})
	function setPublicKey(publicKey:BufferLike):Void;
}
