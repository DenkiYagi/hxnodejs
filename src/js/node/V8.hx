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

package js.node;

import haxe.io.ArrayBufferView;

/**
	The v8 module exposes APIs that are specific to the version of V8 built into the Node.js binary.

	@see https://nodejs.org/api/v8.html#v8_v8
**/
@:jsRequire("v8")
extern class V8 {
	/**
		Returns an integer representing a "version tag" derived from the V8 version,
		command line flags and detected CPU features.
		This is useful for determining whether a `vm.Script` `cachedData` buffer is
		compatible with this instance of V8.

		@see https://nodejs.org/api/v8.html#v8_v8_cacheddataversiontag
	**/
	static function cachedDataVersionTag():Int;

	/**
		Returns statistics about the V8 heap spaces, i.e. the segments which make up the V8 heap.
		Neither the ordering of heap spaces, nor the availability of a heap space can be guaranteed
		as the statistics are provided via the V8 `GetHeapSpaceStatistics` function and may change
		from one V8 version to the next.

		@see https://nodejs.org/api/v8.html#v8_v8_getheapspacestatistics
	**/
	static function getHeapSpaceStatistics():Array<V8HeapSpaceStatistics>;

	/**
		Generates a snapshot of the current V8 heap and returns a Readable Stream
		that may be used to read the JSON serialized representation.
		This JSON stream format is intended to be used with tools such as Chrome DevTools.
		The JSON schema is undocumented and specific to the V8 engine,
		and may change from one version of V8 to the next.

		@see https://nodejs.org/api/v8.html#v8_v8_getheapsnapshot
	**/
	static function getHeapSnapshot():js.node.stream.Readable<Dynamic>;

	/**
		@see https://nodejs.org/api/v8.html#v8_v8_getheapstatistics
	**/
	static function getHeapStatistics():V8HeapStatistics;

	/**
		@see https://nodejs.org/api/v8.html#v8_v8_getheapcodestatistics
	**/
	static function getHeapCodeStatistics():V8HeapCodeStatistics;

	/**
		The `v8.setFlagsFromString()` method can be used to programmatically set V8 command line flags.
		This method should be used with care.
		Changing settings after the VM has started may result in unpredictable behavior,
		including crashes and data loss; or it may simply do nothing.

		@see https://nodejs.org/api/v8.html#v8_v8_setflagsfromstring_flags
	**/
	static function setFlagsFromString(string:String):Void;

	/**
		Generates a snapshot of the current V8 heap and writes it to a JSON file.
		This file is intended to be used with tools such as Chrome DevTools.
		The JSON schema is undocumented and specific to the V8 engine,
		and may change from one version of V8 to the next.

		@see https://nodejs.org/api/v8.html#v8_v8_writeheapsnapshot_filename
	**/
	static function writeHeapSnapshot(filename:String):String;

	/**
		Uses a `DefaultSerializer` to serialize value into a buffer.

		@see https://nodejs.org/api/v8.html#v8_v8_serialize_value
	**/
	static function serialize(value:Class<Dynamic>):Buffer;

	/**
		Uses a `DefaultDeserializer` with default options to read a JS value from a buffer.

		@see https://nodejs.org/api/v8.html#v8_v8_deserialize_buffer
	**/
	@:overload(function(buffer:Buffer):Void {})
	static function deserialize(buffer:ArrayBufferView):Void;
}

/**
	Object returned by `V8.getHeapStatistics` method.
**/
typedef V8HeapStatistics = {
	var total_heap_size:Int;
	var total_heap_size_executable:Int;
	var total_physical_size:Int;
	var total_available_size:Int;
	var used_heap_size:Int;
	var heap_size_limit:Int;
	var malloced_memory:Int;
	var peak_malloced_memory:Int;
	var does_zap_garbase:Int;
	var number_of_native_contexts:Int;
	var number_of_detached_contexts:Int;
}

/**
	Object returned by `V8.getHeapSpaceStatistics` method.
**/
typedef V8HeapSpaceStatistics = {
	var space_name:String;
	var space_size:Int;
	var space_used_size:Int;
	var space_available_size:Int;
	var physical_space_size:Int;
}

/**
	Object return by `V8.getHeapCodeStatistics` method.
**/
typedef V8HeapCodeStatistics = {
	var code_and_metadata_size:Int;
	var bytecode_and_metadata_size:Int;
	var external_script_source_size:Int;
}
