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

/**
	@see https://nodejs.org/api/crypto.html#crypto_crypto_constants_1
**/
@:jsRequire("crypto", "Constants")
extern class Constants {

	/**
		OpenSSL Options

		@see https://nodejs.org/api/crypto.html#crypto_openssl_options
	**/
	static var SSL_OP_ALL(default, null):Int;
	static var SSL_OP_ALLOW_UNSAFE_LEGACY_RENEGOTIATION(default, null):Int;
	static var SSL_OP_CIPHER_SERVER_PREFERENCE(default, null):Int;
	static var SSL_OP_CISCO_ANYCONNECT(default, null):Int;
	static var SSL_OP_COOKIE_EXCHANGE(default, null):Int;
	static var SSL_OP_CRYPTOPRO_TLSEXT_BUG(default, null):Int;
	static var SSL_OP_DONT_INSERT_EMPTY_FRAGMENTS(default, null):Int;
	static var SSL_OP_EPHEMERAL_RSA(default, null):Int;
	static var SSL_OP_LEGACY_SERVER_CONNECT(default, null):Int;
	static var SSL_OP_MICROSOFT_BUG_SSLV3_BUFFER(default, null):Int;
	static var SSL_OP_MICROSOFT_SESS_ID_BUG(default, null):Int;
	static var SSL_OP_MSIE_SSLV2_RSA_PADDING(default, null):Int;
	static var SSL_OP_NETSCAPE_CA_DN_BUG(default, null):Int;
	static var SSL_OP_NETSCAPE_CHALLENGE_BUG(default, null):Int;
	static var SSL_OP_NETSCAPE_DEMO_CIPHER_CHANGE_BUG(default, null):Int;
	static var SSL_OP_NETSCAPE_REUSE_CIPHER_CHANGE_BUG(default, null):Int;
	static var SSL_OP_NO_COMPRESSION(default, null):Int;
	static var SSL_OP_NO_QUERY_MTU(default, null):Int;
	static var SSL_OP_NO_SESSION_RESUMPTION_ON_RENEGOTIATION(default, null):Int;
	static var SSL_OP_NO_SSLv2(default, null):Int;
	static var SSL_OP_NO_SSLv3(default, null):Int;
	static var SSL_OP_NO_TICKET(default, null):Int;
	static var SSL_OP_NO_TLSv1(default, null):Int;
	static var SSL_OP_NO_TLSv1_1(default, null):Int;
	static var SSL_OP_NO_TLSv1_2(default, null):Int;
	static var SSL_OP_PKCS1_CHECK_1(default, null):Int;
	static var SSL_OP_PKCS1_CHECK_2(default, null):Int;
	static var SSL_OP_SINGLE_DH_USE(default, null):Int;
	static var SSL_OP_SINGLE_ECDH_USE(default, null):Int;
	static var SSL_OP_SSLEAY_080_CLIENT_DH_BUG(default, null):Int;
	static var SSL_OP_SSLREF2_REUSE_CERT_TYPE_BUG(default, null):Int;
	static var SSL_OP_TLS_BLOCK_PADDING_BUG(default, null):Int;
	static var SSL_OP_TLS_D5_BUG(default, null):Int;
	static var SSL_OP_TLS_ROLLBACK_BUG(default, null):Int;

	/**
		OpenSSL Engine Constants

		@see https://nodejs.org/api/crypto.html#crypto_openssl_engine_constants
	**/
	static var ENGINE_METHOD_RSA(default, null):Int;
	static var ENGINE_METHOD_DSA(default, null):Int;
	static var ENGINE_METHOD_DH(default, null):Int;
	static var ENGINE_METHOD_RAND(default, null):Int;
	static var ENGINE_METHOD_EC(default, null):Int;
	static var ENGINE_METHOD_CIPHERS(default, null):Int;
	static var ENGINE_METHOD_DIGESTS(default, null):Int;
	static var ENGINE_METHOD_PKEY_METHS(default, null):Int;
	static var ENGINE_METHOD_PKEY_ASN1_METHS(default, null):Int;
	static var ENGINE_METHOD_ALL(default, null):Int;
	static var ENGINE_METHOD_NONE(default, null):Int;

	/**
		Other OpenSSL Constants

		@see https://nodejs.org/api/crypto.html#crypto_other_openssl_constants
	**/
	static var DH_CHECK_P_NOT_SAFE_PRIME(default, null):Int;
	static var DH_CHECK_P_NOT_PRIME(default, null):Int;
	static var DH_UNABLE_TO_CHECK_GENERATOR(default, null):Int;
	static var DH_NOT_SUITABLE_GENERATOR(default, null):Int;
	static var ALPN_ENABLED(default, null):Int;
	static var RSA_PKCS1_PADDING(default, null):Int;
	static var RSA_SSLV23_PADDING(default, null):Int;
	static var RSA_NO_PADDING(default, null):Int;
	static var RSA_PKCS1_OAEP_PADDING(default, null):Int;
	static var RSA_X931_PADDING(default, null):Int;
	static var RSA_PKCS1_PSS_PADDING(default, null):Int;
	static var RSA_PSS_SALTLEN_DIGEST(default, null):Int;
	static var RSA_PSS_SALTLEN_MAX_SIGN(default, null):Int;
	static var RSA_PSS_SALTLEN_AUTO(default, null):Int;
	static var POINT_CONVERSION_COMPRESSED(default, null):Int;
	static var POINT_CONVERSION_UNCOMPRESSED(default, null):Int;
	static var POINT_CONVERSION_HYBRID(default, null):Int;
}


