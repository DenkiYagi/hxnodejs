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
import haxe.ds.Option;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.Buffer;
import js.lib.ArrayBufferView;
import js.node.crypto.*;
import js.node.crypto.DiffieHellman.IDiffieHellman;
import js.node.tls.SecureContext;
import js.node.stream.Transform;
import js.node.stream.Writable;

/**
	Enumerations of crypto algorighms to be used.
**/
@:enum abstract CryptoAlgorithm(String) from String to String {
	var SHA1 = "sha1";
	var MD5 = "md5";
	var SHA256 = "sha256";
	var SHA512 = "sha512";
	var SHAKE256 = "shake256";
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

	@see https://nodejs.org/api/crypto.html#crypto_crypto
**/
@:jsRequire("crypto")
extern class Crypto {
	/**
		The default encoding to use for functions that can take either strings or buffers.
		The default value is 'buffer', which makes methods default to Buffer objects.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_default_encoding
	**/
	@:deprecated
	static var DEFAULT_ENCODING:String;

	/**
		Property for checking and controlling whether a FIPS compliant crypto provider is
		currently in use. Setting to true requires a FIPS build of Node.js.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_fips
	**/
	@:deprecated
	static var fips:Bool;

	/**
		Creates and returns a cipher object, with the given `algorithm` and `password`.

        @see https://nodejs.org/api/crypto.html#crypto_crypto_createcipher_algorithm_password_options
	**/
	@:deprecated
	@:overload(function(algorithm:CryptoAlgorithm, password:String, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, password:ArrayBufferView, ?options:Transform<Cipher>):Cipher {})
	static function createCipher(algorithm:CryptoAlgorithm, password:Buffer, ?options: Transform<Cipher>):Cipher;

	/**
		Creates and returns a `Cipher` object, with the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createcipheriv_algorithm_key_iv_options
	**/
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:String, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:Buffer, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:ArrayBufferView, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:String, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:Buffer, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:ArrayBufferView, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:String, ?options:Transform<Cipher>):Cipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:Buffer, ?options:Transform<Cipher>):Cipher {})
	static function createCipheriv(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:ArrayBufferView, ?options:Transform<Cipher>):Cipher;

	/**
		Creates and returns a `Decipher` object that uses the given `algorithm` and `password` (key).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createdecipher_algorithm_password_options
	**/
	@:deprecated
	@:overload(function(algorithm:CryptoAlgorithm, password:String):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, password:Buffer):Decipher {})
	static function createDecipher(algorithm:CryptoAlgorithm, password:ArrayBufferView):Decipher;

	/**
		Creates and returns a `Decipher` object that uses the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createdecipheriv_algorithm_key_iv_options
	**/
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:Null<String>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:Null<Buffer>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:String, iv:Null<ArrayBufferView>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:Null<String>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:Null<Buffer>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, iv:Null<ArrayBufferView>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:Null<String>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:Null<Buffer>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, iv:Null<ArrayBufferView>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:KeyObject, iv:Null<String>):Decipher {})
	@:overload(function(algorithm:CryptoAlgorithm, key:KeyObject, iv:Null<Buffer>):Decipher {})
	static function createDecipheriv(algorithm:CryptoAlgorithm, key:KeyObject, iv:Null<ArrayBufferView>):Decipher;

	/**
		If `prim` is provoded as string or a `Buffer`, creates a `DiffieHellman` key exchange object
		using the supplied `prime` and an optional specific `generator`,
		Otherwise creates a `DiffieHellman` key exchange object and generates a prime of given `prime_length` bits
		using an optional specific numeric `generator`

		@see https://nodejs.org/api/crypto.html#crypto_crypto_creatediffiehellman_prime_primeencoding_generator_generatorencoding
		@see https://nodejs.org/api/crypto.html#crypto_crypto_creatediffiehellman_primelength_generator
	**/
	@:overload(function(prime_length:Int, ?generator:Int):DiffieHellman {})
	@:overload(function(prime_length:Int, ?generator:String):DiffieHellman {})
	@:overload(function(prime_length:Int, ?generator:Buffer):DiffieHellman {})
	@:overload(function(prime_length:Int, ?generator:ArrayBufferView):DiffieHellman {})
	@:overload(function(prime:String, ?prime_encoding:String, ?generator:Int, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:String, ?prime_encoding:String, ?generator:String, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:String, ?prime_encoding:String, ?generator:Buffer, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:String, ?prime_encoding:String, ?generator:ArrayBufferView, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:Buffer, ?prime_encoding:String, ?generator:Int, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:Buffer, ?prime_encoding:String, ?generator:String, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:Buffer, ?prime_encoding:String, ?generator:Buffer, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:Buffer, ?prime_encoding:String, ?generator:ArrayBufferView, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:ArrayBufferView, ?prime_encoding:String, ?generator:Int, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:ArrayBufferView, ?prime_encoding:String, ?generator:String, ?generator_encoding:String):DiffieHellman {})
	@:overload(function(prime:ArrayBufferView, ?prime_encoding:String, ?generator:Buffer, ?generator_encoding:String):DiffieHellman {})
	static function createDiffieHellman(prime:ArrayBufferView, ?prime_encoding:String, ?generator:ArrayBufferView, ?generator_encoding:String):DiffieHellman;

	/**
		An alias for `Crypto.getDiffieHellman()`

		@see https://nodejs.org/api/crypto.html#crypto_crypto_creatediffiehellmangroup_name
	**/
	static function createDiffieHellmanGroup(name:String):DiffieHellmanGroup;

	/**
		Creates an Elliptic Curve Diffie-Hellman (`ECDH`) key exchange object using a predefined curve specified by the `curve_name` string.
		Use `Crypto.getCurves()` to obtain a list of available curve names.
		On recent OpenSSL releases, `openssl ecparam -list_curves` will also display the name and description of each available elliptic curve.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createecdh_curvename
	**/
	static function createECDH(curve_name:String):ECDH;

	/**
		Creates and returns a `Hash` object that can be used to generate hash digests using the given `algorithm`.
		Optional `options` argument controls stream behavior.
		For XOF hash functions such as `'shake256'`, the `output_length` option can be used to specify the desired output length in bytes.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createhash_algorithm_options
	**/
	static function createHash(algorithm:CryptoAlgorithm, ?options: Transform<Hash>):Hash;

	/**
		Creates and returns an `Hmac` object that uses the given `algorithm` and `key`.
		Optional `options` argument controls stream behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createhmac_algorithm_key_options
	**/
	@:overload(function(algorithm:CryptoAlgorithm, key:String, ?options:Transform<Hmac>):DiffieHellman {})
	@:overload(function(algorithm:CryptoAlgorithm, key:Buffer, ?options:Transform<Hmac>):DiffieHellman {})
	@:overload(function(algorithm:CryptoAlgorithm, key:ArrayBufferView, ?options:Transform<Hmac>):DiffieHellman {})
	static function createHmac(algorithm:CryptoAlgorithm, key:KeyObject, ?options: Transform<Hmac>):Hmac;

	/**
		Creates and returns a new key object containing a private key.
		If `key` is a string or `Buffer`, `format` is assumed to be `'pem'`;
		otherwise, `key` must be an object with the properties described above.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createprivatekey_key
	**/
	static function createPrivateKey(key: PrivateKeyOptions):KeyObject;

	/**
		Creates and returns a new key object containing a public key.
		If `key` is a string or `Buffer`, `format` is assumed to be `'pem'`;
		if `key` is a `KeyObject` with type `'private'`, the public key is derived from the given private key;
		otherwise, `key` must be an object with the properties described above.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createpublickey_key
	**/
    static function createPublicKey(key: PublicKeyOptions):KeyObject;

	/**
		Creates and returns a new key object containing a secret key for symmetric encryption or `Hmac`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createprivatekey_key
	**/
	static function createSecretKey(key: Buffer):KeyObject;

	/**
		Creates and returns a `Sign` object that uses the given `algorithm`.
		Use `Crypto.getHashes()` to obtain the names of the available digest algorithms.
		Optional `options` argument controls the `stream.Writable` behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createsign_algorithm_options
	**/
	static function createSign(algorithm:CryptoAlgorithm, ?options: Writable<Dynamic>):Sign;

	/**
		Creates and returns a `Verify` object that uses the given `algorithm`.
		Use `Crypto.getHashes()` to obtain an array of names of the available signing algorithms.
		Optional `options` argument controls the `stream.Writable` behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createverify_algorithm_options
	**/
	static function createVerify(algorithm:CryptoAlgorithm, ?options: Writable<Dynamic>):Verify;

	/**
		Generates a new asymmetric key pair of the given `type`.
		RSA, DSA, EC, Ed25519 and Ed448 are currently supported.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_generatekeypair_type_options_callback
	**/
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->String->String->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->String->Buffer->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->String->KeyObject->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->Buffer->String->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->Buffer->Buffer->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->Buffer->KeyObject->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->KeyObject->String->Void):Void {})
	@:overload(function(type:String, options:GenerateKeyPairOptions, callback:Error->KeyObject->Buffer->Void):Void {})
	static function generateKeyPair(type:String, options:GenerateKeyPairOptions, callback:Error->KeyObject->KeyObject->Void):Void;

	/**
		Generates a new asymmetric key pair of the given `type`.
		RSA, DSA, EC, Ed25519 and Ed448 are currently supported.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_generatekeypairsync_type_options
	**/
	static function generateKeyPairSync(type:String, options: GenerateKeyPairOptions):Void;

	/**
		Returns an array with the names of the supported cipher algorithms.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_getciphers
	**/
	static function getCiphers():Array<String>;

	/**
		Returns an array with the names of the supported elliptic curves.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_getcurves
	**/
	static function getCurves():Array<String>;

	/**
		Creates a predefined DiffieHellman key exchange object.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_getdiffiehellman_groupname
	**/
	static function getDiffieHellman(group_name:DiffieHellmanGroupName):DiffieHellmanGroup;

	/**
		Returns `true` if and only if a FIPS compliant crypto provider is currently in use.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_getfips
	**/
	static function getFips():Bool;

	/**
		Returns an array of the names of the supported hash algorithms, such as 'RSA-SHA256'.
		Hash algorithms are also called "digest" algorithms.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_gethashes
	**/
	static function getHashes():Array<String>;

	/**
		Provides an asynchronous Password-Based Key Derivation Function 2 (PBKDF2) implementation.
		A selected HMAC digest algorithm specified by digest is applied to derive a key of the requested byte length (`keylen`) from the `password`, `salt` and `iterations`.
	**/
	@:overload(function(pasword: String, salt: String, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: String, salt: Buffer, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: String, salt: ArrayBufferView, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: Buffer, salt: String, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: Buffer, salt: Buffer, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: Buffer, salt: ArrayBufferView, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: ArrayBufferView, salt: String, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	@:overload(function(pasword: ArrayBufferView, salt: Buffer, iterations: Int, keylen: Int, digests: String, callback: Error->Buffer->Void): Buffer {})
	static function pbkdf2(password: ArrayBufferView, salt: ArrayBufferView, iterations: Int, keylen: Int, digest: String, callback: Error->Buffer->Void):Buffer;

	/**
		Provides an asynchronous Password-Based Key Derivation Function 2 (PBKDF2) implementation.
		A selected HMAC digest algorithm specified by `digest` is applied to derive a key of the requested byte length (`keylen`)
		from the `password`, `salt` and `iterations`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_pbkdf2_password_salt_iterations_keylen_digest_callback
	**/
	@:overload(function(pasword:String, salt: String, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:String, salt: Buffer, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:String, salt: ArrayBufferView, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:Buffer, salt: String, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:Buffer, salt: Buffer, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:Buffer, salt: ArrayBufferView, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:ArrayBufferView, salt: String, iterations: Int, keylen: Int, digests: String): Buffer {})
	@:overload(function(pasword:ArrayBufferView, salt: Buffer, iterations: Int, keylen: Int, digests: String): Buffer {})
	static function pbkdf2Sync(password: ArrayBufferView, salt: ArrayBufferView, iterations: Int, keylen: Int, digest: String):Buffer;

	/**
		Decrypts `buffer` with `private_key`.
		`buffer` was previously encrypted using the corresponding public key, for example using `Crypto.publicEncrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_privatedecrypt_privatekey_buffer
	**/
	@:overload(function(private_key:PrivateDecryptPrivateKey, buffer:Buffer): Buffer {})
	@:overload(function(private_key:String, buffer:Buffer): Buffer {})
	@:overload(function(private_key:Buffer, buffer:Buffer): Buffer {})
	@:overload(function(private_key:KeyObject, buffer:Buffer): Buffer {})
	@:overload(function(private_key:PrivateDecryptPrivateKey, buffer:ArrayBufferView): Buffer {})
	@:overload(function(private_key:String, buffer:ArrayBufferView): Buffer {})
	@:overload(function(private_key:Buffer, buffer:ArrayBufferView): Buffer {})
	static function privateDecrypt(private_key:KeyObject, buffer:ArrayBufferView):Buffer;

	/**
		Encrypts `buffer` with `private_key`.
		The returned data can be decrypted using the corresponding public key, for example using `Crypto.publicDecrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_privateencrypt_privatekey_buffer
	**/
	@:overload(function(private_key:PrivateEncryptPrivateKey, buffer:Buffer): Buffer {})
	@:overload(function(private_key:String, buffer:Buffer): Buffer {})
	@:overload(function(private_key:Buffer, buffer:Buffer): Buffer {})
	@:overload(function(private_key:KeyObject, buffer:Buffer): Buffer {})
	@:overload(function(private_key:PrivateEncryptPrivateKey, buffer:ArrayBufferView): Buffer {})
	@:overload(function(private_key:String, buffer:ArrayBufferView): Buffer {})
	@:overload(function(private_key:Buffer, buffer:ArrayBufferView): Buffer {})
	static function privateEncrypt(private_key:KeyObject, buffer:ArrayBufferView):Buffer;

	/**
		Decrypts `buffer` with `key`.
		`buffer` was previously encrypted using the corresponding private key, for example using `Crypto.privateEncrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_publicdecrypt_key_buffer
	**/
	@:overload(function(key:PublicDecryptKey, buffer:Buffer): Buffer {})
	@:overload(function(key:String, buffer:Buffer): Buffer {})
	@:overload(function(key:Buffer, buffer:Buffer): Buffer {})
	@:overload(function(key:KeyObject, buffer:Buffer): Buffer {})
	@:overload(function(key:PublicDecryptKey, buffer:ArrayBufferView): Buffer {})
	@:overload(function(key:String, buffer:ArrayBufferView): Buffer {})
	@:overload(function(key:Buffer, buffer:ArrayBufferView): Buffer {})
	static function publicDecrypt(key:KeyObject, buffer:ArrayBufferView): Buffer;

	/**
		Encrypts the content of `buffer` with `key` and returns a new `Buffer` with encrypted content.
		The returned data can be decrypted using the corresponding private key, for example using `Crypto.privateDecrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_publicencrypt_key_buffer
	**/

	@:overload(function(key: PublicEncryptKey, buffer: Buffer): Buffer {})
	@:overload(function(key: String, buffer: Buffer): Buffer {})
	@:overload(function(key: Buffer, buffer: Buffer): Buffer {})
	@:overload(function(key: KeyObject, buffer: Buffer): Buffer {})
	@:overload(function(key: PublicEncryptKey, buffer: ArrayBufferView): Buffer {})
	@:overload(function(key: String, buffer: ArrayBufferView): Buffer {})
	@:overload(function(key: Buffer, buffer: ArrayBufferView): Buffer {})
	static function publicEncrypt(key: KeyObject, buffer: ArrayBufferView):Buffer;

	/**
		Generates cryptographically strong pseudo-random data.
		The `size` argument is a number indicating the number of bytes to generate.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randombytes_size_callback
	**/
	static function randomBytes(size: Int, callback:Error->Buffer->Void):Buffer;

	/**
		Synchronous version of `Crypto.randomFill()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randomfillsync_buffer_offset_size
	**/
	@:overload(function(buffer: Buffer, ?offset:Int, ?size: Int): Buffer {})
	@:overload(function(buffer: Buffer, ?offset:Int, ?size: Int): ArrayBufferView {})
	@:overload(function(buffer: ArrayBufferView, ?offset:Int, ?size: Int): Buffer {})
	static function randomFillSync(buffer: ArrayBufferView, ?offset: Int, ?size: Int):ArrayBufferView;

	/**
		This function is similar to `Crypto.randomBytes()` but requires the first argument to be a `Buffer` that will be filled.
		It also requires that a callback is passed in.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randomfill_buffer_offset_size_callback
	**/
	@:overload(function(buffer: Buffer, ?offset:Int, ?size: Int, callback: Error->Buffer->Void): Buffer {})
	static function randomFill(buffer: ArrayBufferView, ?offset: Int, ?size: Int, callback: Error->Buffer->Void):Buffer;

	/**
		Provides an asynchronous `scrypt` implementation.
		Scrypt is a password-based key derivation function that is designed to be expensive computationally and memory-wise
		in order to make brute-force attacks unrewarding.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_scrypt_password_salt_keylen_options_callback
	**/
	@:overload(function(passwordr: String, salt: String, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: String, salt: Buffer, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: String, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: Buffer, salt: String, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: Buffer, salt: Buffer, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: Buffer, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: ArrayBufferView, salt: String, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	@:overload(function(passwordr: ArrayBufferView, salt: Buffer, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void {})
	static function scrypt(password: ArrayBufferView, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions, callback: Error->Buffer->Void):Void;

	/**
		Provides a synchronous `scrypt` implementation.
		Scrypt is a password-based key derivation function that is designed to be expensive computationally and memory-wise
		in order to make brute-force attacks unrewarding.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_scryptsync_password_salt_keylen_options
	**/
	@:overload(function(passwordr: String, salt: String, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: String, salt: Buffer, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: String, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: Buffer, salt: String, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: Buffer, salt: Buffer, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: Buffer, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: ArrayBufferView, salt: String, keylen: Int, ?options: ScryptOptions):Void {})
	@:overload(function(passwordr: ArrayBufferView, salt: Buffer, keylen: Int, ?options: ScryptOptions):Void {})
	static function scryptSync(password: ArrayBufferView, salt: ArrayBufferView, keylen: Int, ?options: ScryptOptions):Void;

	/**
		Load and set the engine for some or all OpenSSL functions (selected by flags).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_setengine_engine_flags
	**/
	static function setEngine(engine:String, ?flags:Int):Void;

	/**
		Enables the FIPS compliant crypto provider in a FIPS-enabled Node.js build.
		Throws an error if FIPS mode is not available.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_setfips_bool
	**/
	static function setFips(v: Bool): Void;

	/**
		Calculates and returns the signature for `data` using the given private key and algorithm.
		If `algorithm` is none, then the algorithm is dependent upon the key type (especially Ed25519 and Ed448).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_sign_algorithm_data_key
	**/
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: {padding:Int, saltLength:Int}): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: String): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: KeyObject): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: {padding:Int, saltLength:Int}): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: String): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: Buffer): Buffer {})
	static function sign(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: KeyObject): Buffer;

	/**
		This function is based on a constant-time algorithm.
		Returns true if `a` is equal to `b`, without leaking timing information that would allow an attacker to guess one of the values.
		This is suitable for comparing HMAC digests or secret values like authentication cookies or capability urls.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_timingsafeequal_a_b
	**/
	@:overload(function(a: Buffer, b: Buffer): Bool {})
	@:overload(function(a: Buffer, b: ArrayBufferView): Bool {})
	@:overload(function(a: ArrayBufferView, b: Buffer): Bool {})
	static function timingSafeEqual(a: ArrayBufferView, b: ArrayBufferView): Bool;

	/**
		Verifies the given signature for data using the given key and algorithm.
		If algorithm is null or undefined, then the algorithm is dependent upon the key type (especially Ed25519 and Ed448).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_verify_algorithm_data_key_signature
	**/

	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: {padding:Int, saltLength:Int}, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: {padding:Int, saltLength:Int}, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: String, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: String, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: Buffer, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: Buffer, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: KeyObject, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: Buffer, key: KeyObject, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: {padding:Int, saltLength:Int}, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: {padding:Int, saltLength:Int}, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: String, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: String, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: Buffer, signature: Buffer): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: Buffer, signature: ArrayBufferView): Buffer {})
	@:overload(function(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: KeyObject, signature: Buffer): Buffer {})
	static function verify(algorithm: Null<CryptoAlgorithm>, data: ArrayBufferView, key: KeyObject, signature: ArrayBufferView): Bool;
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

