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

import haxe.extern.EitherType;
import js.lib.ArrayBufferView;
import js.node.Buffer;
import js.node.stream.Transform;
import js.node.events.EventEmitter.Event;
import js.node.stream.Readable.IReadable;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration for `Hmac` class events.
**/
@:enum abstract HmacEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		inherited from `stream.Transform`
	**/
	var Readable:HmacEvent<Void->Void> = "readable";

	/**
		inherited from `stream.Transform`
	**/
	var Data:HmacEvent<EitherType<Buffer, String>->Void> = "data";

	/**
		inherited from `stream.Transform`
	**/
	var End:HmacEvent<Void->Void> = "end";

	/**
		inherited from `stream.Transform`
	**/
	var Close:HmacEvent<Void->Void> = "close";

	/**
		inherited from `stream.Transform`
	**/
	var Error:HmacEvent<Error->Void> = "error";

	/**
		inherited from `stream.Transform`
	**/
	var Drain:HmacEvent<Void->Void> = "drain";

	/**
		inherited from `stream.Transform`
	**/
	var Finish:HmacEvent<Void->Void> = "finish";

	/**
		inherited from `stream.Transform`
	**/
	var Pipe:HmacEvent<IReadable->Void> = "pipe";

	/**
		inherited from `stream.Transform`
	**/
	var Unpipe:HmacEvent<IReadable->Void> = "unpipe";
}

/**
	The `Hmac` class is a utility for creating cryptographic HMAC digests. It can be used in one of two ways:

	* As a stream that is both readable and writable, where data is written to produce a computed HMAC digest on the readable side, or
	* Using the `Hmac.update()` and `Hmac.digest()` methods to produce the computed HMAC digest.

	The `Crypto.createHmac()` method is used to create `Hmac` instances. `Hmac` objects are not to be created directly using the `new` keyword.

	@see https://nodejs.org/api/crypto.html#crypto_class_hmac
**/
extern class Hmac extends js.node.stream.Transform<Hmac> {
	/**
		Calculates the HMAC digest of all of the data passed using `Hmac.update()`.
		If `encoding` is provided a string is returned; otherwise a `Buffer` is returned,

		@see https://nodejs.org/api/crypto.html#crypto_hmac_digest_encoding
	**/
	@:overload(function():Buffer {})
	function digest(encoding:String):String;

	/**
		Updates the `Hmac` content with the given data, the encoding of which is given in `input_encoding`. If `encoding` is not provided, and the `data` is a string, an encoding of `'utf8'` is enforced.
		If `data` is a `Buffer` or `ArrayBufferView`, then `input_encoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_hmac_update_data_inputencoding
	**/
	@:overload(function(data:Buffer):Void {})
	function update(data:String, ?input_encoding:String):Void;
}
