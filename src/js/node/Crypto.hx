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

package js.node;

import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.Buffer;
import js.node.crypto.*;
import js.node.crypto.DiffieHellman.IDiffieHellman;
import js.node.tls.SecureContext;
import js.node.stream.Transform;

/**
	Enumerations of crypto algorighms to be used.
**/
@:enum abstract CryptoAlgorithm(String) from String to String {
	var SHA1 = "sha1";
	var MD5 = "md5";
	var SHA256 = "sha256";
	var SHA512 = "sha512";
}

/**
	Enumeration of supported group names for `Crypto.getDiffieHellman`.
**/
@:enum abstract DiffieHellmanGroupName(String) from String to String {
	var Modp1 = "modp1";
	var Modp2 = "modp2";
	var Modp5 = "modp5";
	var Modp14 = "modp14";
	var Modp15 = "modp15";
	var Modp16 = "modp16";
	var Modp17 = "modp17";
	var Modp18 = "modp18";
}

/**
	The crypto module provides cryptographic functionality that includes
	a set of wrappers for OpenSSL's hash, HMAC, cipher, decipher, sign, and verify functions.

	@see https://nodejs.org/dist/latest-v12.x/docs/api/crypto.html#crypto_crypto
**/
@:jsRequire("crypto")
extern class Crypto {
	/**
		The default encoding to use for functions that can take either strings or buffers. The default value is 'buffer', which makes methods default to Buffer objects.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_default_encoding
	**/
	@:deprecated
	static var DEFAULT_ENCODING:String;

	/**
		Property for checking and controlling whether a FIPS compliant crypto provider is currently in use. Setting to true requires a FIPS build of Node.js.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_fips
	**/
	@:deprecated
	static var fips:Bool;

	/**
		Creates and returns a cipher object, with the given `algorithm` and `password`.

        @see https://nodejs.org/api/crypto.html#crypto_crypto_createcipher_algorithm_password_options
	**/
	@:deprecated
	static function createCipher(algorithm:String, password:EitherType<String, Buffer>, ?options: Transform<Cipher>):Cipher;

	/**
		Creates and returns a `Cipher` object, with the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createcipheriv_algorithm_key_iv_options
	**/
	static function createCipheriv(algorithm:String, key:EitherType<String, Buffer>, iv:EitherType<String, Buffer>, ?options: Transform<Cipher>):Cipher;

	/**
		Creates and returns a `Decipher` object that uses the given `algorithm` and `password` (key).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createdecipher_algorithm_password_options
	**/
	@:deprecated
	static function createDecipher(algorithm:String, password:EitherType<String, Buffer>):Decipher;

	/**
		Creates and returns a `Decipher` object that uses the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createdecipheriv_algorithm_key_iv_options
	**/
	static function createDecipheriv(algorithm:String, key:EitherType<String, Buffer>, iv:EitherType<String, Buffer>):Decipher;

	/**
		Load and set engine for some/all OpenSSL functions (selected by `flags`).

		`engine` could be either an id or a path to the to the engine's shared library.

		`flags` is optional and has `Constants.ENGINE_METHOD_ALL` value by default.
		It could take one of or mix of flags prefixed with `ENGINE_METHOD_` defined in `Constants` module.
	**/
	static function setEngine(engine:String, ?flags:Int):Void;

	/**
		Returns an array with the names of the supported ciphers.
	**/
	static function getCiphers():Array<String>;

	/**
		Returns an array with the names of the supported hash algorithms.
	**/
	static function getHashes():Array<String>;

	/**
		Returns an array with the names of the supported elliptic curves.
	**/
	static function getCurves():Array<String>;

	/**
		Creates a credentials object
	**/
	@:deprecated("Use js.node.Tls.createSecureContext instead.")
	static function createCredentials(?details:SecureContextOptions):SecureContext;

	/**
		Creates and returns a hash object, a cryptographic hash with the given algorithm which can be used to generate hash digests.
		`algorithm` is dependent on the available algorithms supported by the version of OpenSSL on the platform.
		Examples are 'sha1', 'md5', 'sha256', 'sha512', etc.
		On recent releases, openssl list-message-digest-algorithms will display the available digest algorithms.
	**/
	static function createHash(algorithm:CryptoAlgorithm):Hash;

	/**
		Creates and returns a hmac object, a cryptographic hmac with the given algorithm and key.
		`algorithm` is dependent on the available algorithms supported by OpenSSL - see `createHash` above.
		`key` is the hmac key to be used.
	**/
	static function createHmac(algorithm:CryptoAlgorithm, key:EitherType<String, Buffer>):Hmac;

	/**
		Creates and returns a signing object, with the given algorithm.
		On recent OpenSSL releases, openssl list-public-key-algorithms will display the available signing algorithms.
		Example: 'RSA-SHA256'.
	**/
	static function createSign(algorithm:String):Sign;

	/**
		Creates and returns a verification object, with the given algorithm.
		This is the mirror of the signing object above.
	**/
	static function createVerify(algorithm:String):Verify;

	/**
		Creates a Diffie-Hellman key exchange object using the supplied `prime` or generated prime of given bit `prime_length`.
		The generator used is 2. `encoding` can be 'binary', 'hex', or 'base64'.

		Creates a Diffie-Hellman key exchange object and generates a prime of the given bit length. The generator used is 2.
	**/
	static function createDiffieHellman(prime:EitherType<String, Buffer>, ?prime_encoding:String, ?generator:EitherType<Int, EitherType<String, Buffer>>, ?generator_encoding:String):DiffieHellman;

	/**
		Creates a predefined Diffie-Hellman key exchange object.
		The supported groups are: 'modp1', 'modp2', 'modp5' (defined in RFC 2412) and 'modp14', 'modp15', 'modp16', 'modp17', 'modp18' (defined in RFC 3526).
		The returned object mimics the interface of objects created by `createDiffieHellman` above,
		but will not allow to change the keys (with setPublicKey() for example).
		The advantage of using this routine is that the parties don't have to generate nor exchange group modulus beforehand,
		saving both processor and communication time.
	**/
	static function getDiffieHellman(group_name:DiffieHellmanGroupName):IDiffieHellman;

	/**
		Creates an Elliptic Curve (EC) Diffie-Hellman key exchange object using a predefined curve
		specified by the `curve_name` string. Use `getCurves` to obtain a list of available curve names.
		On recent releases, openssl ecparam -list_curves will also display the name
		and description of each available elliptic curve.
	**/
	static function createECDH(curve_name:String):ECDH;

	/**
		Asynchronous PBKDF2 applies pseudorandom function HMAC-SHA1 to derive a key of given length
		from the given password, salt and iterations.
	**/
	@:overload(function(password:EitherType<String, Buffer>, salt:EitherType<String, Buffer>, iterations:Int, keylen:Int, digest:String,
		callback:Error->Buffer->Void):Void {})
	static function pbkdf2(password:EitherType<String, Buffer>, salt:EitherType<String, Buffer>, iterations:Int, keylen:Int,
		callback:Error->Buffer->Void):Void;

	/**
		Synchronous PBKDF2 function. Returns derivedKey or throws error.
	**/
	static function pbkdf2Sync(password:EitherType<String, Buffer>, salt:EitherType<String, Buffer>, iterations:Int, keylen:Int, ?digest:String):Buffer;

	/**
		Generates cryptographically strong pseudo-random data.

		If `callback` is specified, the function runs asynchronously, otherwise it will block and synchronously
		return random bytes.

		NOTE: Will throw error or invoke callback with error, if there is not enough accumulated entropy
		to generate cryptographically strong data. In other words, `randomBytes` without callback will not
		block even if all entropy sources are drained.
	**/
	@:overload(function(size:Int, callback:Error->Buffer->Void):Void {})
	static function randomBytes(size:Int):Buffer;

	/**
		Decrypts `buffer` with `private_key`.

		`private_key` can be an object or a string.
		If `private_key` is a string, it is treated as the key with no passphrase
		and will use `RSA_PKCS1_OAEP_PADDING`.
	**/
	@:overload(function(private_key:CryptoKeyOptions, buffer:Buffer):Buffer {})
	static function privateDecrypt(private_key:String, buffer:Buffer):Buffer;

	/**
		Encrypts `buffer` with `private_key`.

		`private_key` can be an object or a string.
		If `private_key` is a string, it is treated as the key with no passphrase
		and will use `RSA_PKCS1_PADDING`.
	**/
	@:overload(function(private_key:CryptoKeyOptions, buffer:Buffer):Buffer {})
	static function privateEncrypt(private_key:String, buffer:Buffer):Buffer;

	/**
		Decrypts `buffer` with `public_key`.

		`public_key` can be an object or a string.
		If `public_key` is a string, it is treated as the key with no passphrase
		and will use `RSA_PKCS1_PADDING`.

		Because RSA public keys can be derived from private keys,
		a private key may be passed instead of a public key.
	**/
	@:overload(function(public_key:CryptoKeyOptions, buffer:Buffer):Buffer {})
	static function publicDecrypt(public_key:String, buffer:Buffer):Buffer;

	/**
		Encrypts `buffer` with `public_key`.

		`public_key` can be an object or a string.
		If `public_key` is a string, it is treated as the key with no passphrase
		and will use `RSA_PKCS1_OAEP_PADDING`.

		Because RSA public keys can be derived from private keys,
		a private key may be passed instead of a public key.
	**/
	@:overload(function(public_key:CryptoKeyOptions, buffer:Buffer):Buffer {})
	static function publicEncrypt(public_key:String, buffer:Buffer):Buffer;
}

/**
	An options type for `privateEncrypt`, `privateDecrypt`, `publicEncrypt`, `publicDecrypt` methods of `Crypto`.
**/
typedef CryptoKeyOptions = {
	/**
		PEM encoded public key
	**/
	var key:String;

	/**
		Passphrase for the private key
	**/
	@:optional var passphrase:String;

	/**
		Padding value, one of the following:
		* `Constants.RSA_NO_PADDING`
		* `Constants.RSA_PKCS1_PADDING`
		* `Constants.RSA_PKCS1_OAEP_PADDING`
	**/
	@:optional var padding:Int;
}
