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
import js.lib.ArrayBufferView;
import js.node.crypto.*;
import js.node.stream.Transform;
import js.node.stream.Writable;

/**
	The crypto module provides cryptographic functionality that includes
	a set of wrappers for OpenSSL's hash, HMAC, cipher, decipher, sign, and verify functions.

	@see https://nodejs.org/api/crypto.html#crypto_crypto
**/
@:jsRequire("crypto")
extern class Crypto {
	@:deprecated
	static var DEFAULT_ENCODING:String;

	@:deprecated
	static var fips:Bool;

	@:deprecated
	static function createCipher(algorithm:String, password:EitherType<String, Buffer>):Cipher;

	/**
		Creates and returns a `Cipher` object, with the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createcipheriv_algorithm_key_iv_options
	**/
	static function createCipheriv(algorithm:String, key:CryptoKey, iv:Null<BinaryLike>, ?options:CipherOptions):Cipher;

	@:deprecated
	static function createDecipher(algorithm:String, password:EitherType<String, Buffer>):Decipher;

	/**
		Creates and returns a `Decipher` object that uses the given `algorithm`, `key` and initialization vector (`iv`).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createdecipheriv_algorithm_key_iv_options
	**/
	static function createDecipheriv(algorithm:String, key:CryptoKey, iv:Null<BinaryLike>, ?options:CipherOptions):Decipher;

	/**
		If `prim` is provoded as string or a `Buffer`, creates a `DiffieHellman` key exchange object
		using the supplied `prime` and an optional specific `generator`,
		Otherwise creates a `DiffieHellman` key exchange object and generates a prime of given `prime_length` bits
		using an optional specific numeric `generator`

		@see https://nodejs.org/api/crypto.html#crypto_crypto_creatediffiehellman_prime_primeencoding_generator_generatorencoding
		@see https://nodejs.org/api/crypto.html#crypto_crypto_creatediffiehellman_primelength_generator
	**/
	@:overload(function(primeLength:Int, ?generator:Int):DiffieHellman {})
	static function createDiffieHellman(prime:BinaryLike, ?primeEncoding:String, ?generator:EitherType<Int, BinaryLike>,
		?generatorEncoding:String):DiffieHellman;

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
	static function createECDH(curveName:String):ECDH;

	/**
		Creates and returns a `Hash` object that can be used to generate hash digests using the given `algorithm`.
		Optional `options` argument controls stream behavior.
		For XOF hash functions such as `'shake256'`, the `output_length` option can be used to specify the desired output length in bytes.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createhash_algorithm_options
	**/
	static function createHash(algorithm:String, ?options:HashOptions):Hash;

	/**
		Creates and returns an `Hmac` object that uses the given `algorithm` and `key`.
		Optional `options` argument controls stream behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createhmac_algorithm_key_options
	**/
	static function createHmac(algorithm:String, key:CryptoKey, ?options:TransformNewOptions):Hmac;

	/**
		Creates and returns a new key object containing a private key.
		If `key` is a string or `Buffer`, `format` is assumed to be `'pem'`;
		otherwise, `key` must be an object with the properties described above.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createprivatekey_key
	**/
	@:overload(function(key:EitherType<String, Buffer>):KeyObject {})
	static function createPrivateKey(key:PrivateKeyOptions):KeyObject;

	/**
		Creates and returns a new key object containing a public key.
		If `key` is a string or `Buffer`, `format` is assumed to be `'pem'`;
		if `key` is a `KeyObject` with type `'private'`, the public key is derived from the given private key;
		otherwise, `key` must be an object with the properties described above.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createpublickey_key
	**/
	@:overload(function(key:EitherType<String, Buffer>):KeyObject {})
	static function createPublicKey(key:PublicKeyOptions):KeyObject;

	/**
		Creates and returns a new key object containing a secret key for symmetric encryption or `Hmac`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createprivatekey_key
	**/
	static function createSecretKey(key:Buffer):KeyObject;

	/**
		Creates and returns a `Sign` object that uses the given `algorithm`.
		Use `Crypto.getHashes()` to obtain the names of the available digest algorithms.
		Optional `options` argument controls the `stream.Writable` behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createsign_algorithm_options
	**/
	static function createSign(algorithm:String, ?options:WritableNewOptions):Sign;

	/**
		Creates and returns a `Verify` object that uses the given `algorithm`.
		Use `Crypto.getHashes()` to obtain an array of names of the available signing algorithms.
		Optional `options` argument controls the `stream.Writable` behavior.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_createverify_algorithm_options
	**/
	static function createVerify(algorithm:String, ?options:WritableNewOptions):Verify;

	/**
		Generates a new asymmetric key pair of the given `type`.
		RSA, DSA, EC, Ed25519 and Ed448 are currently supported.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_generatekeypair_type_options_callback
	**/
	#if haxe4
	@:overload(function(type:GenerateKeyPairType, options:GenerateKeyPairOptions,
		callback:(error:Null<Error>, publicKey:EitherType<String, Buffer>, privateKey:EitherType<String, Buffer>) -> Void):Void {})
	static function generateKeyPair(type:GenerateKeyPairType, options:GenerateKeyPairKeyObjectOptions,
		callback:(error:Null<Error>, privateKey:KeyObject, publicKey:KeyObject) -> Void):Void;
	#else
	@:overload(function(type:GenerateKeyPairType, options:GenerateKeyPairOptions,
		callback:Null<Error>->EitherType<String, Buffer>->EitherType<String, Buffer>->Void):Void {})
	static function generateKeyPair(type:GenerateKeyPairType, options:GenerateKeyPairKeyObjectOptions, callback:Null<Error>->KeyObject->KeyObject->Void):Void;
	#end

	/**
		Generates a new asymmetric key pair of the given `type`.
		RSA, DSA, EC, Ed25519 and Ed448 are currently supported.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_generatekeypairsync_type_options
	**/
	@:overload(function(type:GenerateKeyPairSyncType, options:GenerateKeyPairOptions):GenerateKeyPairSyncResult<EitherType<String, Buffer>> {})
	static function generateKeyPairSync(type:GenerateKeyPairSyncType, options:GenerateKeyPairKeyObjectOptions):GenerateKeyPairSyncResult<KeyObject>;

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
	static function getDiffieHellman(groupName:DiffieHellmanGroupName):DiffieHellmanGroup;

	/**
		Returns `true` if and only if a FIPS compliant crypto provider is currently in use.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_getfips
	**/
	static function getFips():Bool;

	/**
		Returns an array of the names of the supported hash algorithms, such as 'RSA-SHA256'.
		Hash algorithms are also called 'digest' algorithms.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_gethashes
	**/
	static function getHashes():Array<String>;

	/**
		Provides an asynchronous Password-Based Key Derivation Function 2 (PBKDF2) implementation.
		A selected HMAC digest algorithm specified by digest is applied to derive a key of the requested byte length (`keylen`) from the `password`, `salt` and `iterations`.
	**/
	#if haxe4
	static function pbkdf2(password:BinaryLike, salt:BinaryLike, iterations:Int, keylen:Int, digest:String,
		callback:(error:Null<Error>, derivedKey:Buffer) -> Void):Void;
	#else
	static function pbkdf2(password:BinaryLike, salt:BinaryLike, iterations:Int, keylen:Int, digest:String, callback:Null<Error>->Buffer->Void):Void;
	#end

	/**
		Provides an asynchronous Password-Based Key Derivation Function 2 (PBKDF2) implementation.
		A selected HMAC digest algorithm specified by `digest` is applied to derive a key of the requested byte length (`keylen`)
		from the `password`, `salt` and `iterations`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_pbkdf2_password_salt_iterations_keylen_digest_callback
	**/
	static function pbkdf2Sync(password:BinaryLike, salt:BinaryLike, iterations:Int, keylen:Int, digest:String):Buffer;

	/**
		Decrypts `buffer` with `private_key`.
		`buffer` was previously encrypted using the corresponding public key, for example using `Crypto.publicEncrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_privatedecrypt_privatekey_buffer
	**/
	static function privateDecrypt(privateKey:EitherType<KeyLike, RsaPrivateKey>, buffer:EitherType<Buffer, ArrayBufferView>):Buffer;

	/**
		Encrypts `buffer` with `private_key`.
		The returned data can be decrypted using the corresponding public key, for example using `Crypto.publicDecrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_privateencrypt_privatekey_buffer
	**/
	static function privateEncrypt(privateKey:EitherType<KeyLike, RsaPrivateKey>, buffer:EitherType<Buffer, ArrayBufferView>):Buffer;

	/**
		Decrypts `buffer` with `key`.
		`buffer` was previously encrypted using the corresponding private key, for example using `Crypto.privateEncrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_publicdecrypt_key_buffer
	**/
	static function publicDecrypt(key:EitherType<KeyLike, EitherType<RsaPrivateKey, RsaPublicKey>>, buffer:EitherType<Buffer, ArrayBufferView>):Buffer;

	/**
		Encrypts the content of `buffer` with `key` and returns a new `Buffer` with encrypted content.
		The returned data can be decrypted using the corresponding private key, for example using `Crypto.privateDecrypt()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_publicencrypt_key_buffer
	**/
	static function publicEncrypt(key:EitherType<KeyLike, EitherType<RsaPrivateKey, RsaPublicKey>>, buffer:EitherType<Buffer, ArrayBufferView>):Buffer;

	/**
		Generates cryptographically strong pseudo-random data.
		The `size` argument is a number indicating the number of bytes to generate.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randombytes_size_callback
	**/
	@:overload(function(size:Int):Buffer {})
	#if haxe4
	static function randomBytes(size:Int, callback:(err:Null<Error>, buf:Buffer) -> Void):Void;
	#else
	static function randomBytes(size:Int, callback:Null<Error>->Buffer->Void):Void;
	#end

	/**
		Synchronous version of `Crypto.randomFill()`.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randomfillsync_buffer_offset_size
	**/
	static function randomFillSync<T:EitherType<Buffer, ArrayBufferView>>(buffer:T, ?offset:Int, ?size:Int):T;

	/**
		This function is similar to `Crypto.randomBytes()` but requires the first argument to be a `Buffer` that will be filled.
		It also requires that a callback is passed in.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_randomfill_buffer_offset_size_callback
	**/
	#if haxe4
	static function randomFill<T:EitherType<Buffer, ArrayBufferView>>(buffer:T, ?offset:Int, ?size:Int, callback:(err:Null<Error>, buf:T) -> Void):Void;
	#else
	static function randomFill<T:EitherType<Buffer, ArrayBufferView>>(buffer:T, ?offset:Int, ?size:Int, callback:Null<Error>->T->Void):Void;
	#end

	/**
		Provides an asynchronous `scrypt` implementation.
		Scrypt is a password-based key derivation function that is designed to be expensive computationally and memory-wise
		in order to make brute-force attacks unrewarding.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_scrypt_password_salt_keylen_options_callback
	**/
	#if haxe4
	static function scrypt(password:BinaryLike, salt:BinaryLike, keylen:Int, ?options:ScryptOptions,
		callback:(err:Null<Error>, derivedKey:Buffer) -> Void):Void;
	#else
	static function scrypt(password:BinaryLike, salt:BinaryLike, keylen:Int, ?options:ScryptOptions, callback:Null<Error>->Buffer->Void):Void;
	#end

	/**
		Provides a synchronous `scrypt` implementation.
		Scrypt is a password-based key derivation function that is designed to be expensive computationally and memory-wise
		in order to make brute-force attacks unrewarding.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_scryptsync_password_salt_keylen_options
	**/
	static function scryptSync(password:BinaryLike, salt:BinaryLike, keylen:Int, ?options:ScryptOptions):Buffer;

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
	static function setFips(bool:Bool):Void;

	/**
		Calculates and returns the signature for `data` using the given private key and algorithm.
		If `algorithm` is none, then the algorithm is dependent upon the key type (especially Ed25519 and Ed448).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_sign_algorithm_data_key
	**/
	static function sign(algorithm:Null<String>, data:EitherType<Buffer, ArrayBufferView>, key:EitherType<KeyLike, SigningOptions>):Buffer;

	/**
		This function is based on a constant-time algorithm.
		Returns true if `a` is equal to `b`, without leaking timing information that would allow an attacker to guess one of the values.
		This is suitable for comparing HMAC digests or secret values like authentication cookies or capability urls.

		@see https://nodejs.org/api/crypto.html#crypto_crypto_timingsafeequal_a_b
	**/
	@:overload(function(a:Buffer, b:Buffer):Bool {})
	static function timingSafeEqual(a:ArrayBufferView, b:ArrayBufferView):Bool;

	/**
		Verifies the given signature for data using the given key and algorithm.
		If algorithm is null or undefined, then the algorithm is dependent upon the key type (especially Ed25519 and Ed448).

		@see https://nodejs.org/api/crypto.html#crypto_crypto_verify_algorithm_data_key_signature
	**/
	static function verify(algorithm:Null<String>, data:EitherType<Buffer, ArrayBufferView>, key:EitherType<KeyLike, SigningOptions>,
		signature:EitherType<Buffer, ArrayBufferView>):Bool;
}

