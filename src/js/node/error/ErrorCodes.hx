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
}
