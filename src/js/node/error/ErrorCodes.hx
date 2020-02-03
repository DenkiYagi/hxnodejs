/*
 * Copyright (C)2014-2020 Haxe Foundation
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

package js.node.error;

import js.lib.intl.DateTimeFormat.EraRepresentation;
import js.node.Error;

/**
	@see https://nodejs.org/api/errors.html#errors_node_js_error_codes
**/
class ErrorCodes {
	/**
		A function argument is being used in a way that
		suggests that the function signature may be misunderstood.
		This is thrown by the `assert` module when the message parameter in `assert.throws(block, message)`
		matches the error message thrown by `block`
		because that usage suggests that the user believes message is the expected message rather than
		the message the `AssertionError` will display if block does not throw.

		@see https://nodejs.org/api/errors.html#errors_err_ambiguous_argument
	**/
	public static var ERR_AMBIGUOUS_ARGUMENT(get, never):Error;

	private static inline function get_ERR_AMBIGUOUS_ARGUMENT():Error
		return js.Syntax.code("ERR_AMBIGUOUS_ARGUMENT");

	/**
		An iterable argument (i.e. a value that works with `for...of` loops) was required,
		but not provided to a Node.js API.

		@see https://nodejs.org/api/errors.html#errors_err_arg_not_iterable
	**/
	public static var ERR_ARG_NOT_ITERABLE(get, never):Error;

	private static inline function get_ERR_ARG_NOT_ITERABLE():Error
		return js.Syntax.code("ERR_ARG_NOT_ITERABLE");

	/**
		A special type of error that can be triggered
		whenever Node.js detects an exceptional logic violation that should never occur.
		These are raised typically by the `assert` module.

		@see https://nodejs.org/api/errors.html#errors_err_assertion
	**/
	public static var ERR_ASSERTION(get, never):Error;

	private static inline function get_ERR_ASSERTION():Error
		return js.Syntax.code("ERR_ASSERTION");

	/**
		An attempt was made to register something that is not a function as an `AsyncHooks` callback.

		@see https://nodejs.org/api/errors.html#errors_err_async_callback
	**/
	public static var ERR_ASYNC_CALLBACK(get, never):Error;

	private static inline function get_ERR_ASYNC_CALLBACK():Error
		return js.Syntax.code("ERR_ASYNC_CALLBACK");

	/**
		The type of an asynchronous resource was invalid.
		Users are also able to define their own types if using the public embedder API.

		@see https://nodejs.org/api/errors.html#errors_err_async_type
	**/
	public static var ERR_ASYNC_TYPE(get, never):Error;

	private static inline function get_ERR_ASYNC_TYPE():Error
		return js.Syntax.code("ERR_ASYNC_TYPE");

	/**
		Data passed to a Brotli stream was not successfully compressed.

		@see https://nodejs.org/api/errors.html#errors_err_brotli_compression_failed
	**/
	public static var ERR_BROTLI_COMPRESSION_FAILED(get, never):Error;

	private static inline function get_ERR_BROTLI_COMPRESSION_FAILED():Error
		return js.Syntax.code("ERR_BROTLI_COMPRESSION_FAILED");

	/**
		An invalid parameter key was passed during construction of a Brotli stream.

		@see https://nodejs.org/api/errors.html#errors_err_brotli_invalid_param
	**/
	public static var ERR_BROTLI_INVALID_PARAM(get, never):Error;

	private static inline function get_ERR_BROTLI_INVALID_PARAM():Error
		return js.Syntax.code("ERR_BROTLI_INVALID_PARAM");

	/**
		An attempt was made to create a Node.js `Buffer` instance from addon or embedder code,
		while in a JS engine Context that is not associated with a Node.js instance.
		The data passed to the `Buffer` method will have been released by the time the method returns.

		@see https://nodejs.org/api/errors.html#errors_err_buffer_context_not_available
	**/
	public static var ERR_BUFFER_CONTEXT_NOT_AVAILABLE(get, never):Error;

	private static inline function get_ERR_BUFFER_CONTEXT_NOT_AVAILABLE():Error
		return js.Syntax.code("ERR_BUFFER_CONTEXT_NOT_AVAILABLE");

	/**
		An operation outside the bounds of a Buffer was attempted.

		@see https://nodejs.org/api/errors.html#errors_err_buffer_out_of_bounds
	**/
	public static var ERR_BUFFER_OUT_OF_BOUNDS(get, never):Error;

	private static inline function get_ERR_BUFFER_OUT_OF_BOUNDS():Error
		return js.Syntax.code("ERR_BUFFER_OUT_OF_BOUNDS");

	/**
		An attempt has been made to create a `Buffer` larger than the maximum allowed size.

		@see https://nodejs.org/api/errors.html#errors_err_buffer_too_large
	**/
	public static var ERR_BUFFER_TOO_LARGE(get, never):Error;

	private static inline function get_ERR_BUFFER_TOO_LARGE():Error
		return js.Syntax.code("ERR_BUFFER_TOO_LARGE");

	/**
		Node.js was unable to watch for the `SIGINT` signal.

		@see https://nodejs.org/api/errors.html#errors_err_cannot_watch_sigint
	**/
	public static var ERR_CANNOT_WATCH_SIGINT(get, never):Error;

	private static inline function get_ERR_CANNOT_WATCH_SIGINT():Error
		return js.Syntax.code("ERR_CANNOT_WATCH_SIGINT");

	/**
		A child process was closed before the parent received a reply.

		@see https://nodejs.org/api/errors.html#errors_err_child_closed_before_reply
	**/
	public static var ERR_CHILD_CLOSED_BEFORE_REPLY(get, never):Error;

	private static inline function get_ERR_CHILD_CLOSED_BEFORE_REPLY():Error
		return js.Syntax.code("ERR_CHILD_CLOSED_BEFORE_REPLY");

	/**
		Used when a child process is being forked without specifying an IPC channel.

		@see https://nodejs.org/api/errors.html#errors_err_child_process_ipc_required
	**/
	public static var ERR_CHILD_PROCESS_IPC_REQUIRED(get, never):Error;

	private static inline function get_ERR_CHILD_PROCESS_IPC_REQUIRED():Error
		return js.Syntax.code("ERR_CHILD_PROCESS_IPC_REQUIRED");

	/**
		Used when the main process is trying to read data from the child process's STDERR/STDOUT,
		and the data's length is longer than the `maxBuffer` option.

		@see https://nodejs.org/api/errors.html#errors_err_child_process_stdio_maxbuffer
	**/
	public static var ERR_CHILD_PROCESS_STDIO_MAXBUFFER(get, never):Error;

	private static inline function get_ERR_CHILD_PROCESS_STDIO_MAXBUFFER():Error
		return js.Syntax.code("ERR_CHILD_PROCESS_STDIO_MAXBUFFER");

	/**
		`Console` was instantiated without `stdout` stream, or `Console` has a non-writable stdout or stderr stream.

		@see https://nodejs.org/api/errors.html#errors_err_console_writable_stream
	**/
	public static var ERR_CONSOLE_WRITABLE_STREAM(get, never):Error;

	private static inline function get_ERR_CONSOLE_WRITABLE_STREAM():Error
		return js.Syntax.code("ERR_CONSOLE_WRITABLE_STREAM");

	/**
		A constructor for a class was called without `new`.

		@see https://nodejs.org/api/errors.html#errors_err_construct_call_required
	**/
	public static var ERR_CONSTRUCT_CALL_REQUIRED(get, never):Error;

	private static inline function get_ERR_CONSTRUCT_CALL_REQUIRED():Error
		return js.Syntax.code("ERR_CONSTRUCT_CALL_REQUIRED");

	/**
		A class constructor was called that is not callable.

		@see https://nodejs.org/api/errors.html#errors_err_construct_call_invalid
	**/
	public static var ERR_CONSTRUCT_CALL_INVALID(get, never):Error;

	private static inline function get_ERR_CONSTRUCT_CALL_INVALID():Error
		return js.Syntax.code("ERR_CONSTRUCT_CALL_INVALID");

	/**
		The native call from `process.cpuUsage` could not be processed.

		@see https://nodejs.org/api/errors.html#errors_err_cpu_usage
	**/
	public static var ERR_CPU_USAGE(get, never):Error;

	private static inline function get_ERR_CPU_USAGE():Error
		return js.Syntax.code("ERR_CPU_USAGE");

	/**
		A client certificate engine was requested that is not supported by the version of OpenSSL being used.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_custom_engine_not_supported
	**/
	public static var ERR_CRYPTO_CUSTOM_ENGINE_NOT_SUPPORTED(get, never):Error;

	private static inline function get_ERR_CRYPTO_CUSTOM_ENGINE_NOT_SUPPORTED():Error
		return js.Syntax.code("ERR_CRYPTO_CUSTOM_ENGINE_NOT_SUPPORTED");

	/**
		An invalid value for the format argument was passed to the `crypto.ECDH()` class `getPublicKey()` method.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_ecdh_invalid_format
	**/
	public static var ERR_CRYPTO_ECDH_INVALID_FORMAT(get, never):Error;

	private static inline function get_ERR_CRYPTO_ECDH_INVALID_FORMAT():Error
		return js.Syntax.code("ERR_CRYPTO_ECDH_INVALID_FORMAT");

	/**
		An invalid value for the `key` argument has been passed to the `crypto.ECDH()` class `computeSecret()` method.
		It means that the public key lies outside of the elliptic curve.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_ecdh_invalid_public_key
	**/
	public static var ERR_CRYPTO_ECDH_INVALID_PUBLIC_KEY(get, never):Error;

	private static inline function get_ERR_CRYPTO_ECDH_INVALID_PUBLIC_KEY():Error
		return js.Syntax.code("ERR_CRYPTO_ECDH_INVALID_PUBLIC_KEY");

	/**
		An invalid crypto engine identifier was passed to `require('crypto').setEngine()`.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_engine_unknown
	**/
	public static var ERR_CRYPTO_ENGINE_UNKNOWN(get, never):Error;

	private static inline function get_ERR_CRYPTO_ENGINE_UNKNOWN():Error
		return js.Syntax.code("ERR_CRYPTO_ENGINE_UNKNOWN");

	/**
		The `--force-fips` command-line argument was used but
		there was an attempt to enable or disable FIPS mode in the `crypto` module.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_fips_forced
	**/
	public static var ERR_CRYPTO_FIPS_FORCED(get, never):Error;

	private static inline function get_ERR_CRYPTO_FIPS_FORCED():Error
		return js.Syntax.code("ERR_CRYPTO_FIPS_FORCED");

	/**
		An attempt was made to enable or disable FIPS mode,
		but FIPS mode was not available.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_fips_unavailable
	**/
	public static var ERR_CRYPTO_FIPS_UNAVAILABLE(get, never):Error;

	private static inline function get_ERR_CRYPTO_FIPS_UNAVAILABLE():Error
		return js.Syntax.code("ERR_CRYPTO_FIPS_UNAVAILABLE");

	/**
		`hash.digest()` was called multiple times.
		The `hash.digest()` method must be called no more than one time per instance of a `Hash` object.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_hash_finalized
	**/
	public static var ERR_CRYPTO_HASH_FINALIZED(get, never):Error;

	private static inline function get_ERR_CRYPTO_HASH_FINALIZED():Error
		return js.Syntax.code("ERR_CRYPTO_HASH_FINALIZED");

	/**
		`hash.update()` failed for any reason.
		This should rarely, if ever, happen.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_hash_update_failed
	**/
	public static var ERR_CRYPTO_HASH_UPDATE_FAILED(get, never):Error;

	private static inline function get_ERR_CRYPTO_HASH_UPDATE_FAILED():Error
		return js.Syntax.code("ERR_CRYPTO_HASH_UPDATE_FAILED");

	/**
		The selected public or private key encoding is incompatible with other options.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_incompatible_key_options
	**/
	public static var ERR_CRYPTO_INCOMPATIBLE_KEY_OPTIONS(get, never):Error;

	private static inline function get_ERR_CRYPTO_INCOMPATIBLE_KEY_OPTIONS():Error
		return js.Syntax.code("ERR_CRYPTO_INCOMPATIBLE_KEY_OPTIONS");

	/**
		An invalid crypto digest algorithm was specified.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_invalid_digest
	**/
	public static var ERR_CRYPTO_INVALID_DIGEST(get, never):Error;

	private static inline function get_ERR_CRYPTO_INVALID_DIGEST():Error
		return js.Syntax.code("ERR_CRYPTO_INVALID_DIGEST");

	/**
		The given crypto key object's type is invalid for the attempted operation.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_invalid_key_object_type
	**/
	public static var ERR_CRYPTO_INVALID_KEY_OBJECT_TYPE(get, never):Error;

	private static inline function get_ERR_CRYPTO_INVALID_KEY_OBJECT_TYPE():Error
		return js.Syntax.code("ERR_CRYPTO_INVALID_KEY_OBJECT_TYPE");

	/**
		A crypto method was used on an object that was in an invalid state.
		For instance, calling `cipher.getAuthTag()` before calling `cipher.final()`.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_invalid_state
	**/
	public static var ERR_CRYPTO_INVALID_STATE(get, never):Error;

	private static inline function get_ERR_CRYPTO_INVALID_STATE():Error
		return js.Syntax.code("ERR_CRYPTO_INVALID_STATE");

	/**
		The PBKDF2 algorithm failed for unspecified reasons.
		OpenSSL does not provide more details and therefore neither does Node.js.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_pbkdf2_error
	**/
	public static var ERR_CRYPTO_PBKDF2_ERROR(get, never):Error;

	private static inline function get_ERR_CRYPTO_PBKDF2_ERROR():Error
		return js.Syntax.code("ERR_CRYPTO_PBKDF2_ERROR");

	/**
		One or more `crypto.scrypt()` or `crypto.scryptSync()` parameters are outside their legal range.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_scrypt_invalid_parameter
	**/
	public static var ERR_CRYPTO_SCRYPT_INVALID_PARAMETER(get, never):Error;

	private static inline function get_ERR_CRYPTO_SCRYPT_INVALID_PARAMETER():Error
		return js.Syntax.code("ERR_CRYPTO_SCRYPT_INVALID_PARAMETER");

	/**
		Node.js was compiled without scrypt support.
		Not possible with the official release binaries
		but can happen with custom builds, including distro builds.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_scrypt_not_supported
	**/
	public static var ERR_CRYPTO_SCRYPT_NOT_SUPPORTED(get, never):Error;

