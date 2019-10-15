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

import haxe.Constraints.Function;
import js.node.Buffer;
import js.node.events.EventEmitter.Event;
import js.node.Tls.TlsServerOptionsBase;
import js.node.Tls.TlsClientOptionsBase;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by `TLSSocket` objects in addition to its parent class events.
**/
@:enum abstract TLSSocketEvent<T:Function>(Event<T>) to Event<T> {
	/**
		The `keylog` event is emitted on a client `tls.TLSSocket` when key material is generated or received by the socket.
		This keying material can be stored for debugging, as it allows captured TLS traffic to be decrypted.
		It may be emitted multiple times, before or after the handshake completes.

		@see https://nodejs.org/api/tls.html#tls_event_keylog_1
	**/
	var Keylog:TLSSocketEvent<Bool->Void> = "keylog";

	/**
		The `'OCSPResponse'` event is emitted if the `requestOCSP` option was set
		when the `tls.TLSSocket` was created and an OCSP response has been received.

		@see https://nodejs.org/api/tls.html#tls_event_ocspresponse
	**/
	var OCSPResponse:TLSSocketEvent<Buffer->Void> = "OCSPResponse";

	/**
		The `'secureConnect'` event is emitted after the handshaking process for a new connection has successfully completed.
		The listener callback will be called regardless of whether or not the server's certificate has been authorized.
		It is the client's responsibility to check the `TLSSocket.authorized` property to determine
		if the server certificate was signed by one of the specified CAs.
		If `tlsSocket.authorized == false`, then the error can be found by examining the `tlsSocket.authorizationError` property.
		If ALPN was used, the `tlsSocket.alpnProtocol` property can be checked to determine the negotiated protocol.

		@see https://nodejs.org/api/tls.html#tls_event_secureconnect
	**/
	var SecureConnect:TLSSocketEvent<Void->Void> = "secureConnect";

	/**
		The `'session'` event is emitted on a client `tls.TLSSocket` when a new session or TLS ticket is available.
		This may or may not be before the handshake is complete, depending on the TLS protocol version that was negotiated.
		The event is not emitted on the server, or if a new session was not created, for example, when the connection was resumed.
		For some TLS protocol versions the event may be emitted multiple times,
		in which case all the sessions can be used for resumption.

		@see https://nodejs.org/api/tls.html#tls_event_session
	**/
	var Session:TLSSocketEvent<Buffer->Void> = "session";
}

/**
	An option type for constructor of `TLSSocket`.
**/
typedef TLSSocketOptions = {
	// import
	// * rejectunauthorized
	// * NPNProtocols
	// * requestCert
	// * SNICallback
	// * session
	// * requestOCSP
	> TlsServerOptionsBase,
	> TlsClientOptionsBase,

	/**
		See `Tls.createServer()`
	**/
	@:optional var enableTrace:Bool;

	/**
		If true the TLS socket will be instantiated in server-mode
	**/
	@:optional var isServer:Bool;

	/**
		A `net.Server` instance
	**/
	@:optional var server:js.node.net.Server;

	/**
		See `Tls.createServer()`
	**/
	@:optional var ALPNProtocols:Array<Buffer>;

	/**
		An optional TLS context object from `Tls.createSecureContext`
	**/
	@:optional var secureContext:SecureContext;
}