typedef BufferLike = EitherType<Buffer, ArrayBufferView>;
typedef BinaryLike = EitherType<String, BufferLike>;
typedef KeyLike = EitherType<String, EitherType<Buffer, KeyObject>>;
typedef CryptoKey = EitherType<String, EitherType<Buffer, EitherType<ArrayBufferView, KeyObject>>>;

typedef SetAADOptions = {
	> TransformNewOptions,
	@:optional var plaintextLength:Int;
}

typedef CipherOptions = {
	> TransformNewOptions,
	@:optional var authTagLength:Int;
}

typedef HashOptions = {
	> TransformNewOptions,
	@:optional var outputLength:Int;
}

@:enum abstract KeyFormat(String) {
	var PEM = "pem";
	var DER = "der";
}

@:enum abstract PrivateKeyType(String) {
	var PKCS1 = "pkcs1";
	var PKCS8 = "pkcs8";
	var SEC1 = "sec1";
}

@:enum abstract PublicKeyType(String) {
	var PKCS1 = "pkcs1";
	var SPKI = "spki";
}

@:enum abstract KeyPairType(String) {
	var RSA = "rsa";
	var DSA = "dsa";
	var EC = "ec";
	var ED25519 = "ed25519";
	var ED448 = "ed448";
	var X25519 = "x25519";
	var X448 = "x448";
}

