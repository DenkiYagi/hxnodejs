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

/**
	Node.js uses a `KeyObject` class to represent a symmetric or asymmetric key, and each kind of key exposes different functions.
 	The `Crypto.createSecretKey()`, `Crypto.createPublicKey()` and `Crypto.createPrivateKey()` methods are used to create `KeyObject` instances.
 	`KeyObject` objects are not to be created directly using the new keyword.

 	@see https://nodejs.org/api/crypto.html#crypto_class_keyobject
**/
extern class KeyObject {
	/**
		 For asymmetric keys, this property represents the type of the key.

		 @see https://nodejs.org/api/crypto.html#crypto_keyobject_asymmetrickeytype
	**/
    var asymmetricKeyType: String;

	/**
		 For symmetric keys, this function allocates a `Buffer` containing the key material and ignores any options.

		 @see https://nodejs.org/api/crypto.html#crypto_keyobject_export_options
	**/
	@:overload(function(?options: ExportPrivateKeyOptions):String {})
	static function export(?options: ExportPublicKeyOptions): Buffer;

	/**
		 For secret keys, this property represents the size of the key in bytes.
		 This property is undefined for asymmetric keys.

		 @see https://nodejs.org/api/crypto.html#crypto_keyobject_symmetrickeysize
	**/
    var symmetricKeySize: Int;

	/**
		 Depending on the type of this `KeyObject`,
		 this property is either `'secret'` for secret (symmetric) keys, `'public'` for public (asymmetric) keys or `'private'` for private (asymmetric) keys.

		 @see https://nodejs.org/api/crypto.html#crypto_keyobject_type
	**/
    var type: String;
}

/**
	An options type for `export` of `KeyObject` for public key.
**/
typedef ExportPublicKeyOptions = {

	/**
		 Must be one of `'pkcs1'` (RSA only) or `'spki'`.
	**/
	var type: String;

	/**
		 Must be `'pem'` or `'der'`.
	**/
	var format: String;
}

/**
	An options type for `export` of `KeyObject` for private key.
**/
typedef ExportPrivateKeyOptions = {
	/**
		 Must be one of `'pkcs1'` (RSA only), `'pkcs8'` or `'sec1'` (EC only).
	**/
	var type: String;

	/**
		 Must be `'pem'` or `'der'`.
	**/
	var format: String;

	/**
		 If specified, the private key will be encrypted with the given cipher and passphrase using PKCS#5 v2.0 password based encryption.
	**/
    var cipher: String;

	/**
		 The passphrase to use for encryption, see `cipher`.
	**/
    var passphrase: EitherType<String, Buffer>;
}

