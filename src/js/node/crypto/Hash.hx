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

import js.node.Crypto.BinaryLike;
import js.node.Buffer;
import js.node.stream.Transform;

/**
	Enumeration for `Hash` class events.
**/
typedef HashEvent<T:haxe.Constraints.Function> = TransformEvent<T>;

/**
	The `Hash` class is a utility for creating hash digests of data. It can be used in one of two ways:

	* As a stream that is both readable and writable, where data is written to produce a computed hash digest on the readable side, or
	* Using the `Hash.update()` and `Hash.digest()` methods to produce the computed hash.

	The `Crypto.createHash()` method is used to create `Hash` instances. `Hash` objects are not to be created directly using the new keyword.

	@see https://nodejs.org/api/crypto.html#crypto_class_hash
**/
extern class Hash extends js.node.stream.Transform<Hash> {
	/**
		Creates a new `Hash` object that contains a deep copy of the internal state of the current `Hash` object.

		@see https://nodejs.org/api/crypto.html#crypto_hash_copy_options
	**/
	function copy(options:TransformNewOptions):Hash;

	/**
		Calculates the digest of all of the data passed to be hashed (using the `Hash.update()` method).
		If `encoding` is provided a string will be returned; otherwise a `Buffer` is returned.

		@see https://nodejs.org/api/crypto.html#crypto_hash_digest_encoding
	**/
	@:overload(function():Buffer {})
	function digest(encoding:String):String;

	/**
		Updates the hash content with the given data, the `encoding` of which is given in `inputEncoding`. If `encoding` is not provided, and the data is a string, an encoding of `'utf8'` is enforced.
		If data is a `BufferLike`, then `inputEncoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_hash_update_data_inputencoding
	**/
	function update(data:BinaryLike, ?inputEncoding:String):Hash;
}