	private static inline function get_ERR_CRYPTO_SCRYPT_NOT_SUPPORTED():Error
		return js.Syntax.code("ERR_CRYPTO_SCRYPT_NOT_SUPPORTED");

	/**
		A signing `key` was not provided to the `sign.sign()` method.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_sign_key_required
	**/
	public static var ERR_CRYPTO_SIGN_KEY_REQUIRED(get, never):Error;

	private static inline function get_ERR_CRYPTO_SIGN_KEY_REQUIRED():Error
		return js.Syntax.code("ERR_CRYPTO_SIGN_KEY_REQUIRED");

	/**
		`crypto.timingSafeEqual()` was called with `Buffer`, `ArrayBufferView` arguments of different lengths.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_timing_safe_equal_length
	**/
	public static var ERR_CRYPTO_TIMING_SAFE_EQUAL_LENGTH(get, never):Error;

	private static inline function get_ERR_CRYPTO_TIMING_SAFE_EQUAL_LENGTH():Error
		return js.Syntax.code("ERR_CRYPTO_TIMING_SAFE_EQUAL_LENGTH");

	/**
		The `fs.Dir` was previously closed.

		@see https://nodejs.org/api/errors.html#errors_err_dir_closed
	**/
	public static var ERR_DIR_CLOSED(get, never):Error;

	private static inline function get_ERR_DIR_CLOSED():Error
		return js.Syntax.code("ERR_DIR_CLOSED");

	/**
		`c-ares` failed to set the DNS server.

		@see https://nodejs.org/api/errors.html#errors_err_dns_set_servers_failed
	**/
	public static var ERR_DNS_SET_SERVERS_FAILED(get, never):Error;

	private static inline function get_ERR_DNS_SET_SERVERS_FAILED():Error
		return js.Syntax.code("ERR_DNS_SET_SERVERS_FAILED");

	/**
		The `domain` module was not usable since it could not establish the required error handling hooks,
		because `process.setUncaughtExceptionCaptureCallback()` had been called at an earlier point in time.

		@see https://nodejs.org/api/errors.html#errors_err_domain_callback_not_available
	**/
	public static var ERR_DOMAIN_CALLBACK_NOT_AVAILABLE(get, never):Error;

	private static inline function get_ERR_DOMAIN_CALLBACK_NOT_AVAILABLE():Error
		return js.Syntax.code("ERR_DOMAIN_CALLBACK_NOT_AVAILABLE");

	/**
		`process.setUncaughtExceptionCaptureCallback()` could not be called because
		the domain module has been loaded at an earlier point in time.

		@see https://nodejs.org/api/errors.html#errors_err_domain_cannot_set_uncaught_exception_capture
	**/
	public static var ERR_DOMAIN_CANNOT_SET_UNCAUGHT_EXCEPTION_CAPTURE(get, never):Error;

	private static inline function get_ERR_DOMAIN_CANNOT_SET_UNCAUGHT_EXCEPTION_CAPTURE():Error
		return js.Syntax.code("ERR_DOMAIN_CANNOT_SET_UNCAUGHT_EXCEPTION_CAPTURE");

	/**
		Data provided to `TextDecoder()` API was invalid according to the encoding provided.

		@see https://nodejs.org/api/errors.html#errors_err_encoding_invalid_encoded_data
	**/
	public static var ERR_ENCODING_INVALID_ENCODED_DATA(get, never):Error;

	private static inline function get_ERR_ENCODING_INVALID_ENCODED_DATA():Error
		return js.Syntax.code("ERR_ENCODING_INVALID_ENCODED_DATA");

	/**
		Encoding provided to `TextDecoder()` API was not one of the WHATWG Supported Encodings.

		@see https://nodejs.org/api/errors.html#errors_err_encoding_not_supported
	**/
	public static var ERR_ENCODING_NOT_SUPPORTED(get, never):Error;

	private static inline function get_ERR_ENCODING_NOT_SUPPORTED():Error
		return js.Syntax.code("ERR_ENCODING_NOT_SUPPORTED");

	/**
		A `Promise` that was callbackified via `util.callbackify()` was rejected with a falsy value.

		@see https://nodejs.org/api/errors.html#errors_err_falsy_value_rejection
	**/
	public static var ERR_FALSY_VALUE_REJECTION(get, never):Error;

	private static inline function get_ERR_FALSY_VALUE_REJECTION():Error
		return js.Syntax.code("ERR_FALSY_VALUE_REJECTION");

	/**
		An attempt has been made to read a file whose size is larger than
		the maximum allowed size for a `Buffer`.

		@see https://nodejs.org/api/errors.html#errors_err_fs_file_too_large
	**/
	public static var ERR_FS_FILE_TOO_LARGE(get, never):Error;

	private static inline function get_ERR_FS_FILE_TOO_LARGE():Error
		return js.Syntax.code("ERR_FS_FILE_TOO_LARGE");

	/**
		An invalid symlink type was passed to the `fs.symlink()` or `fs.symlinkSync()` methods.

		@see https://nodejs.org/api/errors.html#errors_err_fs_invalid_symlink_type
	**/
	public static var ERR_FS_INVALID_SYMLINK_TYPE(get, never):Error;

	private static inline function get_ERR_FS_INVALID_SYMLINK_TYPE():Error
		return js.Syntax.code("ERR_FS_INVALID_SYMLINK_TYPE");

	/**
		An attempt was made to add more headers after the headers had already been sent.

		@see https://nodejs.org/api/errors.html#errors_err_http_headers_sent
	**/
	public static var ERR_HTTP_HEADERS_SENT(get, never):Error;

	private static inline function get_ERR_HTTP_HEADERS_SENT():Error
		return js.Syntax.code("ERR_HTTP_HEADERS_SENT");

	/**
		An invalid HTTP header value was specified.

		@see https://nodejs.org/api/errors.html#errors_err_http_invalid_header_value
	**/
	public static var ERR_HTTP_INVALID_HEADER_VALUE(get, never):Error;

	private static inline function get_ERR_HTTP_INVALID_HEADER_VALUE():Error
		return js.Syntax.code("ERR_HTTP_INVALID_HEADER_VALUE");

	/**
		Status code was outside the regular status code range (100-999).

		@see https://nodejs.org/api/errors.html#errors_err_http_invalid_status_code
	**/
	public static var ERR_HTTP_INVALID_STATUS_CODE(get, never):Error;

	private static inline function get_ERR_HTTP_INVALID_STATUS_CODE():Error
		return js.Syntax.code("ERR_HTTP_INVALID_STATUS_CODE");

	/**
		The `Trailer` header was set even though the transfer encoding does not support that.

		@see https://nodejs.org/api/errors.html#errors_err_http_trailer_invalid
	**/
	public static var ERR_HTTP_TRAILER_INVALID(get, never):Error;

	private static inline function get_ERR_HTTP_TRAILER_INVALID():Error
		return js.Syntax.code("ERR_HTTP_TRAILER_INVALID");

	/**
		HTTP/2 ALTSVC frames require a valid origin.

		@see https://nodejs.org/api/errors.html#errors_err_http2_altsvc_invalid_origin
	**/
	public static var ERR_HTTP2_ALTSVC_INVALID_ORIGIN(get, never):Error;

	private static inline function get_ERR_HTTP2_ALTSVC_INVALID_ORIGIN():Error
		return js.Syntax.code("ERR_HTTP2_ALTSVC_INVALID_ORIGIN");

	/**
		HTTP/2 ALTSVC frames are limited to a maximum of 16,382 payload bytes.

		@see https://nodejs.org/api/errors.html#errors_err_http2_altsvc_length
	**/
	public static var ERR_HTTP2_ALTSVC_LENGTH(get, never):Error;

	private static inline function get_ERR_HTTP2_ALTSVC_LENGTH():Error
		return js.Syntax.code("ERR_HTTP2_ALTSVC_LENGTH");

	/**
		For HTTP/2 requests using the `CONNECT` method, the `:authority` pseudo-header is required.

		@see https://nodejs.org/api/errors.html#errors_err_http2_connect_authority
	**/
	public static var ERR_HTTP2_CONNECT_AUTHORITY(get, never):Error;

	private static inline function get_ERR_HTTP2_CONNECT_AUTHORITY():Error
		return js.Syntax.code("ERR_HTTP2_CONNECT_AUTHORITY");

	/**
		For HTTP/2 requests using the `CONNECT` method, the `:path` pseudo-header is forbidden.

		@see https://nodejs.org/api/errors.html#errors_err_http2_connect_path
	**/
	public static var ERR_HTTP2_CONNECT_PATH(get, never):Error;

	private static inline function get_ERR_HTTP2_CONNECT_PATH():Error
		return js.Syntax.code("ERR_HTTP2_CONNECT_PATH");

	/**
		For HTTP/2 requests using the `CONNECT` method, the `:scheme` pseudo-header is forbidden.

		@see https://nodejs.org/api/errors.html#errors_err_http2_connect_scheme
	**/
	public static var ERR_HTTP2_CONNECT_SCHEME(get, never):Error;

	private static inline function get_ERR_HTTP2_CONNECT_SCHEME():Error
		return js.Syntax.code("ERR_HTTP2_CONNECT_SCHEME");

	/**
		A non-specific HTTP/2 error has occurred.

		@see https://nodejs.org/api/errors.html#errors_err_http2_error
	**/
	public static var ERR_HTTP2_ERROR(get, never):Error;

	private static inline function get_ERR_HTTP2_ERROR():Error
		return js.Syntax.code("ERR_HTTP2_ERROR");

	/**
		New HTTP/2 Streams may not be opened after the `Http2Session`
		has received a `GOAWAY` frame from the connected peer.

		@see https://nodejs.org/api/errors.html#errors_err_http2_goaway_session
	**/
	public static var ERR_HTTP2_GOAWAY_SESSION(get, never):Error;

	private static inline function get_ERR_HTTP2_GOAWAY_SESSION():Error
		return js.Syntax.code("ERR_HTTP2_GOAWAY_SESSION");

	/**
		An additional headers was specified after an HTTP/2 response was initiated.

		@see https://nodejs.org/api/errors.html#errors_err_http2_headers_after_respond
	**/
	public static var ERR_HTTP2_HEADERS_AFTER_RESPOND(get, never):Error;

	private static inline function get_ERR_HTTP2_HEADERS_AFTER_RESPOND():Error
		return js.Syntax.code("ERR_HTTP2_HEADERS_AFTER_RESPOND");

	/**
		An attempt was made to send multiple response headers.

		@see https://nodejs.org/api/errors.html#errors_err_http2_headers_sent
	**/
	public static var ERR_HTTP2_HEADERS_SENT(get, never):Error;

	private static inline function get_ERR_HTTP2_HEADERS_SENT():Error
		return js.Syntax.code("ERR_HTTP2_HEADERS_SENT");

	/**
		Multiple values were provided for an HTTP/2 header field that was required to have only a single value.

		@see https://nodejs.org/api/errors.html#errors_err_http2_header_single_value
	**/
	public static var ERR_HTTP2_HEADER_SINGLE_VALUE(get, never):Error;

	private static inline function get_ERR_HTTP2_HEADER_SINGLE_VALUE():Error
		return js.Syntax.code("ERR_HTTP2_HEADER_SINGLE_VALUE");

	/**
		Informational HTTP status codes (`1xx`) may not be set as the response status code on HTTP/2 responses.

		@see https://nodejs.org/api/errors.html#errors_err_http2_info_status_not_allowed
	**/
	public static var ERR_HTTP2_INFO_STATUS_NOT_ALLOWED(get, never):Error;

	private static inline function get_ERR_HTTP2_INFO_STATUS_NOT_ALLOWED():Error
		return js.Syntax.code("ERR_HTTP2_INFO_STATUS_NOT_ALLOWED");

