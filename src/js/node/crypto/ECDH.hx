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

import js.lib.ArrayBufferView;
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
		The supplied key is interpreted using the specified `input_encoding`,
		and the returned key is encoded using the specified `output_encoding`.

		@see https://nodejs.org/api/crypto.html#crypto_class_method_ecdh_convertkey_key_curve_inputencoding_outputencoding_format
     **/

	@:overload(function(key:String, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): String {})
	@:overload(function(key:String, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): Buffer {})
	@:overload(function(key:Buffer, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): String {})
	@:overload(function(key:Buffer, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): Buffer {})
	@:overload(function(key:ArrayBufferView, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): String {})
	function convertKey(key:ArrayBufferView, curve:String, ?input_encoding:String, ?output_encoding:String, ?format:ECDHFormat): Buffer;

	/**
		Computes the shared secret using `other_public_key` as the other party's public key and returns the computed shared secret.
		The supplied key is interpreted using specified `input_encoding`,
		and the returned secret is encoded using the specified `output_encoding`.
		If the `input_encoding` is not provided, `other_public_key` is expected to be a `Buffer` or `ArrayBufferView`.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_computesecret_otherpublickey_inputencoding_outputencoding
	**/
	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):String {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):String {})
	@:overload(function(other_public_key:ArrayBufferView, ?output_encoding:String):Buffer {})
	function computeSecret(other_public_key:ArrayBufferView, ?output_encoding:String):String;

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
		Sets the EC Diffie-Hellman private key. If `encoding` is provided, `private_key` is expected to be a string; otherwise `private_key` is expected to be a `Buffer` or `Arraybufferview`.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setprivatekey_privatekey_encoding
	**/
	@:overload(function(private_key:Buffer):Void {})
	@:overload(function(private_key:ArrayBufferView):Void {})
	function setPrivateKey(private_key:String, encoding:String):Void;

	/**
		Sets the EC Diffie-Hellman public key. If `encoding` is provided `public_key` is expected to be a string; otherwise a `Buffer` or `Arraybufferview` is expected.

		@see https://nodejs.org/api/crypto.html#crypto_ecdh_setpublickey_publickey_encoding
	**/
	@:deprecated
	@:overload(function(private_key:Buffer):Void {})
	@:overload(function(private_key:ArrayBufferView):Void {})
	function setPublicKey(public_key:String, encoding:String):Void;
}
