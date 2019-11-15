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

#if haxe4
import js.lib.Error;
import js.lib.Promise;
#else
import js.Error;
import js.Promise;
#end
import js.node.fs.Dirent;

/**
	A class representing a directory stream.

	@see https://nodejs.org/api/fs.html#fs_class_fs_dir
**/
@:jsRequire("fs", "Dir")
extern class Dir {
	/**
		Asynchronously close the directory's underlying resource handle. Subsequent reads will result in errors.

		@see https://nodejs.org/api/fs.html#fs_dir_close
		@see https://nodejs.org/api/fs.html#fs_dir_closesync
	**/
	@:overload(function():Promise<Void> {})
	function close(callback:Error->Void):Void;

	/**
		Synchronously close the directory's underlying resource handle. Subsequent reads will result in errors.

		@see https://nodejs.org/api/fs.html#fs_dir_closesync
	**/
	function closeSync():Void;

	/**
		The read-only path of this directory as was provided to `fs.opendir()`, `fs.opendirSync()`, or
		`fsPromises.opendir()`.

		@see https://nodejs.org/api/fs.html#fs_dir_path
	**/
	var path:String;

	/**
		Asynchronously read the next directory entry via `readdir(3)` as an `fs.Dirent`.

		@see https://nodejs.org/api/fs.html#fs_dir_read
		@see https://nodejs.org/api/fs.html#fs_dir_read_callback
	**/
	@:overload(function():Promise<Null<Dirent>> {})
	function read(callback:Error->Null<Dirent>->Void):Void;

	/**
		Synchronously read the next directory entry via `readdir(3)` as an `fs.Dirent`.

		@see https://nodejs.org/api/fs.html#fs_dir_readsync
	**/
	function readSync():Null<Dirent>;
}