typedef PublicKeyEncodingOptions = {
	var type:PublicKeyType;
	var format:KeyFormat;
}

typedef PrivateKeyEncodingOptions = {
	var type:PrivateKeyType;
	var format:KeyFormat;
	@:optional var cipher:String;
	@:optional var passphrase:EitherType<String, Buffer>;
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
	@:optional var format:KeyFormat;

	/**
		Must be `pkcs1`, `pkcs8` or `sec1`. This option is required only if the `format` is `der` and ignored if it is `pem`.
	**/
	@:optional var type:PrivateKeyType;

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
	@:optional var format:KeyFormat;

	/**
		Must be `pkcs1` or `spki`. This option is required only if the format is `der`.
	**/
	@:optional var type:String;
}

@:enum abstract GenerateKeyPairType(String) {
	var RSA = "rsa";
	var DSA = "dsa";
	var EC = "ec";
	var ED25519 = "ed25519";
	var ED448 = "ed448";
	var X25519 = "x25519";
	var x448 = "x448";
}

@:enum abstract GenerateKeyPairSyncType(String) {
	var RSA = "rsa";
	var DSA = "dsa";
	var EC = "ec";
	var ED25519 = "ed25519";
	var ED448 = "ed448";
}

typedef GenerateKeyPairOptions = {
	/**
		Key size in bits (RSA, DSA).
	**/
	@:optional var modulusLength:Int;

	/**
		Public exponent (RSA). Default: `0x10001`.
	**/
	@:optional var publicExponent:Int;

	/**
		Size of q in bits (DSA).
	**/
	@:optional var divisorLength:Int;

	/**
		Name of the curve to use (EC).
	**/
	@:optional var namedCurve:String;

	/**
		@see `KeyObject.export()`.
	**/
	var publicKeyEncoding:PublicKeyEncodingOptions;

	/**
		@see `KeyObject.export()`.
	**/
	var privateKeyEncoding:PrivateKeyEncodingOptions;
}

