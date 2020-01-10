package js.node.v8;

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
import js.lib.ArrayBuffer;
import haxe.io.ArrayBufferView;

/**
	@see https://nodejs.org/api/v8.html#v8_class_v8_deserializer
**/
@:jsRequire("v8", "Deserializer")
extern class Deserializer {
	/**
		Creates a new `Deserializer` object.

		@see https://nodejs.org/api/v8.html#v8_new_serializer
	**/
	@:overload(function(buffer:Buffer):Deserializer {})
	function new(buffer:ArrayBufferView);

	/**
		Reads and validates a header (including the format version).
		May, for example, reject an invalid or unsupported wire format.
		In that case, an `Error` is thrown.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readheader
	**/
	function readHeader():Void;

	/**
		Deserializes a JavaScript value from the buffer and returns it.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readvalue
	**/
	function readValue():Class<Dynamic>;

	/**
		Marks an `ArrayBuffer` as having its contents transferred out of band.
		Pass the corresponding `ArrayBuffer` in the serializing context to `serializer.transferArrayBuffer()`
		(or return the id from `serializer._getSharedArrayBufferId()` in the case of `SharedArrayBuffers`).

		@see https://nodejs.org/api/v8.html#v8_deserializer_transferarraybuffer_id_arraybuffer
	**/
	function transferArrayBuffer(id:Int, arrayBuffer:ArrayBufferView):Void;

	/**
		Reads the underlying wire format version.
		Likely mostly to be useful to legacy code reading old wire format versions.
		May not be called before `.readHeader()`.

		@see https://nodejs.org/api/v8.html#v8_deserializer_getwireformatversion
	**/
	function getWireFormatVersion():Int;

	/**
		Read a raw 32-bit unsigned integer and return it.
		For use inside of a custom `deserializer._readHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readuint32
	**/
	function readUint32():Int;

	/**
		Read a raw 64-bit unsigned integer and return it
		as an array `[hi, lo]` with two 32-bit unsigned integer entries.
		For use inside of a custom `deserializer._readHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readuint64
	**/
	function readUint64():Array<Int>;

	/**
		Read a JS number value.
		For use inside of a custom `deserializer._readHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readdouble
	**/
	function readDouble():Float;

	/**
		Read raw bytes from the deserializer’s internal buffer.
		The `length` parameter must correspond to the length of the buffer that
		was passed to `serializer.writeRawBytes()`.
		For use inside of a custom `deserializer._readHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readrawbytes_leng
	**/
	function readRawBytes(length:Int):Buffer;

	/**
		This method is called to read some kind of host object, i.e. an object that is created by native C++ bindings.
		If it is not possible to deserialize the data, a suitable exception should be thrown.

		@see https://nodejs.org/api/v8.html#v8_deserializer_readhostobject
	**/
	function _readHostObject():Void;
}
