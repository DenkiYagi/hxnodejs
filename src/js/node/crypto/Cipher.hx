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

import js.node.Buffer;
import js.node.stream.Transform;

/**
	Instances of the Cipher class are used to encrypt data.
	@see https://nodejs.org/api/crypto.html#crypto_class_cipher
**/
extern class Cipher extends js.node.stream.Transform<Cipher> {
	/**
		Any remaining enciphered contents. If `outputEncoding~ is specified, a string is returned. If an `outputEncoding` is not provided, a `Buffer` is returned.

		Once the `Cipher.final()` method has been called, the `Cipher` object can no longer be used to encrypt data. Attempts to call `Cipher.final()` more than once will result in an error being thrown.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_final_outputencoding
	**/
	@:native("final") @:overload(function(output_encoding:String):Buffer {})
	function finalContents(output_encoding:String):String;

	/**
		When using an authenticated encryption mode (`GCM`, `CCM` and `OCB` are currently supported), the `Cipher.setAAD()` method sets the value used for the additional authenticated data (AAD) input parameter.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setaad_buffer_options
	**/
	function setAAD(buffer:Buffer, ?options: Transform<Cipher>):Void;

	/**
		When using an authenticated encryption mode (`GCM`, `CCM` and `OCB` are currently supported), the `Cipher.getAuthTag()` method returns a Buffer containing the authentication tag that has been computed from the given data.

		The `Cipher.getAuthTag()` method should only be called after encryption has been completed using the `Cipher.final()` method.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_getauthtag
	**/
	function getAuthTag():Buffer;

	/**
		When using block encryption algorithms, the Cipher class will automatically add padding to the input data to the appropriate block size. To disable the default padding call `Cipher.setAutoPadding(false)`.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setautopadding_autopadding
	**/
	@:overload(function():Void {})
	function setAutoPadding(auto_padding:Bool):Void;

	/**
		Updates the cipher with `data`. If the `input_encoding` argument is given, the `data` argument is a string using the specified encoding. If the `input_encoding` argument is not given, data must be a `Buffer`. If data is a `Buffer`, then `input_encoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setautopadding_autopadding
	**/
	@:overload(function(data:Buffer):Buffer {})
	@:overload(function(data:String, input_encoding:String):Buffer {})
	function update(data:String, input_encoding:String, output_encoding:String):String;
}
