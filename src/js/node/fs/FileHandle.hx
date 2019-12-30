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

package js.node.fs;

import haxe.extern.EitherType;
#if haxe4
import js.lib.Promise;
#else
import js.Promise;
#end
import js.lib.ArrayBufferView;
import js.node.Fs;

/**
	A `FileHandle` object is a wrapper for a numeric file descriptor.
	Instances of `FileHandle` are distinct from numeric file descriptors in that they provide an object oriented API for
	working with files.

	@see https://nodejs.org/api/fs.html#fs_class_filehandle
**/
@:jsRequire("fs", "promises", "FileHandle")
extern class FileHandle {
	/**
		Asynchronously append data to this file, creating the file if it does not yet exist.
		`data` can be a string or a `Buffer`.
		The `Promise` will be resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_appendfile_data_options
	**/
	@:overload(function(data:EitherType<String, Buffer>):Promise<Void> {})
	function appendFile(data:EitherType<String, Buffer>, options:EitherType<String, FsWriteFileOptions>):Promise<Void>;

	/**
		Modifies the permissions on the file.

		@see https://nodejs.org/api/fs.html#fs_filehandle_chmod_mode
	**/
	function chmod(mode:Int):Promise<Void>;

	/**
		Changes the ownership of the file then resolves the `Promise`.

		@see https://nodejs.org/api/fs.html#fs_filehandle_chown_uid_gid
	**/
	function chown(uid:Int, gid:Int):Promise<Void>;

	/**
		Closes the file descriptor.

		@see https://nodejs.org/api/fs.html#fs_filehandle_close
	**/
	function close():Promise<Void>;

	/**
		Asynchronous `fdatasync(2)`.
		The `Promise` is resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_datasync
	**/
	function datasync():Promise<Void>;

	/**
		The numeric file descriptor managed by the `FileHandle` object.

		@see https://nodejs.org/api/fs.html#fs_filehandle_fd
	**/
	var fd(default, null):Int;

	/**
		Read data from the file.

		@see https://nodejs.org/api/fs.html#fs_filehandle_read_buffer_offset_length_position
	**/
	@:overload(function(buffer:Buffer, offset:Int, length:Int, position:Null<Int>):Promise<{bytesRead:Int, buffer:Buffer}> {})
	function read(buffer:ArrayBufferView, offset:Int, length:Int, position:Null<Int>):Promise<{bytesRead:Int, buffer:ArrayBufferView}>;

	/**
		Asynchronously reads the entire contents of a file.

		@see https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback
	**/
	@:overload(function():Promise<Buffer> {})
	function readFile(options:EitherType<String, FsReadFileOptions>):Promise<EitherType<String, Buffer>>;

	/**
		Retrieves the `fs.Stats` for the file.

		@see https://nodejs.org/api/fs.html#fs_filehandle_stat_options
	**/
	@:overload(function():Promise<Stats> {})
	function stat(options:FsFstatOptions):Promise<Stats>;

	/**
		Asynchronous `fsync(2)`.
		The `Promise` is resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_sync
	**/
	function sync():Promise<Void>;

	/**
		Truncates the file then resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_truncate_len
	**/
	@:overload(function():Promise<Void> {})
	function truncate(len:Int):Promise<Void>;

	/**
		Change the file system timestamps of the object referenced by the `FileHandle` then resolves the `Promise` with
		no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_utimes_atime_mtime
	**/
	function utimes(atime:FsTime, mtime:FsTime):Promise<Void>;

	/**
		Write `buffer` to the file.

		@see https://nodejs.org/api/fs.html#fs_filehandle_write_buffer_offset_length_position
		@see https://nodejs.org/api/fs.html#fs_filehandle_write_string_position_encoding
	**/
	@:overload(function(buffer:Buffer, ?offset:Int, ?length:Int, ?position:Int):Promise<{bytesWritten:Int, buffer:Buffer}> {})
	@:overload(function(buffer:ArrayBufferView, ?offset:Int, ?length:Int, ?position:Int):Promise<{bytesWritten:Int, buffer:ArrayBufferView}> {})
	function write(string:String, ?position:Int, ?encoding:String):Promise<{bytesWritten:Int, buffer:String}>;

	/**
		Asynchronously writes data to a file, replacing the file if it already exists.
		`data` can be a string or a buffer.
		The `Promise` will be resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_filehandle_writefile_data_options
	**/
	@:overload(function(data:EitherType<String, EitherType<Buffer, ArrayBufferView>>):Promise<Void> {})
	function writeFile(data:EitherType<String, EitherType<Buffer, ArrayBufferView>>, options:EitherType<String, FsWriteFileOptions>):Promise<Void>;

	/**
		Write an array of `ArrayBufferViews` to the file.

		@see https://nodejs.org/api/fs.html#fs_filehandle_writev_buffers_position
	**/
	@:overload(function(buffers:Array<ArrayBufferView>):Promise<{bytesWritten:Int, buffer:Array<ArrayBufferView>}> {})
	function writev(buffers:Array<ArrayBufferView>, position:Int):Promise<{bytesWritten:Int, buffer:Array<ArrayBufferView>}>;
}
