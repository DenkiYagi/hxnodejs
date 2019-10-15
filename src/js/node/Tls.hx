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
import js.node.Buffer;
import js.node.tls.TLSSocket;
import js.node.tls.SecurePair;
import js.node.tls.SecureContext;
import js.node.tls.Server;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

typedef TlsOptionsBase = {
	/**
		If true the server will reject any connection which is not authorized with the list of supplied CAs.
		This option only has an effect if `requestCert` is true.
		Default: false.
	**/
	@:optional var rejectUnauthorized:Bool;

	/**
		possible NPN protocols. (Protocols should be ordered by their priority).
	**/
	@:optional var NPNProtocols:EitherType<Array<String>, Buffer>;
}

typedef TlsServerOptionsBase = {
	> TlsOptionsBase,

	/**
		If true the server will request a certificate from clients that connect
		and attempt to verify that certificate.
		Default: false.
	**/
	@:optional var requestCert:Bool;

	/**
		A function that will be called if client supports SNI TLS extension.
		Two argument will be passed to it: `servername`, and `cb`.
		SNICallback should invoke `cb(null, ctx)`, where `ctx` is a SecureContext instance.
		(You can use tls.createSecureContext(...) to get proper `SecureContext`).
		If `SNICallback` wasn't provided - default callback with high-level API will be used.
	**/
	@:optional var SNICallback:#if (haxe_ver >= 4)(servername:String, cb:(Error->SecureContext)) -> Void #else String->(Error->SecureContext)->Void #end;
}

typedef TlsClientOptionsBase = {
	> TlsOptionsBase,

	/**
		A Buffer instance, containing TLS session.
	**/
	@:optional var session:Buffer;

	/**
		If true - OCSP status request extension would be added to client hello,
		and OCSPResponse event will be emitted on socket before establishing secure communication
	**/
	@:optional var requestOCSP:Bool;
}

/**
	Base structure for options object used in tls methods.
**/
typedef TlsCreateServerOptions = {
	> TlsServerOptionsBase,
	> SecureContextOptions,

	/**
		Abort the connection if the SSL/TLS handshake does not finish in this many milliseconds.
		The default is 120 seconds.
		A 'clientError' is emitted on the `tls.Server` object whenever a handshake times out.
	**/
	@:optional var handshakeTimeout:Int;

	/**
		An integer specifying the seconds after which TLS session identifiers
		and TLS session tickets created by the server are timed out.
		See SSL_CTX_set_timeout for more details.
	**/
	@:optional var sessionTimeout:Int;

	/**
		A 48-byte `Buffer` instance consisting of 16-byte prefix, 16-byte hmac key, 16-byte AES key.
		You could use it to accept tls session tickets on multiple instances of tls server.

		NOTE: Automatically shared between cluster module workers.
	**/
	@:optional var ticketKeys:Buffer;
}

typedef TlsConnectOptions = {
	> TlsClientOptionsBase,
	> SecureContextOptions,

	/**
		Host the client should connect to.
		Defaults to 'localhost'
	**/
	@:optional var host:String;

	/**
		Port the client should connect to
	**/
	@:optional var port:Int;

	/**
		Establish secure connection on a given socket rather than creating a new socket.
		If this option is specified, `host` and `port` are ignored.
	**/
	@:optional var socket:js.node.net.Socket;

	/**
		Creates unix socket connection to path.
		If this option is specified, host and port are ignored.
	**/
	@:optional var path:String;

	/**
		Servername for SNI (Server Name Indication) TLS extension.
	**/
	@:optional var servername:String;

	/**
		An override for checking server's hostname against the certificate.
		Should return an error if verification fails. Return `js.Lib.undefined` if passing.
	**/
	@:optional var checkServerIdentity:String -> {}->Dynamic; // TODO: peer cerficicate structure

}

