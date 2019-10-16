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

package js.node.tls;

import haxe.extern.EitherType;

typedef SecureContextOptions = {
	/**
		Optionally override the trusted CA certificates.
	**/
	@:optional var ca:Array<EitherType<String, Buffer>>;

	/**
		Cert chains in PEM format.
	**/
	@:optional var cert:EitherType<String, Buffer>;

	/**
		Colon-separated list of supported signature algorithms.
	**/
	@:optional var sigalgs:String;

	/**
		Cipher suite specification, replacing the default.
	**/
	@:optional var ciphers:String;

	/**
		Name of an OpenSSL engine which can provide the client certificate.
	**/
	@:optional var clientCertEngine:String;

	/**
		PEM encoded CRLs (Certificate Revocation Lists)
	**/
	@:optional var crl:EitherType<EitherType<String, Array<String>>, EitherType<Buffer, Array<Buffer>>>;

	/**
		Diffie Hellman parameters, required for Perfect Forward Secrecy.
	**/
	@:optional var dhparam:EitherType<String, Buffer>;

	/**
		A string describing a named curve or a colon separated list of curve NIDs or names,
		for example `P-521:P-384:P-256`, to use for ECDH key agreement.
	**/
	@:optional var ecdhCurve:String;

	/**
		Attempt to use the server's cipher suite preferences instead of the client's.
	**/
	@:optional var honorCipherOrder:Bool;

	/**
		Private keys in PEM format.
	**/
	@:optional var key:EitherType<EitherType<String, Array<String>>, EitherType<EitherType<Buffer, Array<Buffer>>, Array<Dynamic>>>;

	/**
		Name of an OpenSSL engine to get private key from.
	**/
	@:optional var privateKeyEngine:String;

	/**
		Identifier of a private key managed by an OpenSSL engine.
	**/
	@:optional var privateKeyIdentifier:String;

	/**
		Optionally set the maximum TLS version to allow.
	**/
	@:optional var maxVersion:String;

	/**
		Optionally set the minumum TLS version to allow.
	**/
	@:optional var minVersion:String;

	/**
		Shared passphrase used for a single private key and/or a PFX.
	**/
	@:optional var passphrase:String;

	/**
		PFX or PKCS12 encoded private key and certificate chain.
	**/
	@:optional var pfx:EitherType<EitherType<String, Array<String>>, EitherType<EitherType<Buffer, Array<Buffer>>, Array<Dynamic>>>;

	/**
		Optionally affect the OpenSSL protocol behavior, which is not usually necessary.
	**/
	@:optional var secureOptions:Int;


	/**
		Legacy mechanism to select the TLS protocol version to use, it does not support independent control of the minimum and maximum version,
		and does not support limiting the protocol to TLSv1.3.
		Use minVersion and maxVersion instead.
	**/
	@:optional var secureProtocol:String;

	/**
		Opaque identifier used by servers to ensure session state is not shared between applications.
		Unused by clients.
	**/
	@:optional var sessionIdContext:String;
}

extern class SecureContext {}
