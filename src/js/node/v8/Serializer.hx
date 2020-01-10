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
	@see https://nodejs.org/api/v8.html#v8_class_v8_serializer
**/
@:jsRequire("v8", "Serializer")
extern class Serializer {
	/**
		Creates a new `Serializer` object.

		@see https://nodejs.org/api/v8.html#v8_new_serializer
	**/
	function new();

	/**
		Writes out a header, which includes the serialization format version.

		@see https://nodejs.org/api/v8.html#v8_serializer_writeheader
	**/
	function writeHeader():Void;

	/**
		Serializes a JavaScript value and adds the serialized representation to the internal buffer.

		@see https://nodejs.org/api/v8.html#v8_serializer_writevalue_value
	**/
	function writeValue(value:Class<Dynamic>):Void;

	/**
		Returns the stored internal buffer.
		This serializer should not be used once the buffer is released.
		Calling this method results in undefined behavior if a previous write has failed.

		@see https://nodejs.org/api/v8.html#v8_serializer_releasebuffer
	**/
	function releaseBuffer():Buffer;

	/**
		Marks an `ArrayBuffer` as having its contents transferred out of band.
		Pass the corresponding `ArrayBuffer` in the deserializing context
		to `deserializer.transferArrayBuffer()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_transferarraybuffer_id_arraybuffer
	**/
	function transferArrayBuffer(id:Int, arrayBuffer:ArrayBuffer):Void;

	/**
		Write a raw 32-bit unsigned integer.
		For use inside of a custom `serializer._writeHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_writeuint32_value
	**/
	function writeUint32(value:Int):Void;

	/**
		Write a raw 64-bit unsigned integer, split into high and low 32-bit parts.
		For use inside of a custom `serializer._writeHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_writeuint64_hi_lo
	**/
	function writeUint64(hi:Int, lo:Int):Void;

	/**
		Write a JS number value.
		For use inside of a custom `serializer._writeHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_writedouble_value
	**/
	function writeDouble(value:Float):Void;

	/**
		Write raw bytes into the serializer’s internal buffer.
		The deserializer will require a way to compute the length of the buffer.
		For use inside of a custom `serializer._writeHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_writerawbytes_buffer
	**/
	@:overload(function(buffer:Buffer):Void {})
	function writeRawBytes(buffer:ArrayBufferView):Void;

	/**
		This method is called to write some kind of host object,
		i.e. an object created by native C++ bindings.
		If it is not possible to serialize `object`, a suitable exception should be thrown.

		@see https://nodejs.org/api/v8.html#v8_serializer_writehostobject_object
	**/
	function _writeHostObject(object:Class<Dynamic>):Void;

	/**
		This method is called to generate error objects that will be thrown
		when an object can not be cloned.

		@see https://nodejs.org/api/v8.html#v8_serializer_getdatacloneerror_message
	**/
	function _getDataCloneError(message:String):Void;

	/**
		This method is called when the serializer is going to serialize a SharedArrayBuffer object.
		It must return an unsigned 32-bit integer ID for the object, using the same ID
		if this SharedArrayBuffer has already been serialized.
		When deserializing, this ID will be passed to `deserializer.transferArrayBuffer()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_getsharedarraybufferid_sharedarraybuffer
	**/
	// it needs extern `SharedArrayBuffer` for Node
	// function _getSharedArrayBufferId(sharedArrayBufferId:SharedArrayBuffer):Void;
	@:overload(function(sharedArrayBufferId:ArrayBuffer):Void {})
	function _getSharedArrayBufferId(sharedArrayBufferId:ArrayBufferView):Void;

	/**
		Indicate whether to treat TypedArray and DataView objects as host objects,
		i.e. pass them to `serializer._writeHostObject()`.

		@see https://nodejs.org/api/v8.html#v8_serializer_settreatarraybufferviewsashostobjects_flag
	**/
	function _setTreatArrayBufferViewsAsHostObjects(flag:Bool):Void;
}