	/**
		HTTP/1 connection specific headers are forbidden to be used in HTTP/2 requests and responses.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_connection_headers
	**/
	public static var ERR_HTTP2_INVALID_CONNECTION_HEADERS(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_CONNECTION_HEADERS():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_CONNECTION_HEADERS");

	/**
		An invalid HTTP/2 header value was specified.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_header_value
	**/
	public static var ERR_HTTP2_INVALID_HEADER_VALUE(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_HEADER_VALUE():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_HEADER_VALUE");

	/**
		An invalid HTTP informational status code has been specified.
		Informational status codes must be an integer between `100` and `199` (inclusive).

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_info_status
	**/
	public static var ERR_HTTP2_INVALID_INFO_STATUS(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_INFO_STATUS():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_INFO_STATUS");

	/**
		HTTP/2 ORIGIN frames require a valid origin.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_origin
	**/
	public static var ERR_HTTP2_INVALID_ORIGIN(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_ORIGIN():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_ORIGIN");

	/**
		Input `Buffer` and `Uint8Array` instances passed to the `http2.getUnpackedSettings()` API
		must have a length that is a multiple of six.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_packed_settings_length
	**/
	public static var ERR_HTTP2_INVALID_PACKED_SETTINGS_LENGTH(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_PACKED_SETTINGS_LENGTH():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_PACKED_SETTINGS_LENGTH");

	/**
		Only valid HTTP/2 pseudoheaders (`:status`, `:path`, `:authority`, `:scheme`, and `:method`)
		may be used.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_pseudoheader
	**/
	public static var ERR_HTTP2_INVALID_PSEUDOHEADER(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_PSEUDOHEADER():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_PSEUDOHEADER");

	/**
		An action was performed on an `Http2Session` object that had already been destroyed.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_session
	**/
	public static var ERR_HTTP2_INVALID_SESSION(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_SESSION():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_SESSION");

	/**
		An invalid value has been specified for an HTTP/2 setting.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_setting_value
	**/
	public static var ERR_HTTP2_INVALID_SETTING_VALUE(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_SETTING_VALUE():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_SETTING_VALUE");

	/**
		An operation was performed on a stream that had already been destroyed.

		@see https://nodejs.org/api/errors.html#errors_err_http2_invalid_stream
	**/
	public static var ERR_HTTP2_INVALID_STREAM(get, never):Error;

	private static inline function get_ERR_HTTP2_INVALID_STREAM():Error
		return js.Syntax.code("ERR_HTTP2_INVALID_STREAM");

	/**
		Whenever an HTTP/2 `SETTINGS` frame is sent to a connected peer,
		the peer is required to send an acknowledgment that it has received and applied the new `SETTINGS`.
		By default, a maximum number of unacknowledged `SETTINGS` frames may be sent at any given time.
		This error code is used when that limit has been reached.

		@see https://nodejs.org/api/errors.html#errors_err_http2_max_pending_settings_ack
	**/
	public static var ERR_HTTP2_MAX_PENDING_SETTINGS_ACK(get, never):Error;

	private static inline function get_ERR_HTTP2_MAX_PENDING_SETTINGS_ACK():Error
		return js.Syntax.code("ERR_HTTP2_MAX_PENDING_SETTINGS_ACK");

	/**
		An attempt was made to initiate a new push stream from within a push stream.
		Nested push streams are not permitted.

		@see https://nodejs.org/api/errors.html#errors_err_http2_nested_push
	**/
	public static var ERR_HTTP2_NESTED_PUSH(get, never):Error;

	private static inline function get_ERR_HTTP2_NESTED_PUSH():Error
		return js.Syntax.code("ERR_HTTP2_NESTED_PUSH");

	/**
		An attempt was made to directly manipulate (read, write, pause, resume, etc.)
		a socket attached to an `Http2Session`.

		@see https://nodejs.org/api/errors.html#errors_err_http2_no_socket_manipulation
	**/
	public static var ERR_HTTP2_NO_SOCKET_MANIPULATION(get, never):Error;

	private static inline function get_ERR_HTTP2_NO_SOCKET_MANIPULATION():Error
		return js.Syntax.code("ERR_HTTP2_NO_SOCKET_MANIPULATION");

	/**
		HTTP/2 `ORIGIN` frames are limited to a length of 16382 bytes.

		@see https://nodejs.org/api/errors.html#errors_err_http2_origin_length
	**/
	public static var ERR_HTTP2_ORIGIN_LENGTH(get, never):Error;

	private static inline function get_ERR_HTTP2_ORIGIN_LENGTH():Error
		return js.Syntax.code("ERR_HTTP2_ORIGIN_LENGTH");

	/**
		The number of streams created on a single HTTP/2 session reached the maximum limit.

		@see https://nodejs.org/api/errors.html#errors_err_http2_out_of_streams
	**/
	public static var ERR_HTTP2_OUT_OF_STREAMS(get, never):Error;

	private static inline function get_ERR_HTTP2_OUT_OF_STREAMS():Error
		return js.Syntax.code("ERR_HTTP2_OUT_OF_STREAMS");

	/**
		A message payload was specified for an HTTP response code for which a payload is forbidden.

		@see https://nodejs.org/api/errors.html#errors_err_http2_payload_forbidden
	**/
	public static var ERR_HTTP2_PAYLOAD_FORBIDDEN(get, never):Error;

	private static inline function get_ERR_HTTP2_PAYLOAD_FORBIDDEN():Error
		return js.Syntax.code("ERR_HTTP2_PAYLOAD_FORBIDDEN");

	/**
		An HTTP/2 ping was canceled.

		@see https://nodejs.org/api/errors.html#errors_err_http2_ping_cancel
	**/
	public static var ERR_HTTP2_PING_CANCEL(get, never):Error;

	private static inline function get_ERR_HTTP2_PING_CANCEL():Error
		return js.Syntax.code("ERR_HTTP2_PING_CANCEL");

	/**
		HTTP/2 ping payloads must be exactly 8 bytes in length.

		@see https://nodejs.org/api/errors.html#errors_err_http2_ping_length
	**/
	public static var ERR_HTTP2_PING_LENGTH(get, never):Error;

	private static inline function get_ERR_HTTP2_PING_LENGTH():Error
		return js.Syntax.code("ERR_HTTP2_PING_LENGTH");

	/**
		An HTTP/2 pseudo-header has been used inappropriately.
		Pseudo-headers are header key names that begin with the `:` prefix.

		@see https://nodejs.org/api/errors.html#errors_err_http2_pseudoheader_not_allowed
	**/
	public static var ERR_HTTP2_PSEUDOHEADER_NOT_ALLOWED(get, never):Error;

	private static inline function get_ERR_HTTP2_PSEUDOHEADER_NOT_ALLOWED():Error
		return js.Syntax.code("ERR_HTTP2_PSEUDOHEADER_NOT_ALLOWED");

	/**
		An attempt was made to create a push stream, which had been disabled by the client.

		@see https://nodejs.org/api/errors.html#errors_err_http2_push_disabled
	**/
	public static var ERR_HTTP2_PUSH_DISABLED(get, never):Error;

	private static inline function get_ERR_HTTP2_PUSH_DISABLED():Error
		return js.Syntax.code("ERR_HTTP2_PUSH_DISABLED");

	/**
		An attempt was made to use the `Http2Stream.responseWithFile()` API to send a directory.

		@see https://nodejs.org/api/errors.html#errors_err_http2_send_file
	**/
	public static var ERR_HTTP2_SEND_FILE(get, never):Error;

	private static inline function get_ERR_HTTP2_SEND_FILE():Error
		return js.Syntax.code("ERR_HTTP2_SEND_FILE");

	/**
		An attempt was made to use the `Http2Stream.responseWithFile()` API
		to send something other than a regular file, but offset or length options were provided.

		@see https://nodejs.org/api/errors.html#errors_err_http2_send_file_noseek
	**/
	public static var ERR_HTTP2_SEND_FILE_NOSEEK(get, never):Error;

	private static inline function get_ERR_HTTP2_SEND_FILE_NOSEEK():Error
		return js.Syntax.code("ERR_HTTP2_SEND_FILE_NOSEEK");

	/**
		The `Http2Session` closed with a non-zero error code.

		@see https://nodejs.org/api/errors.html#errors_err_http2_session_error
	**/
	public static var ERR_HTTP2_SESSION_ERROR(get, never):Error;

	private static inline function get_ERR_HTTP2_SESSION_ERROR():Error
		return js.Syntax.code("ERR_HTTP2_SESSION_ERROR");

	/**
		The `Http2Session` settings canceled.

		@see https://nodejs.org/api/errors.html#errors_err_http2_settings_cancel
	**/
	public static var ERR_HTTP2_SETTINGS_CANCEL(get, never):Error;

	private static inline function get_ERR_HTTP2_SETTINGS_CANCEL():Error
		return js.Syntax.code("ERR_HTTP2_SETTINGS_CANCEL");

	/**
		An attempt was made to connect a `Http2Session` object to a `net.Socket` or `tls.TLSSocket`
		that had already been bound to another `Http2Session` object.

		@see https://nodejs.org/api/errors.html#errors_err_http2_socket_bound
	**/
	public static var ERR_HTTP2_SOCKET_BOUND(get, never):Error;

	private static inline function get_ERR_HTTP2_SOCKET_BOUND():Error
		return js.Syntax.code("ERR_HTTP2_SOCKET_BOUND");

	/**
		An attempt was made to use the `socket` property of an `Http2Session` that has already been closed.

		@see https://nodejs.org/api/errors.html#errors_err_http2_socket_unbound
	**/
	public static var ERR_HTTP2_SOCKET_UNBOUND(get, never):Error;

	private static inline function get_ERR_HTTP2_SOCKET_UNBOUND():Error
		return js.Syntax.code("ERR_HTTP2_SOCKET_UNBOUND");

	/**
		Use of the `101` Informational status code is forbidden in HTTP/2.

		@see https://nodejs.org/api/errors.html#errors_err_http2_status_101
	**/
	public static var ERR_HTTP2_STATUS_101(get, never):Error;

	private static inline function get_ERR_HTTP2_STATUS_101():Error
		return js.Syntax.code("ERR_HTTP2_STATUS_101");

	/**
		An invalid HTTP status code has been specified.
		Status codes must be an integer between `100` and `599` (inclusive).

		@see https://nodejs.org/api/errors.html#errors_err_http2_status_invalid
	**/
	public static var ERR_HTTP2_STATUS_INVALID(get, never):Error;

	private static inline function get_ERR_HTTP2_STATUS_INVALID():Error
		return js.Syntax.code("ERR_HTTP2_STATUS_INVALID");

	/**
		An `Http2Stream` was destroyed before any data was transmitted to the connected peer.

		@see https://nodejs.org/api/errors.html#errors_err_http2_stream_cancel
	**/
	public static var ERR_HTTP2_STREAM_CANCEL(get, never):Error;

	private static inline function get_ERR_HTTP2_STREAM_CANCEL():Error
		return js.Syntax.code("ERR_HTTP2_STREAM_CANCEL");

	/**
		A non-zero error code was been specified in an `RST_STREAM` frame.

		@see https://nodejs.org/api/errors.html#errors_err_http2_stream_error
	**/
	public static var ERR_HTTP2_STREAM_ERROR(get, never):Error;

	private static inline function get_ERR_HTTP2_STREAM_ERROR():Error
		return js.Syntax.code("ERR_HTTP2_STREAM_ERROR");

	/**
		When setting the priority for an HTTP/2 stream,
		the stream may be marked as a dependency for a parent stream.
		This error code is used when an attempt is made to mark a stream and dependent of itself.

		@see https://nodejs.org/api/errors.html#errors_err_http2_stream_self_dependency
	**/
	public static var ERR_HTTP2_STREAM_SELF_DEPENDENCY(get, never):Error;

	private static inline function get_ERR_HTTP2_STREAM_SELF_DEPENDENCY():Error
		return js.Syntax.code("ERR_HTTP2_STREAM_SELF_DEPENDENCY");

	/**
		Trailing headers have already been sent on the `Http2Stream`.

		@see https://nodejs.org/api/errors.html#errors_err_http2_trailers_already_sent
	**/
	public static var ERR_HTTP2_TRAILERS_ALREADY_SENT(get, never):Error;

	private static inline function get_ERR_HTTP2_TRAILERS_ALREADY_SENT():Error
		return js.Syntax.code("ERR_HTTP2_TRAILERS_ALREADY_SENT");

	/**
		The `http2stream.sendTrailers()` method cannot be called
		until after the `'wantTrailers'` event is emitted on an `Http2Stream` object.
		The `'wantTrailers'` event will only be emitted
		if the `waitForTrailers` option is set for the `Http2Stream`.

		@see https://nodejs.org/api/errors.html#errors_err_http2_trailers_not_ready
	**/
	public static var ERR_HTTP2_TRAILERS_NOT_READY(get, never):Error;

	private static inline function get_ERR_HTTP2_TRAILERS_NOT_READY():Error
		return js.Syntax.code("ERR_HTTP2_TRAILERS_NOT_READY");

	/**
		`http2.connect()` was passed a URL that uses any protocol other than `http:` or `https:`.

		@see https://nodejs.org/api/errors.html#errors_err_http2_unsupported_protocol
	**/
	public static var ERR_HTTP2_UNSUPPORTED_PROTOCOL(get, never):Error;

	private static inline function get_ERR_HTTP2_UNSUPPORTED_PROTOCOL():Error
		return js.Syntax.code("ERR_HTTP2_UNSUPPORTED_PROTOCOL");

	/**
		There was a bug in Node.js or incorrect usage of Node.js internals.
		To fix the error, open an issue at `https://github.com/nodejs/node/issues`.

		@see https://nodejs.org/api/errors.html#errors_err_internal_assertion
	**/
	public static var ERR_INTERNAL_ASSERTION(get, never):Error;

	private static inline function get_ERR_INTERNAL_ASSERTION():Error
		return js.Syntax.code("ERR_INTERNAL_ASSERTION");

	/**
		An option pair is incompatible with each other and can not be used at the same time.

		@see https://nodejs.org/api/errors.html#errors_err_incompatible_option_pair
	**/
	public static var ERR_INCOMPATIBLE_OPTION_PAIR(get, never):Error;

	private static inline function get_ERR_INCOMPATIBLE_OPTION_PAIR():Error
		return js.Syntax.code("ERR_INCOMPATIBLE_OPTION_PAIR");

	/**
		The `--input-type` flag was used to attempt to execute a file.
		This flag can only be used with input via `--eval`, `--print` or `STDIN`.

		@see https://nodejs.org/api/errors.html#errors_err_input_type_not_allowed
	**/
	public static var ERR_INPUT_TYPE_NOT_ALLOWED(get, never):Error;

	private static inline function get_ERR_INPUT_TYPE_NOT_ALLOWED():Error
		return js.Syntax.code("ERR_INPUT_TYPE_NOT_ALLOWED");

	/**
		While using the `inspector` module,
		an attempt was made to connect when the inspector was already connected.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_already_connected
	**/
	public static var ERR_INSPECTOR_ALREADY_CONNECTED(get, never):Error;

	private static inline function get_ERR_INSPECTOR_ALREADY_CONNECTED():Error
		return js.Syntax.code("ERR_INSPECTOR_ALREADY_CONNECTED");

	/**
		While using the `inspector` module,
		an attempt was made to use the inspector after the session had already closed.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_closed
	**/
	public static var ERR_INSPECTOR_CLOSED(get, never):Error;

	private static inline function get_ERR_INSPECTOR_CLOSED():Error
		return js.Syntax.code("ERR_INSPECTOR_CLOSED");

	/**
		An error occurred while issuing a command via the `inspector` module.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_command
	**/
	public static var ERR_INSPECTOR_COMMAND(get, never):Error;

	private static inline function get_ERR_INSPECTOR_COMMAND():Error
		return js.Syntax.code("ERR_INSPECTOR_COMMAND");

	/**
		The `inspector` is not active when `inspector.waitForDebugger()` is called.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_not_active
	**/
	public static var ERR_INSPECTOR_NOT_ACTIVE(get, never):Error;

	private static inline function get_ERR_INSPECTOR_NOT_ACTIVE():Error
		return js.Syntax.code("ERR_INSPECTOR_NOT_ACTIVE");

	/**
		The `inspector` module is not available for use.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_not_available
	**/
	public static var ERR_INSPECTOR_NOT_AVAILABLE(get, never):Error;

	private static inline function get_ERR_INSPECTOR_NOT_AVAILABLE():Error
		return js.Syntax.code("ERR_INSPECTOR_NOT_AVAILABLE");

	/**
		While using the `inspector` module,
		an attempt was made to use the inspector before it was connected.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_not_connected
	**/
	public static var ERR_INSPECTOR_NOT_CONNECTED(get, never):Error;

	private static inline function get_ERR_INSPECTOR_NOT_CONNECTED():Error
		return js.Syntax.code("ERR_INSPECTOR_NOT_CONNECTED");

	/**
		An API was called on the main thread that can only be used from the worker thread.

		@see https://nodejs.org/api/errors.html#errors_err_inspector_not_worker
	**/
	public static var ERR_INSPECTOR_NOT_WORKER(get, never):Error;

	private static inline function get_ERR_INSPECTOR_NOT_WORKER():Error
		return js.Syntax.code("ERR_INSPECTOR_NOT_WORKER");

	/**
		The provided address family is not understood by the Node.js API.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_address_family
	**/
	public static var ERR_INVALID_ADDRESS_FAMILY(get, never):Error;

	private static inline function get_ERR_INVALID_ADDRESS_FAMILY():Error
		return js.Syntax.code("ERR_INVALID_ADDRESS_FAMILY");

	/**
		An argument of the wrong type was passed to a Node.js API.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_arg_type
	**/
	public static var ERR_INVALID_ARG_TYPE(get, never):Error;

	private static inline function get_ERR_INVALID_ARG_TYPE():Error
		return js.Syntax.code("ERR_INVALID_ARG_TYPE");

	/**
		An invalid or unsupported value was passed for a given argument.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_arg_value
	**/
	public static var ERR_INVALID_ARG_VALUE(get, never):Error;

	private static inline function get_ERR_INVALID_ARG_VALUE():Error
		return js.Syntax.code("ERR_INVALID_ARG_VALUE");

	/**
		An invalid `asyncId` or `triggerAsyncId` was passed using `AsyncHooks`.
		An id less than -1 should never happen.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_async_id
	**/
	public static var ERR_INVALID_ASYNC_ID(get, never):Error;

	private static inline function get_ERR_INVALID_ASYNC_ID():Error
		return js.Syntax.code("ERR_INVALID_ASYNC_ID");

	/**
		A swap was performed on a `Buffer` but its size was not compatible with the operation.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_buffer_size
	**/
	public static var ERR_INVALID_BUFFER_SIZE(get, never):Error;

	private static inline function get_ERR_INVALID_BUFFER_SIZE():Error
		return js.Syntax.code("ERR_INVALID_BUFFER_SIZE");

	/**
		A callback function was required but was not been provided to a Node.js API.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_callback
	**/
	public static var ERR_INVALID_CALLBACK(get, never):Error;

	private static inline function get_ERR_INVALID_CALLBACK():Error
		return js.Syntax.code("ERR_INVALID_CALLBACK");

	/**
		Invalid characters were detected in headers.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_char
	**/
	public static var ERR_INVALID_CHAR(get, never):Error;

	private static inline function get_ERR_INVALID_CHAR():Error
		return js.Syntax.code("ERR_INVALID_CHAR");

	/**
		A cursor on a given stream cannot be moved to a specified row without a specified column.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_cursor_pos
	**/
	public static var ERR_INVALID_CURSOR_POS(get, never):Error;

	private static inline function get_ERR_INVALID_CURSOR_POS():Error
		return js.Syntax.code("ERR_INVALID_CURSOR_POS");

	/**
		A file descriptor ('fd') was not valid (e.g. it was a negative value).

		@see https://nodejs.org/api/errors.html#errors_err_invalid_fd
	**/
	public static var ERR_INVALID_FD(get, never):Error;

	private static inline function get_ERR_INVALID_FD():Error
		return js.Syntax.code("ERR_INVALID_FD");

	/**
		A file descriptor ('fd') type was not valid.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_fd_type
	**/
	public static var ERR_INVALID_FD_TYPE(get, never):Error;

	private static inline function get_ERR_INVALID_FD_TYPE():Error
		return js.Syntax.code("ERR_INVALID_FD_TYPE");

	/**
		A Node.js API that consumes `file:` URLs (such as certain functions in the fs module)
		encountered a file URL with an incompatible host.
		This situation can only occur on Unix-like systems
		where only `localhost` or an empty host is supported.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_file_url_host
	**/
	public static var ERR_INVALID_FILE_URL_HOST(get, never):Error;

	private static inline function get_ERR_INVALID_FILE_URL_HOST():Error
		return js.Syntax.code("ERR_INVALID_FILE_URL_HOST");

	/**
		A Node.js API that consumes `file:` URLs (such as certain functions in the fs module)
		encountered a file URL with an incompatible path.
		The exact semantics for determining whether a path can be used is platform-dependent.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_file_url_path
	**/
	public static var ERR_INVALID_FILE_URL_PATH(get, never):Error;

	private static inline function get_ERR_INVALID_FILE_URL_PATH():Error
		return js.Syntax.code("ERR_INVALID_FILE_URL_PATH");

	/**
		An attempt was made to send an unsupported "handle" over an IPC communication channel to a child process.
		See `subprocess.send()` and `process.send()` for more information.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_handle_type
	**/
	public static var ERR_INVALID_HANDLE_TYPE(get, never):Error;

	private static inline function get_ERR_INVALID_HANDLE_TYPE():Error
		return js.Syntax.code("ERR_INVALID_HANDLE_TYPE");

	/**
		An invalid HTTP token was supplied.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_http_token
	**/
	public static var ERR_INVALID_HTTP_TOKEN(get, never):Error;

	private static inline function get_ERR_INVALID_HTTP_TOKEN():Error
		return js.Syntax.code("ERR_INVALID_HTTP_TOKEN");

	/**
		An IP address is not valid.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_ip_address
	**/
	public static var ERR_INVALID_IP_ADDRESS(get, never):Error;

	private static inline function get_ERR_INVALID_IP_ADDRESS():Error
		return js.Syntax.code("ERR_INVALID_IP_ADDRESS");

	/**
		An invalid or unexpected value was passed in an options object.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_opt_value
	**/
	public static var ERR_INVALID_OPT_VALUE(get, never):Error;

	private static inline function get_ERR_INVALID_OPT_VALUE():Error
		return js.Syntax.code("ERR_INVALID_OPT_VALUE");

	/**
		An invalid or unknown file encoding was passed.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_opt_value_encoding
	**/
	public static var ERR_INVALID_OPT_VALUE_ENCODING(get, never):Error;

	private static inline function get_ERR_INVALID_OPT_VALUE_ENCODING():Error
		return js.Syntax.code("ERR_INVALID_OPT_VALUE_ENCODING");

	/**
		An invalid `package.json` file was found which failed parsing.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_package_config
	**/
	public static var ERR_INVALID_PACKAGE_CONFIG(get, never):Error;

	private static inline function get_ERR_INVALID_PACKAGE_CONFIG():Error
		return js.Syntax.code("ERR_INVALID_PACKAGE_CONFIG");

	/**
		While using the Performance Timing API (`perf_hooks`), a performance mark is invalid.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_performance_mark
	**/
	public static var ERR_INVALID_PERFORMANCE_MARK(get, never):Error;

	private static inline function get_ERR_INVALID_PERFORMANCE_MARK():Error
		return js.Syntax.code("ERR_INVALID_PERFORMANCE_MARK");

	/**
		An invalid `options.protocol` was passed to `http.request()`.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_protocol
	**/
	public static var ERR_INVALID_PROTOCOL(get, never):Error;

	private static inline function get_ERR_INVALID_PROTOCOL():Error
		return js.Syntax.code("ERR_INVALID_PROTOCOL");

	/**
		Both `breakEvalOnSigint` and `eval` options were set in the `REPL` config,
		which is not supported.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_repl_eval_config
	**/
	public static var ERR_INVALID_REPL_EVAL_CONFIG(get, never):Error;

	private static inline function get_ERR_INVALID_REPL_EVAL_CONFIG():Error
		return js.Syntax.code("ERR_INVALID_REPL_EVAL_CONFIG");

	/**
		The input may not be used in the `REPL`.
		All prohibited inputs are documented in the `REPL`'s documentation.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_repl_input
	**/
	public static var ERR_INVALID_REPL_INPUT(get, never):Error;

	private static inline function get_ERR_INVALID_REPL_INPUT():Error
		return js.Syntax.code("ERR_INVALID_REPL_INPUT");

	/**
		Thrown in case a function option does not provide a valid value
		for one of its returned object properties on execution.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_return_property
	**/
	public static var ERR_INVALID_RETURN_PROPERTY(get, never):Error;

	private static inline function get_ERR_INVALID_RETURN_PROPERTY():Error
		return js.Syntax.code("ERR_INVALID_RETURN_PROPERTY");

	/**
		Thrown in case a function option does not provide an expected value type
		for one of its returned object properties on execution.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_return_property_value
	**/
	public static var ERR_INVALID_RETURN_PROPERTY_VALUE(get, never):Error;

	private static inline function get_ERR_INVALID_RETURN_PROPERTY_VALUE():Error
		return js.Syntax.code("ERR_INVALID_RETURN_PROPERTY_VALUE");

	/**
		Thrown in case a function option does not return an expected value type on execution,
		such as when a function is expected to return a promise.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_return_value
	**/
	public static var ERR_INVALID_RETURN_VALUE(get, never):Error;

	private static inline function get_ERR_INVALID_RETURN_VALUE():Error
		return js.Syntax.code("ERR_INVALID_RETURN_VALUE");

	/**
		A `Buffer`, `ArrayBufferView` or `String` was provided as stdio input to an asynchronous fork.
		See the documentation for the `child_process` module for more information.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_sync_fork_input
	**/
	public static var ERR_INVALID_SYNC_FORK_INPUT(get, never):Error;

	private static inline function get_ERR_INVALID_SYNC_FORK_INPUT():Error
		return js.Syntax.code("ERR_INVALID_SYNC_FORK_INPUT");

	/**
		A Node.js API function was called with an incompatible `this` value.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_this
	**/
	public static var ERR_INVALID_THIS(get, never):Error;

	private static inline function get_ERR_INVALID_THIS():Error
		return js.Syntax.code("ERR_INVALID_THIS");

	/**
		An invalid transfer object was passed to `postMessage()`.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_transfer_object
	**/
	public static var ERR_INVALID_TRANSFER_OBJECT(get, never):Error;

	private static inline function get_ERR_INVALID_TRANSFER_OBJECT():Error
		return js.Syntax.code("ERR_INVALID_TRANSFER_OBJECT");

	/**
		An element in the `iterable` provided to the `WHATWG` `URLSearchParams constructor`
		did not represent a `[name, value]` tuple – that is, if an element is not iterable,
		or does not consist of exactly two elements.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_tuple
	**/
	public static var ERR_INVALID_TUPLE(get, never):Error;

	private static inline function get_ERR_INVALID_TUPLE():Error
		return js.Syntax.code("ERR_INVALID_TUPLE");

	/**
		An invalid URI was passed.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_uri
	**/
	public static var ERR_INVALID_URI(get, never):Error;

	private static inline function get_ERR_INVALID_URI():Error
		return js.Syntax.code("ERR_INVALID_URI");

	/**
		An invalid URL was passed to the `WHATWG` `URL constructor` to be parsed.
		The thrown error object typically has an additional property `'input'`
		that contains the URL that failed to parse.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_url
	**/
	public static var ERR_INVALID_URL(get, never):Error;

	private static inline function get_ERR_INVALID_URL():Error
		return js.Syntax.code("ERR_INVALID_URL");

	/**
		An attempt was made to use a URL of an incompatible scheme (protocol) for a specific purpose.
		It is only used in the `WHATWG URL API` support
		in the `fs` module (which only accepts URLs with `'file'` scheme),
		but may be used in other Node.js APIs as well in the future.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_url_scheme
	**/
	public static var ERR_INVALID_URL_SCHEME(get, never):Error;

	private static inline function get_ERR_INVALID_URL_SCHEME():Error
		return js.Syntax.code("ERR_INVALID_URL_SCHEME");

	/**
		An attempt was made to use an IPC communication channel that was already closed.

		@see https://nodejs.org/api/errors.html#errors_err_ipc_channel_closed
	**/
	public static var ERR_IPC_CHANNEL_CLOSED(get, never):Error;

	private static inline function get_ERR_IPC_CHANNEL_CLOSED():Error
		return js.Syntax.code("ERR_IPC_CHANNEL_CLOSED");

	/**
		An attempt was made to disconnect an IPC communication channel that was already disconnected.
		See the documentation for the `child_process` module for more information.

		@see https://nodejs.org/api/errors.html#errors_err_ipc_disconnected
	**/
	public static var ERR_IPC_DISCONNECTED(get, never):Error;

	private static inline function get_ERR_IPC_DISCONNECTED():Error
		return js.Syntax.code("ERR_IPC_DISCONNECTED");

	/**
		An attempt was made to create a child Node.js process using more than one IPC communication channel.
		See the documentation for the `child_process` module for more information.

		@see https://nodejs.org/api/errors.html#errors_err_ipc_one_pipe
	**/
	public static var ERR_IPC_ONE_PIPE(get, never):Error;

	private static inline function get_ERR_IPC_ONE_PIPE():Error
		return js.Syntax.code("ERR_IPC_ONE_PIPE");

	/**
		An attempt was made to open an IPC communication channel with a synchronously forked Node.js process.
		See the documentation for the `child_process` module for more information.

		@see https://nodejs.org/api/errors.html#errors_err_ipc_sync_fork
	**/
	public static var ERR_IPC_SYNC_FORK(get, never):Error;

	private static inline function get_ERR_IPC_SYNC_FORK():Error
		return js.Syntax.code("ERR_IPC_SYNC_FORK");

	/**
		An attempt was made to load a resource,
		but the resource did not match the integrity defined by the policy manifest.
		See the documentation for policy manifests for more information.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_assert_integrity
	**/
	public static var ERR_MANIFEST_ASSERT_INTEGRITY(get, never):Error;

	private static inline function get_ERR_MANIFEST_ASSERT_INTEGRITY():Error
		return js.Syntax.code("ERR_MANIFEST_ASSERT_INTEGRITY");

	/**
		An attempt was made to load a resource,
		but the resource was not listed as a dependency from the location that attempted to load it.
		See the documentation for policy manifests for more information.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_dependency_missing
	**/
	public static var ERR_MANIFEST_DEPENDENCY_MISSING(get, never):Error;

	private static inline function get_ERR_MANIFEST_DEPENDENCY_MISSING():Error
		return js.Syntax.code("ERR_MANIFEST_DEPENDENCY_MISSING");

	/**
		An attempt was made to load a policy manifest,
		but the manifest had multiple entries for a resource which did not match each other.
		Update the manifest entries to match in order to resolve this error.
		See the documentation for policy manifests for more information.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_integrity_mismatch
	**/
	public static var ERR_MANIFEST_INTEGRITY_MISMATCH(get, never):Error;

	private static inline function get_ERR_MANIFEST_INTEGRITY_MISMATCH():Error
		return js.Syntax.code("ERR_MANIFEST_INTEGRITY_MISMATCH");

	/**
		A policy manifest resource had an invalid value for one of its fields.
		Update the manifest entry to match in order to resolve this error.
		See the documentation for policy manifests for more information.
	**/
	public static var ERR_MANIFEST_INVALID_RESOURCE_FIELD(get, never):Error;

	private static inline function get_ERR_MANIFEST_INVALID_RESOURCE_FIELD():Error
		return js.Syntax.code("ERR_MANIFEST_INVALID_RESOURCE_FIELD");

	/**
		An attempt was made to load a policy manifest, but the manifest was unable to be parsed.
		See the documentation for policy manifests for more information.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_parse_policy
	**/
	public static var ERR_MANIFEST_PARSE_POLICY(get, never):Error;

	private static inline function get_ERR_MANIFEST_PARSE_POLICY():Error
		return js.Syntax.code("ERR_MANIFEST_PARSE_POLICY");

	/**
		An attempt was made to read from a policy manifest,
		but the manifest initialization has not yet taken place.
		This is likely a bug in Node.js.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_tdz
	**/
	public static var ERR_MANIFEST_TDZ(get, never):Error;

	private static inline function get_ERR_MANIFEST_TDZ():Error
		return js.Syntax.code("ERR_MANIFEST_TDZ");

	/**
		A policy manifest was loaded, but had an unknown value for its "onerror" behavior.
		See the documentation for policy manifests for more information.

		@see https://nodejs.org/api/errors.html#errors_err_manifest_unknown_onerror
	**/
	public static var ERR_MANIFEST_UNKNOWN_ONERROR(get, never):Error;

	private static inline function get_ERR_MANIFEST_UNKNOWN_ONERROR():Error
		return js.Syntax.code("ERR_MANIFEST_UNKNOWN_ONERROR");

	/**
		An attempt was made to allocate memory (usually in the C++ layer) but it failed

		@see https://nodejs.org/api/errors.html#errors_err_memory_allocation_failed
	**/
	public static var ERR_MEMORY_ALLOCATION_FAILED(get, never):Error;

	private static inline function get_ERR_MEMORY_ALLOCATION_FAILED():Error
		return js.Syntax.code("ERR_MEMORY_ALLOCATION_FAILED");

	/**
		A method is required but not implemented.

		@see https://nodejs.org/api/errors.html#errors_err_method_not_implemented
	**/
	public static var ERR_METHOD_NOT_IMPLEMENTED(get, never):Error;

	private static inline function get_ERR_METHOD_NOT_IMPLEMENTED():Error
		return js.Syntax.code("ERR_METHOD_NOT_IMPLEMENTED");

	/**
		A required argument of a Node.js API was not passed.
		This is only used for strict compliance with the API specification
		(which in some cases may accept `func(undefined)` but not `func()`).
		In most native Node.js APIs, `func(undefined)` and `func()` are treated identically,
		and the `ERR_INVALID_ARG_TYPE` error code may be used instead.

		@see https://nodejs.org/api/errors.html#errors_err_missing_args
	**/
	public static var ERR_MISSING_ARGS(get, never):Error;

	private static inline function get_ERR_MISSING_ARGS():Error
		return js.Syntax.code("ERR_MISSING_ARGS");

	/**
		An `ES Module` loader hook specified `format: 'dynamic'` but did not provide a `dynamicInstantiate` hook.

		@see https://nodejs.org/api/errors.html#errors_err_missing_dynamic_instantiate_hook
	**/
	public static var ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK(get, never):Error;

	private static inline function get_ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK():Error
		return js.Syntax.code("ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK");

	/**
		An attempt was made to read an encrypted key without specifying a passphrase.

		@see https://nodejs.org/api/errors.html#errors_err_missing_passphrase
	**/
	public static var ERR_MISSING_PASSPHRASE(get, never):Error;

	private static inline function get_ERR_MISSING_PASSPHRASE():Error
		return js.Syntax.code("ERR_MISSING_PASSPHRASE");

	/**
		The V8 platform used by this instance of Node.js does not support creating Workers.
		This is caused by lack of embedder support for Workers.
		In particular, this error will not occur with standard builds of Node.js.

		@see https://nodejs.org/api/errors.html#errors_err_missing_platform_for_worker
	**/
	public static var ERR_MISSING_PLATFORM_FOR_WORKER(get, never):Error;

	private static inline function get_ERR_MISSING_PLATFORM_FOR_WORKER():Error
		return js.Syntax.code("ERR_MISSING_PLATFORM_FOR_WORKER");

	/**
		An `ES Module` could not be resolved.

		@see https://nodejs.org/api/errors.html#errors_err_module_not_found
	**/
	public static var ERR_MODULE_NOT_FOUND(get, never):Error;

	private static inline function get_ERR_MODULE_NOT_FOUND():Error
		return js.Syntax.code("ERR_MODULE_NOT_FOUND");

	/**
		A callback was called more than once.

		@see https://nodejs.org/api/errors.html#errors_err_multiple_callback
	**/
	public static var ERR_MULTIPLE_CALLBACK(get, never):Error;

	private static inline function get_ERR_MULTIPLE_CALLBACK():Error
		return js.Syntax.code("ERR_MULTIPLE_CALLBACK");

	/**
		While using `N-API`, a constructor passed was not a function.

		@see https://nodejs.org/api/errors.html#errors_err_napi_cons_function
	**/
	public static var ERR_NAPI_CONS_FUNCTION(get, never):Error;

	private static inline function get_ERR_NAPI_CONS_FUNCTION():Error
		return js.Syntax.code("ERR_NAPI_CONS_FUNCTION");

	/**
		While calling `napi_create_dataview()`,
		a given `offset` was outside the bounds of the dataview or `offset + length` was larger than
		a length of given `buffer`.

		@see https://nodejs.org/api/errors.html#errors_err_napi_invalid_dataview_args
	**/
	public static var ERR_NAPI_INVALID_DATAVIEW_ARGS(get, never):Error;

	private static inline function get_ERR_NAPI_INVALID_DATAVIEW_ARGS():Error
		return js.Syntax.code("ERR_NAPI_INVALID_DATAVIEW_ARGS");

	/**
		While calling `napi_create_typedarray()`,
		the provided offset was not a multiple of the element size.

		@see https://nodejs.org/api/errors.html#errors_err_napi_invalid_typedarray_alignment
	**/
	public static var ERR_NAPI_INVALID_TYPEDARRAY_ALIGNMENT(get, never):Error;

	private static inline function get_ERR_NAPI_INVALID_TYPEDARRAY_ALIGNMENT():Error
		return js.Syntax.code("ERR_NAPI_INVALID_TYPEDARRAY_ALIGNMENT");

	/**
		While calling `napi_create_typedarray()`,
		`(length * size_of_element) + byte_offset` was larger than the length of given `buffer`.

		@see https://nodejs.org/api/errors.html#errors_err_napi_invalid_typedarray_length
	**/
	public static var ERR_NAPI_INVALID_TYPEDARRAY_LENGTH(get, never):Error;

	private static inline function get_ERR_NAPI_INVALID_TYPEDARRAY_LENGTH():Error
		return js.Syntax.code("ERR_NAPI_INVALID_TYPEDARRAY_LENGTH");

	/**
		An error occurred while invoking the JavaScript portion of the thread-safe function.

		@see https://nodejs.org/api/errors.html#errors_err_napi_tsfn_call_js
	**/
	public static var ERR_NAPI_TSFN_CALL_JS(get, never):Error;

	private static inline function get_ERR_NAPI_TSFN_CALL_JS():Error
		return js.Syntax.code("ERR_NAPI_TSFN_CALL_JS");

	/**
		An error occurred while attempting to retrieve the JavaScript `undefined` value.

		@see https://nodejs.org/api/errors.html#errors_err_napi_tsfn_get_undefined
	**/
	public static var ERR_NAPI_TSFN_GET_UNDEFINED(get, never):Error;

	private static inline function get_ERR_NAPI_TSFN_GET_UNDEFINED():Error
		return js.Syntax.code("ERR_NAPI_TSFN_GET_UNDEFINED");

	/**
		On the main thread,
		values are removed from the queue associated with the thread-safe function in an idle loop.
		This error indicates that an error has occurred when attempting to start the loop.

		@see https://nodejs.org/api/errors.html#errors_err_napi_tsfn_start_idle_loop
	**/
	public static var ERR_NAPI_TSFN_START_IDLE_LOOP(get, never):Error;

	private static inline function get_ERR_NAPI_TSFN_START_IDLE_LOOP():Error
		return js.Syntax.code("ERR_NAPI_TSFN_START_IDLE_LOOP");

	/**
		Once no more items are left in the queue, the idle loop must be suspended.
		This error indicates that the idle loop has failed to stop.

		@see https://nodejs.org/api/errors.html#errors_err_napi_tsfn_stop_idle_loop
	**/
	public static var ERR_NAPI_TSFN_STOP_IDLE_LOOP(get, never):Error;

	private static inline function get_ERR_NAPI_TSFN_STOP_IDLE_LOOP():Error
		return js.Syntax.code("ERR_NAPI_TSFN_STOP_IDLE_LOOP");

	/**
		An attempt was made to use crypto features
		while Node.js was not compiled with OpenSSL crypto support.

		@see https://nodejs.org/api/errors.html#errors_err_no_crypto
	**/
	public static var ERR_NO_CRYPTO(get, never):Error;

	private static inline function get_ERR_NO_CRYPTO():Error
		return js.Syntax.code("ERR_NO_CRYPTO");

	/**
		An attempt was made to use features that require `ICU`,
		but Node.js was not compiled with ICU support.

		@see https://nodejs.org/api/errors.html#errors_err_no_icu
	**/
	public static var ERR_NO_ICU(get, never):Error;

	private static inline function get_ERR_NO_ICU():Error
		return js.Syntax.code("ERR_NO_ICU");

	/**
		A non-context-aware native addon was loaded in a process that disallows them.

		@see https://nodejs.org/api/errors.html#errors_err_non_context_aware_disabled
	**/
	public static var ERR_NON_CONTEXT_AWARE_DISABLED(get, never):Error;

	private static inline function get_ERR_NON_CONTEXT_AWARE_DISABLED():Error
		return js.Syntax.code("ERR_NON_CONTEXT_AWARE_DISABLED");

	/**
		A given value is out of the accepted range.

		@see https://nodejs.org/api/errors.html#errors_err_out_of_range
	**/
	public static var ERR_OUT_OF_RANGE(get, never):Error;

	private static inline function get_ERR_OUT_OF_RANGE():Error
		return js.Syntax.code("ERR_OUT_OF_RANGE");

	/**
		An attempt was made to `require()` an `ES Module`.

		@see https://nodejs.org/api/errors.html#errors_err_require_esm
	**/
	public static var ERR_REQUIRE_ESM(get, never):Error;

	private static inline function get_ERR_REQUIRE_ESM():Error
		return js.Syntax.code("ERR_REQUIRE_ESM");

	/**
		Script execution was interrupted by `SIGINT` (For example, when Ctrl+C was pressed).

		@see https://nodejs.org/api/errors.html#errors_err_script_execution_interrupted
	**/
	public static var ERR_SCRIPT_EXECUTION_INTERRUPTED(get, never):Error;

	private static inline function get_ERR_SCRIPT_EXECUTION_INTERRUPTED():Error
		return js.Syntax.code("ERR_SCRIPT_EXECUTION_INTERRUPTED");

	/**
		Script execution timed out, possibly due to bugs in the script being executed.

		@see https://nodejs.org/api/errors.html#errors_err_script_execution_timeout
	**/
	public static var ERR_SCRIPT_EXECUTION_TIMEOUT(get, never):Error;

	private static inline function get_ERR_SCRIPT_EXECUTION_TIMEOUT():Error
		return js.Syntax.code("ERR_SCRIPT_EXECUTION_TIMEOUT");

	/**
		The `server.listen()` method was called while a `net.Server` was already listening.
		This applies to all instances of `net.Server`, including HTTP, HTTPS, and HTTP/2 `Server` instances.

		@see https://nodejs.org/api/errors.html#errors_err_server_already_listen
	**/
	public static var ERR_SERVER_ALREADY_LISTEN(get, never):Error;

	private static inline function get_ERR_SERVER_ALREADY_LISTEN():Error
		return js.Syntax.code("ERR_SERVER_ALREADY_LISTEN");

	/**
		The `server.close()` method was called when a `net.Server` was not running.
		This applies to all instances of `net.Server`, including HTTP, HTTPS, and HTTP/2 `Server` instances.

		@see https://nodejs.org/api/errors.html#errors_err_server_not_running
	**/
	public static var ERR_SERVER_NOT_RUNNING(get, never):Error;

	private static inline function get_ERR_SERVER_NOT_RUNNING():Error
		return js.Syntax.code("ERR_SERVER_NOT_RUNNING");

	/**
		An attempt was made to bind a socket that has already been bound.

		@see https://nodejs.org/api/errors.html#errors_err_socket_already_bound
	**/
	public static var ERR_SOCKET_ALREADY_BOUND(get, never):Error;

	private static inline function get_ERR_SOCKET_ALREADY_BOUND():Error
		return js.Syntax.code("ERR_SOCKET_ALREADY_BOUND");

	/**
		An invalid (negative) size was passed for either
		the `recvBufferSize` or `sendBufferSize` options in `dgram.createSocket()`.

		@see https://nodejs.org/api/errors.html#errors_err_socket_bad_buffer_size
	**/
	public static var ERR_SOCKET_BAD_BUFFER_SIZE(get, never):Error;

	private static inline function get_ERR_SOCKET_BAD_BUFFER_SIZE():Error
		return js.Syntax.code("ERR_SOCKET_BAD_BUFFER_SIZE");

	/**
		An API function expecting a port >= 0 and < 65536 received an invalid value.

		@see https://nodejs.org/api/errors.html#errors_err_socket_bad_port
	**/
	public static var ERR_SOCKET_BAD_PORT(get, never):Error;

	private static inline function get_ERR_SOCKET_BAD_PORT():Error
		return js.Syntax.code("ERR_SOCKET_BAD_PORT");

	/**
		An API function expecting a socket type (`udp4` or `udp6`) received an invalid value.

		@see https://nodejs.org/api/errors.html#errors_err_socket_bad_type
	**/
	public static var ERR_SOCKET_BAD_TYPE(get, never):Error;

	private static inline function get_ERR_SOCKET_BAD_TYPE():Error
		return js.Syntax.code("ERR_SOCKET_BAD_TYPE");

	/**
		While using `dgram.createSocket()`, the size of the receive or send `Buffer` could not be determined.

		@see https://nodejs.org/api/errors.html#errors_err_socket_buffer_size
	**/
	public static var ERR_SOCKET_BUFFER_SIZE(get, never):Error;

	private static inline function get_ERR_SOCKET_BUFFER_SIZE():Error
		return js.Syntax.code("ERR_SOCKET_BUFFER_SIZE");

	/**
		Data could be sent on a socket.

		@see https://nodejs.org/api/errors.html#errors_err_socket_cannot_send
	**/
	public static var ERR_SOCKET_CANNOT_SEND(get, never):Error;

	private static inline function get_ERR_SOCKET_CANNOT_SEND():Error
		return js.Syntax.code("ERR_SOCKET_CANNOT_SEND");

	/**
		An attempt was made to operate on an already closed socket.

		@see https://nodejs.org/api/errors.html#errors_err_socket_closed
	**/
	public static var ERR_SOCKET_CLOSED(get, never):Error;

	private static inline function get_ERR_SOCKET_CLOSED():Error
		return js.Syntax.code("ERR_SOCKET_CLOSED");

	/**
		A `dgram.connect()` call was made on an already connected socket.

		@see https://nodejs.org/api/errors.html#errors_err_socket_dgram_is_connected
	**/
	public static var ERR_SOCKET_DGRAM_IS_CONNECTED(get, never):Error;

	private static inline function get_ERR_SOCKET_DGRAM_IS_CONNECTED():Error
		return js.Syntax.code("ERR_SOCKET_DGRAM_IS_CONNECTED");

	/**
		A `dgram.disconnect()` or `dgram.remoteAddress()` call was made on a disconnected socket.

		@see https://nodejs.org/api/errors.html#errors_err_socket_dgram_not_connected
	**/
	public static var ERR_SOCKET_DGRAM_NOT_CONNECTED(get, never):Error;

	private static inline function get_ERR_SOCKET_DGRAM_NOT_CONNECTED():Error
		return js.Syntax.code("ERR_SOCKET_DGRAM_NOT_CONNECTED");

	/**
		A call was made and the UDP subsystem was not running.

		@see https://nodejs.org/api/errors.html#errors_err_socket_dgram_not_running
	**/
	public static var ERR_SOCKET_DGRAM_NOT_RUNNING(get, never):Error;

	private static inline function get_ERR_SOCKET_DGRAM_NOT_RUNNING():Error
		return js.Syntax.code("ERR_SOCKET_DGRAM_NOT_RUNNING");

	/**
		A string was provided for a Subresource Integrity check, but was unable to be parsed.
		Check the format of integrity attributes by looking at the Subresource Integrity specification.

		@see https://nodejs.org/api/errors.html#errors_err_sri_parse
	**/
	public static var ERR_SRI_PARSE(get, never):Error;

	private static inline function get_ERR_SRI_PARSE():Error
		return js.Syntax.code("ERR_SRI_PARSE");

	/**
		An attempt was made to call `stream.pipe()` on a `Writable` stream.

		@see https://nodejs.org/api/errors.html#errors_err_stream_cannot_pipe
	**/
	public static var ERR_STREAM_CANNOT_PIPE(get, never):Error;

	private static inline function get_ERR_STREAM_CANNOT_PIPE():Error
		return js.Syntax.code("ERR_STREAM_CANNOT_PIPE");

	/**
		A stream method was called that cannot complete
		because the stream was destroyed using `stream.destroy()`.

		@see https://nodejs.org/api/errors.html#errors_err_stream_destroyed
	**/
	public static var ERR_STREAM_DESTROYED(get, never):Error;

	private static inline function get_ERR_STREAM_DESTROYED():Error
		return js.Syntax.code("ERR_STREAM_DESTROYED");

	/**
		A stream method was called that cannot complete because the stream was finished.

		@see https://nodejs.org/api/errors.html#errors_err_stream_already_finished
	**/
	public static var ERR_STREAM_ALREADY_FINISHED(get, never):Error;

	private static inline function get_ERR_STREAM_ALREADY_FINISHED():Error
		return js.Syntax.code("ERR_STREAM_ALREADY_FINISHED");

	/**
		An attempt was made to call `stream.write()` with a null chunk.

		@see https://nodejs.org/api/errors.html#errors_err_stream_null_values
	**/
	public static var ERR_STREAM_NULL_VALUES(get, never):Error;

	private static inline function get_ERR_STREAM_NULL_VALUES():Error
		return js.Syntax.code("ERR_STREAM_NULL_VALUES");

	/**
		An error returned by `stream.finished()` and `stream.pipeline()`,
		when a stream or a pipeline ends non gracefully with no explicit error.

		@see https://nodejs.org/api/errors.html#errors_err_stream_premature_close
	**/
	public static var ERR_STREAM_PREMATURE_CLOSE(get, never):Error;

	private static inline function get_ERR_STREAM_PREMATURE_CLOSE():Error
		return js.Syntax.code("ERR_STREAM_PREMATURE_CLOSE");

	/**
		An attempt was made to call `stream.push()` after a `null`(EOF) had been pushed to the stream.

		@see https://nodejs.org/api/errors.html#errors_err_stream_push_after_eof
	**/
	public static var ERR_STREAM_PUSH_AFTER_EOF(get, never):Error;

	private static inline function get_ERR_STREAM_PUSH_AFTER_EOF():Error
		return js.Syntax.code("ERR_STREAM_PUSH_AFTER_EOF");

	/**
		An attempt was made to call `stream.unshift()` after the `'end'` event was emitted.

		@see https://nodejs.org/api/errors.html#errors_err_stream_unshift_after_end_event
	**/
	public static var ERR_STREAM_UNSHIFT_AFTER_END_EVENT(get, never):Error;

	private static inline function get_ERR_STREAM_UNSHIFT_AFTER_END_EVENT():Error
		return js.Syntax.code("ERR_STREAM_UNSHIFT_AFTER_END_EVENT");

	/**
		Prevents an abort if a string decoder was set on the Socket or if the decoder is in `objectMode`.

		@see https://nodejs.org/api/errors.html#errors_err_stream_wrap
	**/
	public static var ERR_STREAM_WRAP(get, never):Error;

	private static inline function get_ERR_STREAM_WRAP():Error
		return js.Syntax.code("ERR_STREAM_WRAP");

	/**
		An attempt was made to call `stream.write()` after `stream.end()` has been called.

		@see https://nodejs.org/api/errors.html#errors_err_stream_write_after_end
	**/
	public static var ERR_STREAM_WRITE_AFTER_END(get, never):Error;

	private static inline function get_ERR_STREAM_WRITE_AFTER_END():Error
		return js.Syntax.code("ERR_STREAM_WRITE_AFTER_END");

	/**
		An attempt has been made to create a string longer than the maximum allowed length.

		@see https://nodejs.org/api/errors.html#errors_err_string_too_long
	**/
	public static var ERR_STRING_TOO_LONG(get, never):Error;

	private static inline function get_ERR_STRING_TOO_LONG():Error
		return js.Syntax.code("ERR_STRING_TOO_LONG");

	/**
		An artificial error object used to capture the call stack for diagnostic reports.

		@see https://nodejs.org/api/errors.html#errors_err_synthetic
	**/
	public static var ERR_SYNTHETIC(get, never):Error;

	private static inline function get_ERR_SYNTHETIC():Error
		return js.Syntax.code("ERR_SYNTHETIC");

	/**
		An unspecified or non-specific system error has occurred within the Node.js process.
		The error object will have an `err.info` object property with additional details.

		@see https://nodejs.org/api/errors.html#errors_err_system_error
	**/
	public static var ERR_SYSTEM_ERROR(get, never):Error;

	private static inline function get_ERR_SYSTEM_ERROR():Error
		return js.Syntax.code("ERR_SYSTEM_ERROR");

	/**
		While using TLS, the host name/IP of the peer did not match any of the `subjectAltNames` in its certificate.

		@see https://nodejs.org/api/errors.html#errors_err_tls_cert_altname_invalid
	**/
	public static var ERR_TLS_CERT_ALTNAME_INVALID(get, never):Error;

	private static inline function get_ERR_TLS_CERT_ALTNAME_INVALID():Error
		return js.Syntax.code("ERR_TLS_CERT_ALTNAME_INVALID");

	/**
		While using TLS, the parameter offered for the Diffie-Hellman (`DH`) key-agreement protocol is too small.
		By default, the key length must be greater than or equal to 1024 bits to avoid vulnerabilities,
		even though it is strongly recommended to use 2048 bits or larger for stronger security.

		@see https://nodejs.org/api/errors.html#errors_err_tls_dh_param_size
	**/
	public static var ERR_TLS_DH_PARAM_SIZE(get, never):Error;

	private static inline function get_ERR_TLS_DH_PARAM_SIZE():Error
		return js.Syntax.code("ERR_TLS_DH_PARAM_SIZE");

	/**
		A TLS/SSL handshake timed out. In this case, the server must also abort the connection.

		@see https://nodejs.org/api/errors.html#errors_err_tls_handshake_timeout
	**/
	public static var ERR_TLS_HANDSHAKE_TIMEOUT(get, never):Error;

	private static inline function get_ERR_TLS_HANDSHAKE_TIMEOUT():Error
		return js.Syntax.code("ERR_TLS_HANDSHAKE_TIMEOUT");

	/**
		The specified `secureProtocol` method is invalid.
		It is either unknown, or disabled because it is insecure.

		@see https://nodejs.org/api/errors.html#errors_err_tls_invalid_protocol_method
	**/
	public static var ERR_TLS_INVALID_PROTOCOL_METHOD(get, never):Error;

	private static inline function get_ERR_TLS_INVALID_PROTOCOL_METHOD():Error
		return js.Syntax.code("ERR_TLS_INVALID_PROTOCOL_METHOD");

	/**
		Valid TLS protocol versions are `'TLSv1'`, `'TLSv1.1'`, or `'TLSv1.2'`.

		@see https://nodejs.org/api/errors.html#errors_err_tls_invalid_protocol_version
	**/
	public static var ERR_TLS_INVALID_PROTOCOL_VERSION(get, never):Error;

	private static inline function get_ERR_TLS_INVALID_PROTOCOL_VERSION():Error
		return js.Syntax.code("ERR_TLS_INVALID_PROTOCOL_VERSION");

	/**
		Attempting to set a TLS protocol `minVersion` or `maxVersion` conflicts
		with an attempt to set the `secureProtocol` explicitly.
		Use one mechanism or the other.

		@see https://nodejs.org/api/errors.html#errors_err_tls_protocol_version_conflict
	**/
	public static var ERR_TLS_PROTOCOL_VERSION_CONFLICT(get, never):Error;

	private static inline function get_ERR_TLS_PROTOCOL_VERSION_CONFLICT():Error
		return js.Syntax.code("ERR_TLS_PROTOCOL_VERSION_CONFLICT");

	/**
		An attempt was made to renegotiate TLS on a socket instance with TLS disabled.

		@see https://nodejs.org/api/errors.html#errors_err_tls_renegotiation_disabled
	**/
	public static var ERR_TLS_RENEGOTIATION_DISABLED(get, never):Error;

	private static inline function get_ERR_TLS_RENEGOTIATION_DISABLED():Error
		return js.Syntax.code("ERR_TLS_RENEGOTIATION_DISABLED");

	/**
		While using TLS,
		the `server.addContext()` method was called without providing a host name in the first parameter.

		@see https://nodejs.org/api/errors.html#errors_err_tls_required_server_name
	**/
	public static var ERR_TLS_REQUIRED_SERVER_NAME(get, never):Error;

	private static inline function get_ERR_TLS_REQUIRED_SERVER_NAME():Error
		return js.Syntax.code("ERR_TLS_REQUIRED_SERVER_NAME");

	/**
		An excessive amount of TLS renegotiations is detected,
		which is a potential vector for denial-of-service attacks.

		@see https://nodejs.org/api/errors.html#errors_err_tls_session_attack
	**/
	public static var ERR_TLS_SESSION_ATTACK(get, never):Error;

	private static inline function get_ERR_TLS_SESSION_ATTACK():Error
		return js.Syntax.code("ERR_TLS_SESSION_ATTACK");

	/**
		An attempt was made to issue Server Name Indication from a TLS server-side socket,
		which is only valid from a client.

		@see https://nodejs.org/api/errors.html#errors_err_tls_sni_from_server
	**/
	public static var ERR_TLS_SNI_FROM_SERVER(get, never):Error;

	private static inline function get_ERR_TLS_SNI_FROM_SERVER():Error
		return js.Syntax.code("ERR_TLS_SNI_FROM_SERVER");

	/**
		Failed to set PSK identity hint. Hint may be too long.

		@see https://nodejs.org/api/errors.html#ERR_TLS_PSK_SET_IDENTIY_HINT_FAILED
	**/
	public static var ERR_TLS_PSK_SET_IDENTIY_HINT_FAILED(get, never):Error;

	private static inline function get_ERR_TLS_PSK_SET_IDENTIY_HINT_FAILED():Error
		return js.Syntax.code("ERR_TLS_PSK_SET_IDENTIY_HINT_FAILED");

	/**
		The `trace_events.createTracing()` method requires at least one trace event category.

		@see https://nodejs.org/api/errors.html#errors_err_trace_events_category_required
	**/
	public static var ERR_TRACE_EVENTS_CATEGORY_REQUIRED(get, never):Error;

	private static inline function get_ERR_TRACE_EVENTS_CATEGORY_REQUIRED():Error
		return js.Syntax.code("ERR_TRACE_EVENTS_CATEGORY_REQUIRED");

	/**
		The `trace_events` module could not be loaded
		because Node.js was compiled with the `--without-v8-platform` flag.

		@see https://nodejs.org/api/errors.html#errors_err_trace_events_unavailable
	**/
	public static var ERR_TRACE_EVENTS_UNAVAILABLE(get, never):Error;

	private static inline function get_ERR_TRACE_EVENTS_UNAVAILABLE():Error
		return js.Syntax.code("ERR_TRACE_EVENTS_UNAVAILABLE");

	/**
		A `SharedArrayBuffer` whose memory is not managed by the JavaScript engine or by Node.js
		was encountered during serialization.
		Such a `SharedArrayBuffer` cannot be serialized.

		@see https://nodejs.org/api/errors.html#errors_err_transferring_externalized_sharedarraybuffer
	**/
	public static var ERR_TRANSFERRING_EXTERNALIZED_SHAREDARRAYBUFFER(get, never):Error;

	private static inline function get_ERR_TRANSFERRING_EXTERNALIZED_SHAREDARRAYBUFFER():Error
		return js.Syntax.code("ERR_TRANSFERRING_EXTERNALIZED_SHAREDARRAYBUFFER");

	/**
		A `Transform` stream finished while it was still transforming.

		@see https://nodejs.org/api/errors.html#errors_err_transform_already_transforming
	**/
	public static var ERR_TRANSFORM_ALREADY_TRANSFORMING(get, never):Error;

	private static inline function get_ERR_TRANSFORM_ALREADY_TRANSFORMING():Error
		return js.Syntax.code("ERR_TRANSFORM_ALREADY_TRANSFORMING");

	/**
		A `Transform` stream finished with data still in the write buffer.

		@see https://nodejs.org/api/errors.html#errors_err_transform_with_length_0
	**/
	public static var ERR_TRANSFORM_WITH_LENGTH_0(get, never):Error;

	private static inline function get_ERR_TRANSFORM_WITH_LENGTH_0():Error
		return js.Syntax.code("ERR_TRANSFORM_WITH_LENGTH_0");

	/**
		The initialization of a TTY failed due to a system error.

		@see https://nodejs.org/api/errors.html#errors_err_tty_init_failed
	**/
	public static var ERR_TTY_INIT_FAILED(get, never):Error;

	private static inline function get_ERR_TTY_INIT_FAILED():Error
		return js.Syntax.code("ERR_TTY_INIT_FAILED");

	/**
		`process.setUncaughtExceptionCaptureCallback()` was called twice,
		without first resetting the callback to `null`.

		@see https://nodejs.org/api/errors.html#errors_err_uncaught_exception_capture_already_set
	**/
	public static var ERR_UNCAUGHT_EXCEPTION_CAPTURE_ALREADY_SET(get, never):Error;

	private static inline function get_ERR_UNCAUGHT_EXCEPTION_CAPTURE_ALREADY_SET():Error
		return js.Syntax.code("ERR_UNCAUGHT_EXCEPTION_CAPTURE_ALREADY_SET");

	/**
		A string that contained unescaped characters was received.

		@see https://nodejs.org/api/errors.html#errors_err_unescaped_characters
	**/
	public static var ERR_UNESCAPED_CHARACTERS(get, never):Error;

	private static inline function get_ERR_UNESCAPED_CHARACTERS():Error
		return js.Syntax.code("ERR_UNESCAPED_CHARACTERS");

	/**
		An unhandled error occurred
		(for instance, when an `'error'` event is emitted by an `EventEmitter` but an `'error'` handler is not registered).

		@see https://nodejs.org/api/errors.html#errors_err_unhandled_error
	**/
	public static var ERR_UNHANDLED_ERROR(get, never):Error;

	private static inline function get_ERR_UNHANDLED_ERROR():Error
		return js.Syntax.code("ERR_UNHANDLED_ERROR");

	/**
		Used to identify a specific kind of internal Node.js error that should not typically be triggered by user code.
		Instances of this error point to an internal bug within the Node.js binary itself.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_builtin_module
	**/
	public static var ERR_UNKNOWN_BUILTIN_MODULE(get, never):Error;

	private static inline function get_ERR_UNKNOWN_BUILTIN_MODULE():Error
		return js.Syntax.code("ERR_UNKNOWN_BUILTIN_MODULE");

	/**
		A Unix group or user identifier that does not exist was passed.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_credential
	**/
	public static var ERR_UNKNOWN_CREDENTIAL(get, never):Error;

	private static inline function get_ERR_UNKNOWN_CREDENTIAL():Error
		return js.Syntax.code("ERR_UNKNOWN_CREDENTIAL");

	/**
		An invalid or unknown encoding option was passed to an API.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_encoding
	**/
	public static var ERR_UNKNOWN_ENCODING(get, never):Error;

	private static inline function get_ERR_UNKNOWN_ENCODING():Error
		return js.Syntax.code("ERR_UNKNOWN_ENCODING");

	/**
		An attempt was made to load a module with an unknown or unsupported file extension.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_file_extension
	**/
	public static var ERR_UNKNOWN_FILE_EXTENSION(get, never):Error;

	private static inline function get_ERR_UNKNOWN_FILE_EXTENSION():Error
		return js.Syntax.code("ERR_UNKNOWN_FILE_EXTENSION");

	/**
		An attempt was made to load a module with an unknown or unsupported format.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_module_format
	**/
	public static var ERR_UNKNOWN_MODULE_FORMAT(get, never):Error;

	private static inline function get_ERR_UNKNOWN_MODULE_FORMAT():Error
		return js.Syntax.code("ERR_UNKNOWN_MODULE_FORMAT");

	/**
		An invalid or unknown process signal was passed to an API expecting a valid signal
		(such as `subprocess.kill()`).

		@see https://nodejs.org/api/errors.html#errors_err_unknown_signal
	**/
	public static var ERR_UNKNOWN_SIGNAL(get, never):Error;

	private static inline function get_ERR_UNKNOWN_SIGNAL():Error
		return js.Syntax.code("ERR_UNKNOWN_SIGNAL");

	/**
		`import` with URL schemes other than `file` and `data` is unsupported.

		@see https://nodejs.org/api/errors.html#errors_err_unsupported_esm_url_scheme
	**/
	public static var ERR_UNSUPPORTED_ESM_URL_SCHEME(get, never):Error;

	private static inline function get_ERR_UNSUPPORTED_ESM_URL_SCHEME():Error
		return js.Syntax.code("ERR_UNSUPPORTED_ESM_URL_SCHEME");

	/**
		The V8 `BreakIterator` API was used but the full ICU data set is not installed.

		@see https://nodejs.org/api/errors.html#errors_err_v8breakiterator
	**/
	public static var ERR_V8BREAKITERATOR(get, never):Error;

	private static inline function get_ERR_V8BREAKITERATOR():Error
		return js.Syntax.code("ERR_V8BREAKITERATOR");

	/**
		While using the Performance Timing API (`perf_hooks`), no valid performance entry types were found.

		@see https://nodejs.org/api/errors.html#errors_err_valid_performance_entry_type
	**/
	public static var ERR_VALID_PERFORMANCE_ENTRY_TYPE(get, never):Error;

	private static inline function get_ERR_VALID_PERFORMANCE_ENTRY_TYPE():Error
		return js.Syntax.code("ERR_VALID_PERFORMANCE_ENTRY_TYPE");

	/**
		A dynamic import callback was not specified.

		@see https://nodejs.org/api/errors.html#errors_err_vm_dynamic_import_callback_missing
	**/
	public static var ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING(get, never):Error;

	private static inline function get_ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING():Error
		return js.Syntax.code("ERR_VM_DYNAMIC_IMPORT_CALLBACK_MISSING");

	/**
		The module attempted to be linked is not eligible for linking.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_already_linked
	**/
	public static var ERR_VM_MODULE_ALREADY_LINKED(get, never):Error;

	private static inline function get_ERR_VM_MODULE_ALREADY_LINKED():Error
		return js.Syntax.code("ERR_VM_MODULE_ALREADY_LINKED");

	/**
		The `cachedData` option passed to a module constructor is invalid.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_cached_data_rejected
	**/
	public static var ERR_VM_MODULE_CACHED_DATA_REJECTED(get, never):Error;

	private static inline function get_ERR_VM_MODULE_CACHED_DATA_REJECTED():Error
		return js.Syntax.code("ERR_VM_MODULE_CACHED_DATA_REJECTED");

	/**
		Cached data cannot be created for modules which have already been evaluated.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_cannot_create_cached_data
	**/
	public static var ERR_VM_MODULE_CANNOT_CREATE_CACHED_DATA(get, never):Error;

	private static inline function get_ERR_VM_MODULE_CANNOT_CREATE_CACHED_DATA():Error
		return js.Syntax.code("ERR_VM_MODULE_CANNOT_CREATE_CACHED_DATA");

	/**
		The module being returned from the linker function is from a different context than the parent module.
		Linked modules must share the same context.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_different_context
	**/
	public static var ERR_VM_MODULE_DIFFERENT_CONTEXT(get, never):Error;

	private static inline function get_ERR_VM_MODULE_DIFFERENT_CONTEXT():Error
		return js.Syntax.code("ERR_VM_MODULE_DIFFERENT_CONTEXT");

	/**
		The linker function returned a module for which linking has failed.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_linking_errored
	**/
	public static var ERR_VM_MODULE_LINKING_ERRORED(get, never):Error;

	private static inline function get_ERR_VM_MODULE_LINKING_ERRORED():Error
		return js.Syntax.code("ERR_VM_MODULE_LINKING_ERRORED");

	/**
		The fulfilled value of a linking promise is not a `vm.Module` object.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_not_module
	**/
	public static var ERR_VM_MODULE_NOT_MODULE(get, never):Error;

	private static inline function get_ERR_VM_MODULE_NOT_MODULE():Error
		return js.Syntax.code("ERR_VM_MODULE_NOT_MODULE");

	/**
		The current module's status does not allow for this operation.
		The specific meaning of the error depends on the specific function.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_status
	**/
	public static var ERR_VM_MODULE_STATUS(get, never):Error;

	private static inline function get_ERR_VM_MODULE_STATUS():Error
		return js.Syntax.code("ERR_VM_MODULE_STATUS");

	/**
		The WASI instance has already started.

		@see https://nodejs.org/api/errors.html#errors_err_wasi_already_started
	**/
	public static var ERR_WASI_ALREADY_STARTED(get, never):Error;

	private static inline function get_ERR_WASI_ALREADY_STARTED():Error
		return js.Syntax.code("ERR_WASI_ALREADY_STARTED");

	/**
		The `execArgv` option passed to the `Worker` constructor contains invalid flags.

		@see https://nodejs.org/api/errors.html#errors_err_worker_invalid_exec_argv
	**/
	public static var ERR_WORKER_INVALID_EXEC_ARGV(get, never):Error;

	private static inline function get_ERR_WORKER_INVALID_EXEC_ARGV():Error
		return js.Syntax.code("ERR_WORKER_INVALID_EXEC_ARGV");

	/**
		The `Worker` instance terminated because it reached its memory limit.

		@see https://nodejs.org/api/errors.html#errors_err_worker_out_of_memory
	**/
	public static var ERR_WORKER_OUT_OF_MEMORY(get, never):Error;

	private static inline function get_ERR_WORKER_OUT_OF_MEMORY():Error
		return js.Syntax.code("ERR_WORKER_OUT_OF_MEMORY");

	/**
		The path for the main script of a worker is neither
		an absolute path nor a relative path starting with `./` or `../`.

		@see https://nodejs.org/api/errors.html#errors_err_worker_path
	**/
	public static var ERR_WORKER_PATH(get, never):Error;

	private static inline function get_ERR_WORKER_PATH():Error
		return js.Syntax.code("ERR_WORKER_PATH");

	/**
		All attempts at serializing an uncaught exception from a worker thread failed.

		@see https://nodejs.org/api/errors.html#errors_err_worker_unserializable_error
	**/
	public static var ERR_WORKER_UNSERIALIZABLE_ERROR(get, never):Error;

	private static inline function get_ERR_WORKER_UNSERIALIZABLE_ERROR():Error
		return js.Syntax.code("ERR_WORKER_UNSERIALIZABLE_ERROR");

	/**
		The pathname used for the main script of a worker has an unknown file extension.

		@see https://nodejs.org/api/errors.html#errors_err_worker_unsupported_extension
	**/
	public static var ERR_WORKER_UNSUPPORTED_EXTENSION(get, never):Error;

	private static inline function get_ERR_WORKER_UNSUPPORTED_EXTENSION():Error
		return js.Syntax.code("ERR_WORKER_UNSUPPORTED_EXTENSION");

	/**
		The requested functionality is not supported in worker threads.

		@see https://nodejs.org/api/errors.html#errors_err_worker_unsupported_operation
	**/
	public static var ERR_WORKER_UNSUPPORTED_OPERATION(get, never):Error;

	private static inline function get_ERR_WORKER_UNSUPPORTED_OPERATION():Error
		return js.Syntax.code("ERR_WORKER_UNSUPPORTED_OPERATION");

	/**
		Creation of a `zlib` object failed due to incorrect configuration.

		@see https://nodejs.org/api/errors.html#errors_err_zlib_initialization_failed
	**/
	public static var ERR_ZLIB_INITIALIZATION_FAILED(get, never):Error;

	private static inline function get_ERR_ZLIB_INITIALIZATION_FAILED():Error
		return js.Syntax.code("ERR_ZLIB_INITIALIZATION_FAILED");

	/**
		Too much HTTP header data was received.
		In order to protect against malicious or malconfigured clients,
		if more than 8KB of HTTP header data is received
		then HTTP parsing will abort without a request or response object being created,
		and an `Error` with this code will be emitted.

		@see https://nodejs.org/api/errors.html#errors_hpe_header_overflow
	**/
	public static var HPE_HEADER_OVERFLOW(get, never):Error;

	private static inline function get_HPE_HEADER_OVERFLOW():Error
		return js.Syntax.code("HPE_HEADER_OVERFLOW");

	/**
		A module file could not be resolved while attempting a `require()` or import operation.

		@see https://nodejs.org/api/errors.html#errors_module_not_found
	**/
	public static var MODULE_NOT_FOUND(get, never):Error;

	private static inline function get_MODULE_NOT_FOUND():Error
		return js.Syntax.code("MODULE_NOT_FOUND");
}

/**
	@see https://nodejs.org/api/errors.html#errors_legacy_node_js_error_codes
**/
@:deprecated
class LegacyErrorCodes {
	/**
		The value passed to `postMessage()` contained an object that is not supported for transferring.

		@see https://nodejs.org/api/errors.html#errors_err_cannot_transfer_object
	**/
	public static var ERR_CANNOT_TRANSFER_OBJECT(get, never):Error;

	private static inline function get_ERR_CANNOT_TRANSFER_OBJECT():Error
		return js.Syntax.code("ERR_CANNOT_TRANSFER_OBJECT");

	/**
		There was an attempt to use a `MessagePort` instance in a closed state,
		usually after `.close()` has been called.

		@see https://nodejs.org/api/errors.html#errors_err_closed_message_port
	**/
	public static var ERR_CLOSED_MESSAGE_PORT(get, never):Error;

	private static inline function get_ERR_CLOSED_MESSAGE_PORT():Error
		return js.Syntax.code("ERR_CLOSED_MESSAGE_PORT");

	/**
		The UTF-16 encoding was used with `hash.digest()`.
		While the `hash.digest()` method does allow an `encoding` argument to be passed in,
		causing the method to return a string rather than a Buffer,
		the UTF-16 encoding (e.g. ucs or utf16le) is not supported.

		@see https://nodejs.org/api/errors.html#errors_err_crypto_hash_digest_no_utf16
	**/
	public static var ERR_CRYPTO_HASH_DIGEST_NO_UTF16(get, never):Error;

	private static inline function get_ERR_CRYPTO_HASH_DIGEST_NO_UTF16():Error
		return js.Syntax.code("ERR_CRYPTO_HASH_DIGEST_NO_UTF16");

	/**
		Used when a failure occurs sending an individual frame on the HTTP/2 session.

		@see https://nodejs.org/api/errors.html#errors_err_http2_frame_error
	**/
	public static var ERR_HTTP2_FRAME_ERROR(get, never):Error;

	private static inline function get_ERR_HTTP2_FRAME_ERROR():Error
		return js.Syntax.code("ERR_HTTP2_FRAME_ERROR");

	/**
		Used when an HTTP/2 Headers Object is expected.

		@see https://nodejs.org/api/errors.html#errors_err_http2_headers_object
	**/
	public static var ERR_HTTP2_HEADERS_OBJECT(get, never):Error;

	private static inline function get_ERR_HTTP2_HEADERS_OBJECT():Error
		return js.Syntax.code("ERR_HTTP2_HEADERS_OBJECT");

	/**
		Used when a required header is missing in an HTTP/2 message.

		@see https://nodejs.org/api/errors.html#errors_err_http2_header_required
	**/
	public static var ERR_HTTP2_HEADER_REQUIRED(get, never):Error;

	private static inline function get_ERR_HTTP2_HEADER_REQUIRED():Error
		return js.Syntax.code("ERR_HTTP2_HEADER_REQUIRED");

	/**
		HTTP/2 informational headers must only be sent prior to calling the `Http2Stream.respond()` method.

		@see https://nodejs.org/api/errors.html#errors_err_http2_info_headers_after_respond
	**/
	public static var ERR_HTTP2_INFO_HEADERS_AFTER_RESPOND(get, never):Error;

	private static inline function get_ERR_HTTP2_INFO_HEADERS_AFTER_RESPOND():Error
		return js.Syntax.code("ERR_HTTP2_INFO_HEADERS_AFTER_RESPOND");

	/**
		Used when an action has been performed on an HTTP/2 Stream that has already been closed.

		@see https://nodejs.org/api/errors.html#errors_err_http2_stream_closed
	**/
	public static var ERR_HTTP2_STREAM_CLOSED(get, never):Error;

	private static inline function get_ERR_HTTP2_STREAM_CLOSED():Error
		return js.Syntax.code("ERR_HTTP2_STREAM_CLOSED");

	/**
		Used when an invalid character is found in an HTTP response status message (reason phrase).

		@see https://nodejs.org/api/errors.html#errors_err_http_invalid_char
	**/
	public static var ERR_HTTP_INVALID_CHAR(get, never):Error;

	private static inline function get_ERR_HTTP_INVALID_CHAR():Error
		return js.Syntax.code("ERR_HTTP_INVALID_CHAR");

	/**
		A given index was out of the accepted range (e.g. negative offsets).

		@see https://nodejs.org/api/errors.html#errors_err_index_out_of_range
	**/
	public static var ERR_INDEX_OUT_OF_RANGE(get, never):Error;

	private static inline function get_ERR_INDEX_OUT_OF_RANGE():Error
		return js.Syntax.code("ERR_INDEX_OUT_OF_RANGE");

	/**
		Used by the N-API when `Constructor.prototype` is not an object.

		@see https://nodejs.org/api/errors.html#errors_err_napi_cons_prototype_object
	**/
	public static var ERR_NAPI_CONS_PROTOTYPE_OBJECT(get, never):Error;

	private static inline function get_ERR_NAPI_CONS_PROTOTYPE_OBJECT():Error
		return js.Syntax.code("ERR_NAPI_CONS_PROTOTYPE_OBJECT");

	/**
		A Node.js API was called in an unsupported manner,
		such as `Buffer.write(string, encoding, offset[, length])`.

		@see https://nodejs.org/api/errors.html#errors_err_no_longer_supported
	**/
	public static var ERR_NO_LONGER_SUPPORTED(get, never):Error;

	private static inline function get_ERR_NO_LONGER_SUPPORTED():Error
		return js.Syntax.code("ERR_NO_LONGER_SUPPORTED");

	/**
		Used generically to identify that an operation caused an out of memory condition.

		@see https://nodejs.org/api/errors.html#errors_err_outofmemory
	**/
	public static var ERR_OUTOFMEMORY(get, never):Error;

	private static inline function get_ERR_OUTOFMEMORY():Error
		return js.Syntax.code("ERR_OUTOFMEMORY");

	/**
		The `repl` module was unable to parse data from the REPL history file.

		@see https://nodejs.org/api/errors.html#errors_err_parse_history_data
	**/
	public static var ERR_PARSE_HISTORY_DATA(get, never):Error;

	private static inline function get_ERR_PARSE_HISTORY_DATA():Error
		return js.Syntax.code("ERR_PARSE_HISTORY_DATA");

	/**
		An attempt was made to close the `process.stderr` stream.
		By design, Node.js does not allow `stdout` or `stderr` streams to be closed by user code.

		@see https://nodejs.org/api/errors.html#errors_err_stderr_close
	**/
	public static var ERR_STDERR_CLOSE(get, never):Error;

	private static inline function get_ERR_STDERR_CLOSE():Error
		return js.Syntax.code("ERR_STDERR_CLOSE");

	/**
		An attempt was made to close the `process.stdout` stream.
		By design, Node.js does not allow `stdout` or `stderr` streams to be closed by user code.

		@see https://nodejs.org/api/errors.html#errors_err_stdout_close
	**/
	public static var ERR_STDOUT_CLOSE(get, never):Error;

	private static inline function get_ERR_STDOUT_CLOSE():Error
		return js.Syntax.code("ERR_STDOUT_CLOSE");

	/**
		Used when an attempt is made to use a readable stream that has not implemented `readable._read()`.

		@see https://nodejs.org/api/errors.html#errors_err_stream_read_not_implemented
	**/
	public static var ERR_STREAM_READ_NOT_IMPLEMENTED(get, never):Error;

	private static inline function get_ERR_STREAM_READ_NOT_IMPLEMENTED():Error
		return js.Syntax.code("ERR_STREAM_READ_NOT_IMPLEMENTED");

	/**
		Used when a TLS renegotiation request has failed in a non-specific way.

		@see https://nodejs.org/api/errors.html#errors_err_tls_renegotiation_failed
	**/
	public static var ERR_TLS_RENEGOTIATION_FAILED(get, never):Error;

	private static inline function get_ERR_TLS_RENEGOTIATION_FAILED():Error
		return js.Syntax.code("ERR_TLS_RENEGOTIATION_FAILED");

	/**
		The `'ERR_UNKNOWN_BUILTIN_MODULE'` error code is used to identify a specific kind of
		internal Node.js error that should not typically be triggered by user code.
		Instances of this error point to an internal bug within the Node.js binary itself.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_builtin_module_1
	**/
	public static var ERR_UNKNOWN_BUILTIN_MODULE(get, never):Error;

	private static inline function get_ERR_UNKNOWN_BUILTIN_MODULE():Error
		return js.Syntax.code("ERR_UNKNOWN_BUILTIN_MODULE");

	/**
		An attempt was made to launch a Node.js process with an unknown `stdin` file type.
		This error is usually an indication of a bug within Node.js itself,
		although it is possible for user code to trigger it.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_stdin_type
	**/
	public static var ERR_UNKNOWN_STDIN_TYPE(get, never):Error;

	private static inline function get_ERR_UNKNOWN_STDIN_TYPE():Error
		return js.Syntax.code("ERR_UNKNOWN_STDIN_TYPE");

	/**
		An attempt was made to launch a Node.js process with an unknown `stdout` or `stderr` file type.
		This error is usually an indication of a bug within Node.js itself,
		although it is possible for user code to trigger it.

		@see https://nodejs.org/api/errors.html#errors_err_unknown_stream_type
	**/
	public static var ERR_UNKNOWN_STREAM_TYPE(get, never):Error;

	private static inline function get_ERR_UNKNOWN_STREAM_TYPE():Error
		return js.Syntax.code("ERR_UNKNOWN_STREAM_TYPE");

	/**
		Used when a given value is out of the accepted range.

		@see https://nodejs.org/api/errors.html#errors_err_value_out_of_range
	**/
	public static var ERR_VALUE_OUT_OF_RANGE(get, never):Error;

	private static inline function get_ERR_VALUE_OUT_OF_RANGE():Error
		return js.Syntax.code("ERR_VALUE_OUT_OF_RANGE");

	/**
		The module must be successfully linked before instantiation.

		@see https://nodejs.org/api/errors.html#errors_err_vm_module_not_linked
	**/
	public static var ERR_VM_MODULE_NOT_LINKED(get, never):Error;

	private static inline function get_ERR_VM_MODULE_NOT_LINKED():Error
		return js.Syntax.code("ERR_VM_MODULE_NOT_LINKED");

	/**
		Used when an attempt is made to use a zlib object after it has already been closed.

		@see https://nodejs.org/api/errors.html#errors_err_zlib_binding_closed
	**/
	public static var ERR_ZLIB_BINDING_CLOSED(get, never):Error;

	private static inline function get_ERR_ZLIB_BINDING_CLOSED():Error
		return js.Syntax.code("ERR_ZLIB_BINDING_CLOSED");

	/**
		The `--entry-type=commonjs` flag was used to attempt to execute an `.mjs` file or a `.js` file
		where the nearest parent `package.json` contains `"type": "module"`;
		or the `--entry-type=module` flag was used to attempt to execute a `.cjs` file or a `.js` file
		where the nearest parent `package.json` either lacks a `"type"` field or contains `"type": "commonjs"`.

		@see https://nodejs.org/api/errors.html#errors_err_entry_type_mismatch
	**/
	public static var ERR_ENTRY_TYPE_MISMATCH(get, never):Error;

	private static inline function get_ERR_ENTRY_TYPE_MISMATCH():Error
		return js.Syntax.code("ERR_ENTRY_TYPE_MISMATCH");

	/**
		An attempt was made to initiate operations on a watcher
		returned by `fs.watch()` that has not yet been started.

		@see https://nodejs.org/api/errors.html#errors_err_fs_watcher_not_started
	**/
	public static var ERR_FS_WATCHER_ALREADY_STARTED(get, never):Error;

	private static inline function get_ERR_FS_WATCHER_ALREADY_STARTED():Error
		return js.Syntax.code("ERR_FS_WATCHER_ALREADY_STARTED");

	/**
		Occurs with multiple attempts to shutdown an HTTP/2 session.

		@see https://nodejs.org/api/errors.html#errors_err_http2_already_shutdown
	**/
	public static var ERR_HTTP2_ALREADY_SHUTDOWN(get, never):Error;

	private static inline function get_ERR_HTTP2_ALREADY_SHUTDOWN():Error
		return js.Syntax.code("ERR_HTTP2_ALREADY_SHUTDOWN");

	/**
		A non-specific HTTP/2 error has occurred.

		@see https://nodejs.org/api/errors.html#errors_err_http2_error_1
	**/
	public static var ERR_HTTP2_ERROR(get, never):Error;

	private static inline function get_ERR_HTTP2_ERROR():Error
		return js.Syntax.code("ERR_HTTP2_ERROR");

	/**
		Used in the `repl` in case the old history file is used and an error occurred
		while trying to read and parse it.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_repl_history
	**/
	public static var ERR_INVALID_REPL_HISTORY(get, never):Error;

	private static inline function get_ERR_INVALID_REPL_HISTORY():Error
		return js.Syntax.code("ERR_INVALID_REPL_HISTORY");

	/**
		The `--entry-type=...` flag is not compatible with the Node.js REPL.

		@see https://nodejs.org/api/errors.html#errors_err_invalid_repl_type
	**/
	public static var ERR_INVALID_REPL_TYPE(get, never):Error;

	private static inline function get_ERR_INVALID_REPL_TYPE():Error
		return js.Syntax.code("ERR_INVALID_REPL_TYPE");

	/**
		Used when an `ES Module` loader hook specifies `format: 'dynamic'`
		but does not provide a `dynamicInstantiate` hook.

		@see https://nodejs.org/api/errors.html#errors_err_missing_dynamic_instantiate_hook_1
	**/
	public static var ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK(get, never):Error;

	private static inline function get_ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK():Error
		return js.Syntax.code("ERR_MISSING_DYNAMIC_INSTANTIATE_HOOK");

	/**
		Used to prevent an abort if a string decoder was set on the Socket.

		@see https://nodejs.org/api/errors.html#errors_err_stream_has_stringdecoder
	**/
	public static var ERR_STREAM_HAS_STRINGDECODER(get, never):Error;

	private static inline function get_ERR_STREAM_HAS_STRINGDECODER():Error
		return js.Syntax.code("ERR_STREAM_HAS_STRINGDECODER");

	/**
		An attempt has been made to create a string larger than the maximum allowed size.

		@see https://nodejs.org/api/errors.html#errors_err_string_too_large
	**/
	public static var ERR_STRING_TOO_LARGE(get, never):Error;

	private static inline function get_ERR_STRING_TOO_LARGE():Error
		return js.Syntax.code("ERR_STRING_TOO_LARGE");

	/**
		This `Error` is thrown when a read is attempted on a TTY `WriteStream`,
		such as `process.stdout.on('data')`.

		@see https://nodejs.org/api/errors.html#errors_err_tty_writable_not_readable
	**/
	public static var ERR_TTY_WRITABLE_NOT_READABLE(get, never):Error;

	private static inline function get_ERR_TTY_WRITABLE_NOT_READABLE():Error
		return js.Syntax.code("ERR_TTY_WRITABLE_NOT_READABLE");
}
