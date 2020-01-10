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
import js.node.stream.Transform;
import js.node.stream.Transform.TSelf;

/**
	Instances of the `Decipher` class are used to decrypt data.

	@see https://nodejs.org/api/crypto.html#crypto_class_decipher
**/
extern class Decipher extends js.node.stream.Transform<Decipher> {
	/**
		Once the `Decipher.final()` method has been called, the `Decipher` object can no longer be used to decrypt data.
		Attempts to call `Decipher.final()` more than once will result in an error being thrown.

		@see https://nodejs.org/api/crypto.html#crypto_decipher_final_outputencoding
	**/
	@:native("final") @:overload(function():Buffer {})
	function finalContents(output_encoding:String):String;

	/**
		When using an authenticated encryption mode (`GCM`, `CCM` and `OCB` are currently supported),
		the `Decipher.setAAD()` method sets the value used for the additional authenticated data (AAD) input parameter.

		@see https://nodejs.org/api/crypto.html#crypto_decipher_setaad_buffer_options
	**/
	@:overload(function(buffer:Buffer, ?options:Transform<Decipher>):Decipher {})
	function setAAD(buffer:ArrayBufferView, ?options:Transform<Decipher>):Decipher;

	/**
		When using an authenticated encryption mode (`GCM`, `CCM` and `OCB` are currently supported),
		the `Decipher.setAuthTag()` method is used to pass in the received authentication tag.
		If no tag is provided, or if the cipher text has been tampered with, `Decipher.final()` will throw,
		indicating that the cipher text should be discarded due to failed authentication.
		If the tag length is invalid according to NIST SP 800-38D or does not match the value of the `authTagLength` option,
		`Decipher.setAuthTag()` will throw an error.

		@see https://nodejs.org/api/crypto.html#crypto_decipher_setauthtag_buffer
	**/
	@:overload(function(buffer:Buffer):Decipher {})
	function setAuthTag(buffer:ArrayBufferView):Decipher;

	/**
		When data has been encrypted without standard block padding, calling `Decipher.setAutoPadding(false)` will disable automatic padding to prevent `Decipher.final()` from checking for and removing padding.

		@see https://nodejs.org/api/crypto.html#crypto_decipher_setautopadding_autopadding
	**/
	@:overload(function():Decipher {})
	function setAutoPadding(auto_padding:Bool):Decipher;

	/**
		Updates the decipher with `data`.
		If the `input_encoding` argument is given, the data argument is a string using the specified encoding.
		If the `input_encoding` argument is not given, data must be a `Buffer`.
		If `data` is a `Buffer` or `Arraybufferview` then `input_encoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_decipher_update_data_inputencoding_outputencoding
	**/
	@:overload(function(data:String, input_encoding:String, ?output_encoding:String):Buffer {})
	@:overload(function(data:String, input_encoding:String, ?output_encoding:String):String {})
	@:overload(function(data:Buffer, ?output_encoding:String):Buffer {})
	@:overload(function(data:Buffer, ?output_encoding:String):String {})
	@:overload(function(data:ArrayBufferView, ?output_encoding:String):Buffer {})
	function update(data:ArrayBufferView, ?output_encoding:String):String;
}
