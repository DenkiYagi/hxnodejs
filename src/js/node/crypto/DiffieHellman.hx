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

/**
	Common interface for `DiffieHellman` and a mimic object returned by `Crypto.getDiffieHellman`.
	See `DiffieHellman` documentation.
**/
@:remove
extern interface IDiffieHellman {
	@:overload(function():Buffer {})
	function generateKeys(encoding:String):String;

	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):String {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):String {})
	@:overload(function(other_public_key:ArrayBufferView, ?output_encoding:String):Buffer {})
	function computeSecret(other_public_key:ArrayBufferView, ?output_encoding:String):String;

	@:overload(function():Buffer {})
	function getPrime(encoding:String):String;

	@:overload(function():Buffer {})
	function getGenerator(encoding:String):String;

	@:overload(function():Buffer {})
	function getPublicKey(encoding:String):String;

	@:overload(function():Buffer {})
	function getPrivateKey(encoding:String):String;
}

/**
	The `DiffieHellman` class is a utility for creating Diffie-Hellman key exchanges.

	@see https://nodejs.org/api/crypto.html#crypto_class_diffiehellman
**/
extern class DiffieHellman implements IDiffieHellman {
	/**
		Computes the shared secret using `other_publicKey` as the other party's public key and returns the computed shared secret.
		The supplied key is interpreted using the specified `input_encoding`, and secret is encoded using specified `output_encoding`.
		If the `input_encoding` is not provided, `other_public_key` is expected to be a `Buffer`.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_computesecret_otherpublickey_inputencoding_outputencoding
	**/
	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:String, input_encoding:String, ?output_encoding:String):String {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):Buffer {})
	@:overload(function(other_public_key:Buffer, ?output_encoding:String):String {})
	@:overload(function(other_public_key:ArrayBufferView, ?output_encoding:String):Buffer {})
	function computeSecret(other_public_key:ArrayBufferView, ?output_encoding:String):String;

	/**
		Generates private and public Diffie-Hellman key values, and returns the public key in the specified `encoding`.
		This key should be transferred to the other party.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_generatekeys_encoding
	**/
	@:overload(function():Buffer {})
	function generateKeys(encoding:String):String;

	/**
		Returns the Diffie-Hellman generator in the specified `encoding`.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_getgenerator_encoding
	**/
	@:overload(function():Buffer {})
	function getGenerator(encoding:String):String;

	/**
		Returns the Diffie-Hellman prime in the specified `encoding`.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_getprime_encoding
	**/
	@:overload(function():Buffer {})
	function getPrime(encoding:String):String;

	/**
		Returns the Diffie-Hellman private key in the specified `encoding`.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_getprivatekey_encoding
	**/
	@:overload(function():Buffer {})
	function getPrivateKey(encoding:String):String;

	/**
		Returns the Diffie-Hellman public key in the specified `encoding`.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_getpublickey_encoding
	**/
	@:overload(function():Buffer {})
	function getPublicKey(encoding:String):String;

	/**
		Sets the Diffie-Hellman private key. If the `encoding` argument is provided, `private_key` is expected to be a string.
		If no `encoding` is provided, `private_key` is expected to be a `Buffer` or `ArrayBufferView` .

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_setprivatekey_privatekey_encoding
	**/
	@:overload(function(private_key:String, ?encode:String):Void {})
	@:overload(function(private_key:Buffer, ?encode:String):Void {})
	function setPrivateKey(private_key:ArrayBufferView, ?encoding:String):Void;

	/**
		Sets the Diffie-Hellman public key. If the `encoding` argument is provided, `public_key` is expected to be a string.
		If no `encoding` is provided, `public_key` is expected to be a `Buffer` or `ArrayBufferView`.

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_setpublickey_publickey_encoding
	**/
	@:overload(function(public_key:String, ?encoding:String):Void {})
	@:overload(function(public_key:Buffer, ?encoding:String):Void {})
	function setPublicKey(public_key:ArrayBufferView, ?encoding:String):Void;

	/**
		A bit field containing any warnings and/or errors resulting from a check performed during initialization of the `DiffieHellman` object.

		The following values are valid (as defined in `Crypto.Constants` module):
		* DH_CHECK_P_NOT_SAFE_PRIME
		* DH_CHECK_P_NOT_PRIME
		* DH_UNABLE_TO_CHECK_GENERATOR
		* DH_NOT_SUITABLE_GENERATOR
		* DH_CHECK_P_NOT_SAFE_PRIME

		@see https://nodejs.org/api/crypto.html#crypto_diffiehellman_verifyerror
	**/
	var verifyError(default, null):Int;
}