/**
	An options type for `createPrivateKey` methods of `Crypto`.
**/
typedef PrivateKeyOptions = {
	/**
		The key material, either in PEM or DER format.
	**/
	var key:EitherType<String, Buffer>;

	/**
		Must be `pem` or `der`. Default: `pem`.
	**/
	var format:String;

	/**
		Must be 'pkcs1', 'pkcs8' or 'sec1'. This option is required only if the `format` is `'der'` and ignored if it is `'pem'`.
	**/
	var type:String;

	/**
		The passphrase to use for description.
	**/
	@:optional var passphrase:EitherType<String, Buffer>;
}

/**
	An options type for `createPublicKey` methods of `Crypto`.
**/
typedef PublicKeyOptions = {
	/**
		The key material, either in PEM or DER format.
	**/
	var key:EitherType<String, Buffer>;

	/**
		Must be `pem` or `der`. Default: `pem`.
	**/
	var format:String;

	/**
		Must be 'pkcs1', 'pkcs8' or 'sec1'. This option is required only if the `format` is `'der'` and ignored if it is `'pem'`.
	**/
	var type:String;
}

/**
	An options type for `generateKeyPair` methods of `Crypto`.
**/
typedef GenerateKeyPairOptions = {
	/**
		Key size in bits (RSA, DSA).
	**/
	var moduleLength:Int;

	/**
		Public exponent (RSA). Default: `0x10001`
	**/
	var publicExponent:String;

	/**
		Size of `q` in bits (DSA).
	**/
	var divisorLength:Int;

	/**
		Name of the curve to use (EC).
	**/
	var namedCurve:String;

	/**
		see `KeyObject.export()`
	**/
	var publicLeyEncoding:Dynamic;

	/**
		see `KeyObject.export()`
	**/
	var privateKeyEncoding:Dynamic;
}