/**
	The tls module provides an implementation of the Transport Layer Security (TLS) and
	Secure Socket Layer (SSL) protocols that is built on top of OpenSSL.

	@see https://nodejs.org/api/tls.html#tls_tls_ssl
**/
@:jsRequire("tls")
extern class Tls {
	/**
		Verifies the certificate cert is issued to `hostname`.

		@see https://nodejs.org/api/tls.html#tls_tls_checkserveridentity_hostname_cert
	**/
	static function checkServerIdentity(hostname: String, cert: CertificateObject):Null<Error>;

	/**
		Creates a new client connection to the given `port` and `host` (old API) or `options.port` and `options.host`.
		If `host` is omitted, it defaults to 'localhost'.

		@see https://nodejs.org/api/tls.html#tls_tls_connect_options_callback
		@see https://nodejs.org/api/tls.html#tls_tls_connect_path_options_callback
		@see https://nodejs.org/api/tls.html#tls_tls_connect_port_host_options_callback
	**/
	@:overload(function(path:Int, ?options:TlsConnectOptions, ?callback:Void->Void):TLSSocket {})
	@:overload(function(port:Int, ?host:String, ?options:TlsConnectOptions, ?callback:Void->Void):TLSSocket {})
	static function connect(options:TlsConnectOptions, ?callback:Void->Void):TLSSocket;

	/**
		Creates a credentials object.
		It is usable as an argument to several tls APIs, such as `Tls.createServer()` and `Server.addContext()`,
		but has no public methods.

		@see https://nodejs.org/api/tls.html#tls_tls_createsecurecontext_options
	**/
	static function createSecureContext(?details:SecureContextOptions):SecureContext;

	/**
		Creates a new `Server`.
		The `connectionListener` argument is automatically set as a listener for the 'secureConnection' event.

		@see https://nodejs.org/api/tls.html#tls_tls_createserver_options_secureconnectionlistener
	**/
	static function createServer(options:TlsCreateServerOptions, ?secureConnectionListener:TLSSocket->Void):Server;

	/**
		Returns an array with the names of the supported TLS ciphers.
		The names are lower-case for historical reasons,
		but must be uppercased to be used in the ciphers option of `Tls.createSecureContext()`.

		@see https://nodejs.org/api/tls.html#tls_tls_getciphers
	**/
	static function getCiphers():Array<String>;

	/**
		An immutable array of strings representing the root certificates (in PEM format) used for verifying peer certificates.
		This is the default value of the ca option to `Tls.createSecureContext()`.

		@see https://nodejs.org/api/tls.html#tls_tls_rootcertificates
	**/
	static var rootCertificates: Array<String>;

	/**
		The default curve name to use for ECDH key agreement in a tls server.
		The default value is `'auto'`. See `Tls.createSecureContext()` for further information.

		@see https://nodejs.org/api/tls.html#tls_tls_default_ecdh_curve
	**/
	static var DEFAULT_ECDH_CURVE: String;

	/**
		The default value of the `maxVersion` option of `Tls.createSecureContext()`.
		It can be assigned any of the supported TLS protocol versions, `'TLSv1.3'`, `'TLSv1.2'`, `'TLSv1.1'`, or `'TLSv1'`.
		Default: `'TLSv1.3'`, unless changed using CLI options.
		Using `--tls-max-v1.2` sets the default to `'TLSv1.2'`.
		Using `--tls-max-v1.3` sets the default to `'TLSv1.3'`.
		If multiple of the options are provided, the highest maximum is used.

		@see https://nodejs.org/api/tls.html#tls_tls_default_max_version
	**/
	static var DEFAULT_MAX_VERSION: String;

	/**
		The default value of the `minVersion` option of `Tls.createSecureContext()`.
		It can be assigned any of the supported TLS protocol versions, `'TLSv1.3'`, `'TLSv1.2'`, `'TLSv1.1'`, or `'TLSv1'`.
		Default: `'TLSv1.2'`, unless changed using CLI options.
		Using `--tls-min-v1.0` sets the default to `'TLSv1'`.
		Using `--tls-min-v1.1` sets the default to `'TLSv1.1'`.
		Using `--tls-min-v1.3` sets the default to `'TLSv1.3'`.
		If multiple of the options are provided, the lowest minimum is used.
	**/
	static var DEFAULT_MIN_VERSION: String;

	/**
		Creates a new secure pair object with two streams, one of which reads/writes encrypted data,
		and one reads/writes cleartext data.
		Generally the encrypted one is piped to/from an incoming encrypted data stream,
		and the cleartext one is used as a replacement for the initial encrypted stream.

		@see https://nodejs.org/api/tls.html#tls_tls_createsecurepair_context_isserver_requestcert_rejectunauthorized_options
	**/
	@:deprecated
	static function createSecurePair(?context:SecureContext, ?isServer:Bool, ?requestCert:Bool, ?rejectUnauthorized:Bool):SecurePair;

	/**
		renegotiation limit, default is 3.
	**/
	static var CLIENT_RENEG_LIMIT:Int;

	/**
		renegotiation window in seconds, default is 10 minutes.
	**/
	static var CLIENT_RENEG_WINDOW:Int;
}

/**
	The `Tls.CryptoStream` class represents a stream of encrypted data.
	This class is deprecated and should no longer be used.

	@see https://nodejs.org/api/tls.html#tls_class_cryptostream.
**/
@:deprecated
class CryptoStream {

	/**
		The `CryptoStream.bytesWritten` property returns the total number of bytes written to the underlying socket including the bytes required for the implementation of the TLS protocol.

		@see https://nodejs.org/api/tls.html#tls_cryptostream_byteswritten
	**/
	@:deprecated
	static var bytesWritten(default, null): Int;
}
