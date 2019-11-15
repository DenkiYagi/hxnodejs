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

import js.node.Buffer;
import js.node.tls.TLSSocket;
import js.node.tls.SecureContext.SecureContextOptions;
import js.node.events.EventEmitter.Event;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of events emitted by `Server` in addition to its parent classes.
**/
@:enum abstract ServerEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {

	/**
		The `'keylog'` event is emitted when key material is generated or received by a connection
		to this server (typically before handshake has completed, but not necessarily).
		This keying material can be stored for debugging, as it allows captured TLS traffic to be decrypted.

		@see https://nodejs.org/api/tls.html#tls_event_keylog
	**/
	var Keylog:ServerEvent<Bool->TLSSocket->Void> = "keylog";

	/**
		The `'newSession'` event is emitted upon creation of a new TLS session.
		This may be used to store sessions in external storage.
		The data should be provided to the `'resumeSession'` callback.

		@see https://nodejs.org/api/tls.html#tls_event_newsession
	**/
	var NewSession:ServerEvent<Buffer->Buffer->(Void->Void)->Void> = "newSession";

	/**
		The `'OCSPRequest'` event is emitted when the client sends a certificate status request.

		@see https://nodejs.org/api/tls.html#tls_event_ocsprequest
	**/
	var OCSPRequest:ServerEvent<Buffer->Buffer->(Null<Error>->?Buffer->Void)->Void> = "OCSPRequest";


	/**
		The `'resumeSession'` event is emitted when the client requests to resume a previous TLS session.

		@see https://nodejs.org/api/tls.html#tls_event_resumesession
	**/
	var ResumeSession:ServerEvent<Buffer->(Null<Error>->?Buffer->Void)->Void> = "resumeSession";

	/**
		The `'secureConnection'` event is emitted after the handshaking process for a new connection has successfully completed.

		@see https://nodejs.org/api/tls.html#tls_event_secureconnection
	**/
	var SecureConnection:ServerEvent<TLSSocket->Void> = "secureConnection";

	/**
		The 'ClientError' event is emitted when an error occurs before a secure connection is established.

		@see https://nodejs.org/api/tls.html#tls_event_tlsclienterror
	**/
	var ClientError:ServerEvent<Error->TLSSocket->Void> = "tlsClientError";
}

/**
	Accepts encrypted connections using TLS or SSL.

	@see https://nodejs.org/api/tls.html#tls_class_tls_server
**/
@:jsRequire("tls", "Server")
extern class Server extends js.node.net.Server {
	/**
		The `Server.addContext()` method adds a secure context that will be used
		if the client request's SNI name matches the supplied `hostname` (or wildcard).

		@see https://nodejs.org/api/tls.html#tls_server_addcontext_hostname_context
	**/
	function addContext(hostname:String, credentials:SecureContextOptions):Void;

	/**
		Returns the bound address, the address family name, and port of the server as reported by the operating system.
		See `net.Server.address()` for more information.

		@see https://nodejs.org/api/tls.html#tls_server_address
	**/
    function address():Dynamic;

	/**
		The server.close() method stops the server from accepting new connections.

		@see https://nodejs.org/api/tls.html#tls_server_close_callback
	**/
    function close(callback:Null<Error>->Void):Server;

	/**
		Returns the current number of concurrent connections on the server.

		@see https://nodejs.org/api/tls.html#tls_server_connections
	**/
	@:deprecated
	static var connections(default, null):Int;

	/**
		Returns the session ticket keys.

		@see https://nodejs.org/api/tls.html#tls_server_getticketkeys
	**/
	function getTicketKeys():Buffer;

	/**
		Starts the server listening for encrypted connections.
		This method is identical to `Server.listen()` from `Net.Server`.

		@see https://nodejs.org/api/tls.html#tls_server_listen
	**/
    function listen():Void;

	/**
		The `Server.setSecureContext()` method replaces the secure context of an existing server.
		Existing connections to the server are not interrupted.

		@see https://nodejs.org/api/tls.html#tls_server_setsecurecontext_options
	**/
    function setSecureContext(options:SecureContextOptions):Void;


	/**
		Sets the session ticket keys.

		@see  https://nodejs.org/api/tls.html#tls_server_setticketkeys_keys
	**/
	function setTicketKeys(keys:Buffer):Void;
}
