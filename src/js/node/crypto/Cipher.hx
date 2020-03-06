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

import js.node.Crypto.BufferLike;
import js.node.Crypto.BinaryLike;
import js.node.Crypto.SetAADOptions;
import haxe.extern.EitherType;
import js.node.Buffer;
import js.node.stream.Transform;

/**
	Enumeration for `Cipher` class events.
**/
typedef CipherEvent<T:haxe.Constraints.Function> = TransformEvent<T>;

/**
	Instances of the `Cipher` class are used to encrypt data.

	@see https://nodejs.org/api/crypto.html#crypto_class_cipher
**/
extern class Cipher extends js.node.stream.Transform<Cipher> {
	/**
		Once the `Cipher.final()` method has been called, the Cipher object can no longer be used to encrypt data.
		Attempts to call `Cipher.final()` more than once will result in an error being thrown.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_final_outputencoding
	**/
	@:native("final") function finalContents(?outputEncoding:String):EitherType<Buffer, String>;

	/**
		When using an authenticated encryption mode (`GCM`, `CCM` and `OCB` are currently supported),
		the `Cipher.setAAD()` method sets the value used for the additional authenticated data (AAD) input parameter.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setaad_buffer_options
	**/
	function setAAD(buffer:BufferLike, ?options:SetAADOptions):Cipher;

	/**
		The `Cipher.getAuthTag()` method should only be called after encryption has been completed using the `Cipher.final()` method.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_getauthtag
	**/
	function getAuthTag():Buffer;

	/**
		When using block encryption algorithms, the `Cipher` class will automatically add padding to the input data to the appropriate block size.
		To disable the default padding call `Cipher.setAutoPadding(false)`.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setautopadding_autopadding
	**/
	function setAutoPadding(?autoPadding:Bool):Cipher;

	/**
		Updates the cipher with `data`.
		If the `inputEncoding` argument is given, the `data` argument is a string using the specified encoding.
		If the `inputEncoding` argument is not given, data must be a `Buffer` or `ArrayBuf`weiVref.
		If data is a `Buffer` or `ArrayBufferView`, then `inputEncoding` is ignored.

		@see https://nodejs.org/api/crypto.html#crypto_cipher_setautopadding_autopadding
	**/
	function update(data:BinaryLike, ?inputEncoding:String, ?outputEncoding:String):EitherType<String, Buffer>;
}
