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

import js.lib.ArrayBufferView;
import js.node.Buffer;
import js.node.stream.Writable;

/**
	The `Sign` class is a utility for generating signatures. It can be used in one of two ways:

	* As a writable stream, where data to be signed is written and the `Sign.sign()` method is used to generate and return the signature, or
	* Using the `Sign.update()` and `Sign.sign()` methods to produce the signature.

	The `Crypto.createSign()` method is used to create `Sign` instances.
	The argument is the string name of the hash function to use.
	`Sign` objects are not to be created directly using the `new` keyword.

	@see https://nodejs.org/api/crypto.html#crypto_class_sign
**/
extern class Sign extends Writable<Sign> {

	/**
		Calculates the signature on all the data passed through using either `Sign.update()` or `Sign.write()`.

		@see https://nodejs.org/api/crypto.html#crypto_sign_sign_privatekey_outputencoding
	**/
	@:overload(function(private_key:String, output_format:String):String {})
	@:overload(function(private_key:String, output_format:String):Buffer {})
	@:overload(function(private_key:{key:String, passphrase:String}, output_format:String):String {})
	function sign(private_key:{key:String, passphrase:String}, output_format:String):Buffer;

	/**
		Updates the `Sign` content with the given `data`, the encoding of which is given in `input_encoding`.
		If `input_encoding` is not provided, and the `data` is a string, an encoding of `'utf8'` is enforced.
		If data is a `Buffer` or `Arraybufferview`, then `input_encoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_sign_update_data_inputencoding
	**/
	@:overload(function(data:Buffer):Void {})
	@:overload(function(data:ArrayBufferView):Void {})
	function update(data:String, ?input_encoding:String):Void;
}