/**
	An private key type for `privateDecrypt` methods of `Crypto`.
**/
typedef PrivateDecryptPrivateKey = {
	/**
		The hash function to use for OAEP padding. Default: 'sha1'
	**/
	var oaeHash: String;

	/**
		An optional padding value defined in `Crypto.Constants`,
		which may be: `Crypto.Constants.RSA_NO_PADDING`, `Crypto.Constants.RSA_PKCS1_PADDING`, or `Crypto.Constants.RSA_PKCS1_OAEP_PADDING`.
	**/
	var padding: Int;
}

/**
	An private key type for `privateEncrypt` methods of `Crypto`.
**/
typedef PrivateEncryptPrivateKey = {
	/**
		A PEM encoded private key.
	**/
	var key:EitherType<String, EitherType<Buffer, KeyObject>>;

	/**
		An optional passphrase for the private key
	**/
	var passphrase: EitherType<String, Buffer>;

	/**
		An optional padding value defined in `Crypto.Constants`,
		which may be: `Crypto.Constants.RSA_NO_PADDING` or `Crypto.Constants.RSA_PKCS1_PADDING`.
	**/
	var padding: Int;
}

/**
	An key type for `publicDecrypt` methods of `Crypto`.
**/
typedef PublicDecryptKey = {
	/**
		An optional passphrase for the private key
	**/
	var passphrase: EitherType<String, Buffer>;

	/**
		An optional padding value defined in `Crypto.Constants`,
		which may be: `Crypto.Constants.RSA_NO_PADDING` or `Crypto.Constants.RSA_PKCS1_PADDING`.
	**/
	var padding: Int;
}
/**
	An key type for `publicEncrypt` methods of `Crypto`.
**/
typedef PublicEncryptKey = {
	/**
		A PEM encoded public or private key.
	**/
	var key:EitherType<String, EitherType<Buffer, KeyObject>>;

	/**
		The hash function to use for OAEP padding. Default: 'sha1'
	**/
	var oaeHash: String;

	/**
		An optional passphrase for the private key
	**/
	var passphrase: EitherType<String, Buffer>;

	/**
		An optional padding value defined in `Crypto.Constants`,
		which may be: `Crypto.Constants.RSA_NO_PADDING`, `Crypto.Constants.RSA_PKCS1_PADDING`, or `Crypto.Constants.RSA_PKCS1_OAEP_PADDING`.
	**/
	var padding: Int;
}

/**
	An options type for `scrypt` and `scryptSync` methods of `Crypto`.
**/
typedef ScryptOptions = {
	/**
		CPU/memory cost parameter. Must be a power of two greater than one. Default: `16384`
	**/
	@:optional var cost:Int;

	/**
		Block size parameter. Default: `8`.
	**/
	@:optional var blockSize: Int;

	/**
		Parallelization parameter. Default: `1`.
	**/
	@:optional var parallelization: Int;

	/**
		Alias for `cost`. Only one of both may be specified.
	**/
	@:optional var N: Int;

	/**
		Alias for `blockSize`. Only one of both may be specified.
	**/
	@:optional var r: Int;

	/**
		Alias for `parallelization`. Only one of both may be specified.
	**/
	@:optional var p: Int;

	/**
		Memory upper bound. It is an error when (approximately) `128 * N * r > maxmem`. Default: `32 * 1024 * 1024`.
	**/
	var maxmem: Int;
}