/**
	This is a wrapped version of `net.Socket` that does transparent encryption
	of written data and all required TLS negotiation.

	Its `encrypted` field is always true.
**/
@:jsRequire("tls", "TLSSocket")
extern class TLSSocket extends js.node.net.Socket {
	/**
		Construct a new `tls.TLSSocket` object from an existing TCP socket.

		@see https://nodejs.org/api/tls.html#tls_new_tls_tlssocket_socket_options
	**/
	@:overload(function(socket:js.node.net.Socket, ?options:TLSSocketOptions):Void {})
	function new(socket:js.node.stream.Duplex<Dynamic>, ?options:TLSSocketOptions);

	/**
		Returns the bound `address`, the address `family` name, and `port` of the underlying socket as reported by the operating system:
		`{ port: 12346, family: 'IPv4', address: '127.0.0.1' }`

		@see https://nodejs.org/api/tls.html#tls_tlssocket_address
	**/
	function address():js.node.net.Socket.SocketAdress;

	/**
		Returns the reason why the peer's certificate was not been verified. This property is set only when `TLSSocket.authorized == false`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_authorizationerror
	**/
	var authorizationError(default, null):Null<String>;

	/**
		Returns `true` if the peer certificate was signed by one of the CAs specified when creating the `tls.TLSSocket` instance, otherwise `false`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_authorized
	**/
	var authorized(default, null):Bool;

	/**
		Disables TLS renegotiation for this `TLSSocket` instance.
		Once called, attempts to renegotiate will trigger an `'error'` event on the `TLSSocket`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_disablerenegotiation
	**/
	function disableRenegotiation():Void;

	/**
		When enabled, TLS packet trace information is written to `stderr`.
		This can be used to debug TLS connection problems.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_enabletrace
	**/
	function enableTrace():Void;

	/**
		Always returns `true`.
		This may be used to distinguish TLS sockets from regular `net.Socket` instances.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_encrypted
	**/
	@:native("encrypted")
	var encrypted_(default, null):Bool;

	/**
		Returns an object representing the local certificate. The returned object has some properties corresponding to the fields of the certificate.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getcertificate
	**/
	function getCertificate(): Dynamic;

	/**
		Returns an object containing information on the negotiated cipher suite.
		For example: `{ name: 'AES256-SHA', version: 'TLSv1.2' }`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getcipher
	**/
	function getCipher():{name:String, version:String};

	/**
		Returns an object representing the type, name, and size of parameter of an ephemeral key exchange
		in Perfect Forward Secrecy on a client connection.
		It returns an empty object when the key exchange is not ephemeral.
		As this is only supported on a client socket; `null` is returned if called on a server socket.
		The supported types are `'DH'` and `'ECDH'`.
		The `name` property is available only when type is `'ECDH'`.

		For example: `{ type: 'ECDH', name: 'prime256v1', size: 256 }`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getephemeralkeyinfo
	**/
	function getEphemeralKeyInfo(): Dynamic;

	/**
		As the Finished messages are message digests of the complete handshake (with a total of 192 bits for TLS 1.0 and more for SSL 3.0),
		they can be used for external authentication procedures when the authentication provided by SSL/TLS is not desired or is not enough.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getfinished
	**/
	function getFinished(): Dynamic;

	/**
		Returns an object representing the peer's certificate.
		If the peer does not provide a certificate, an empty object will be returned.
		If the socket has been destroyed, `null` will be returned.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getpeercertificate_detailed
	**/
	function getPeerCertificate(?detailed:Bool):CertificateObject;

	/**
		As the `Finished` messages are message digests of the complete handshake (with a total of 192 bits for TLS 1.0 and more for SSL 3.0),
		they can be used for external authentication procedures when the authentication provided by SSL/TLS is not desired or is not enough.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getpeerfinished
	**/
	function getPeerFinished():Null<Buffer>;

	/**
		Returns a string containing the negotiated SSL/TLS protocol version of the current connection.
		The value `'None'` will be returned for connected sockets that have not completed the handshaking process.
		The value `null` will be returned for server sockets or disconnected client sockets.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getprotocol
	**/
	function getProtocol():haxe.ds.Option<String>;

	/**
		Returns the TLS session data or `null` if no session was negotiated.
		On the client, the data can be provided to the session option of `Tls.connect()` to resume the connection.
		On the server, it may be useful for debugging.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getsession
	**/
	function getSession():Buffer;

	/**
		see https://www.openssl.org/docs/man1.1.1/man3/SSL_get_shared_sigalgs.html for more information.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_getsharedsigalgs
	**/
	function getSharedSignals():Array<String>;

	/**
		For a client, returns the TLS session ticket if one is available, or `null`. For a server, always returns `null`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_gettlsticket
	**/
	function getTLSTicket():Null<Buffer>;

	/**
		see https://nodejs.org/api/tls.html#tls_session_resumption for more information.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_issessionreused
	**/
	function isSessionReused():Bool;

	/**
		The `TlsSocket.renegotiate()` method initiates a TLS renegotiation process.
		Upon completion, the `callback` function will be passed a single argument that is either an `Error` (if the request failed) or `null`.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_renegotiate_options_callback
	**/
	function renegotiate(options:{?rejectUnauthorized:Bool, ?requestCert:Bool}, ?callback:Error->Void):Bool;

	/**
		The `TlsSocket.setMaxSendFragment()` method sets the maximum TLS fragment size.
		Returns `true` if setting the limit succeeded; `false` otherwise.

		@see https://nodejs.org/api/tls.html#tls_tlssocket_setmaxsendfragment_size
	**/
	function setMaxSendFragment(size:Int):Bool;
}

/**
	an field type of `subject` and `issuer` in `CertificateObject`
	Example: `{C: 'UK', ST: 'BC', L: 'Metro', O: 'Node Fans', OU: 'Docs', CN: 'example.com'}`.
**/
typedef CertificateSubject = {
	/**
		Country
	**/
	@optional var C: String;
	/**
		StateOrProvince
	**/
	@optional var ST: String;
	/**
		Locality
	**/
	@optional var L: String;
	/**
		Organization
	**/
	@optional var O: String;
	/**
		OrganizationUnit
	**/
	@optional var OU: String;
	/**
		CommonName
		The CommonName is typically a DNS name with TLS certificates
	**/
	@optional var CN: String;
}

/**
	an return type of `getPeerCertificate` of `TLSSocket`

	@see https://nodejs.org/api/tls.html#tls_certificate_object
**/
typedef CertificateObject = {
	/**
		The DER encoded X.509 certificate data.
	**/
	var raw: Buffer;

	/**
		The certificate subject.
	**/
	var subject: CertificateSubject;

	/**
		The certificate issuer.
	**/
	var issuer: CertificateSubject;

	/**
		The data-time the certificate is valid from.
	**/
	var valid_from: String;

	/**
		The data-time the certificate is valid to
	**/
	var valid_to: String;

	/**
		The certificate serial number, as a hex string. Example: `'B9B0D332A1AA5635'`.
	**/
	var serialNumber: String;

	/**
		The SHA-1 digest of the DER encoded certificate. It is returned as a `:` separated hexadecimal string. Example: `'2A:7A:C2:DD:...'`.
	**/
	var fingerprint: String;

	/**
		The SHA-256 digest of the DER encoded certificate. It is returned as a `:` separated hexadecimal string. Example: `'2A:7A:C2:DD:...'`.
	**/
	var fingerprint256: String;

	/**
		The extended key usage, a set of OIDs.
	**/
	@optional var ext_key_usage: Array<String>;

	/**
		A string containing concatenated names for the subject, an alternative to the `subject` names.
	**/
	@optional var subjectaltname: String;

	/**
		An array describing the AuthorityInfoAccess, used with OCSP.
	**/
	@optional var infoAccess: Array<String>;

	/**
		The issuer certificate object. For self-signed certificates, this may be a circular reference.
	**/
	@optional var issuerCertificate: CertificateObject;
}