typedef GenerateKeyPairKeyObjectOptions = {
	/**
		Key size in bits (RSA, DSA).
	**/
	@:optional var modulusLength:Int;

	/**
		Public exponent (RSA). Default: `0x10001`.
	**/
	@:optional var publicExponent:Int;

	/**
		Size of q in bits (DSA).
	**/
	@:optional var divisorLength:Int;

	/**
		Name of the curve to use (EC).
	**/
	@:optional var namedCurve:String;
}

typedef GenerateKeyPairSyncResult<T> = {
	var publicKey:T;
	var privateKey:T;
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

typedef RsaPrivateKey = {
	var key:KeyLike;

	/**
		An optional passphrase for the private key
	**/
	@:optional var passphrase:EitherType<String, Buffer>;

	@:optional var oaeHash:String;
	@:optional var oaepLabel:ArrayBufferView;
	@:optional var padding:Int;
}

typedef RsaPublicKey = {
	var key:EitherType<String, EitherType<Buffer, KeyObject>>;
	@:optional var padding:Int;
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
	@:optional var blockSize:Int;

	/**
		Parallelization parameter. Default: `1`.
	**/
	@:optional var parallelization:Int;

	/**
		Alias for `cost`. Only one of both may be specified.
	**/
	@:optional var N:Int;

	/**
		Alias for `blockSize`. Only one of both may be specified.
	**/
	@:optional var r:Int;

	/**
		Alias for `parallelization`. Only one of both may be specified.
	**/
	@:optional var p:Int;

	/**
		Memory upper bound. It is an error when (approximately) `128 * N * r > maxmem`. Default: `32 * 1024 * 1024`.
	**/
	@:optional var maxmem:Int;
}

/**
	An options type for `Crypto.sign`, `Crypto.verify` and `Sign.sign`.
**/
typedef SigningOptions = {
	> PrivateKeyOptions,
	@:optional var dsaEncoding:SigningDsaEncoding;
	@:optional var padding:Int;
	@:optional var saltLength:Int;
}

@:enum abstract SigningDsaEncoding(String) {
	var DER = "der";
	var IEEE_P1363 = "ieee-p1363";
}

@:deprecated
@:enum abstract CryptoAlgorithm(String) from String to String {
	var SHA1 = "sha1";
	var MD5 = "md5";
	var SHA256 = "sha256";
	var SHA512 = "sha512";
	var SHAKE256 = "shake256";
}
