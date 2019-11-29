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
	The `fs.promises` API provides an alternative set of asynchronous file system methods that return `Promise` objects
	rather than using callbacks.
	The API is accessible via `require('fs').promises`.

	@see https://nodejs.org/api/fs.html#fs_fs_promises_api
**/
@:jsRequire("fs", "promises")
extern class Promises {
	/**
		Tests a user's permissions for the file or directory specified by `path`.
		The `mode` argument is an optional integer that specifies the accessibility checks to be performed.
		Check `File` Access Constants for possible values of `mode`.
		It is possible to create a mask consisting of the bitwise OR of two or more values (e.g.
		`fs.constants.W_OK | fs.constants.R_OK`).

		@see https://nodejs.org/api/fs.html#fs_fspromises_access_path_mode
	**/
	static function access(path:FsPath, ?mode:Int):Promise<Void>;

	/**
		Asynchronously append data to a file, creating the file if it does not yet exist.
		`data` can be a `string` or a `Buffer`.
		The `Promise` will be resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_appendfile_path_data_options
	**/
	@:overload(function(path:FsPath_, data:String, ?options:FsWriteFileOptions):Promise<Void> {})
	@:overload(function(path:FsPath_, data:String, ?options:String):Promise<Void> {})
	@:overload(function(path:FsPath_, data:Buffer, ?options:FsWriteFileOptions):Promise<Void> {})
	static function appendFile(path:FsPath_, data:Buffer, ?options:String):Promise<Void>;

	/**
		Changes the permissions of a file then resolves the `Promise` with no arguments upon succces.

		@see https://nodejs.org/api/fs.html#fs_fspromises_chmod_path_mode
	**/
	static function chmod(path:FsPath, mode:Int):Promise<Void>;

	/**
		Changes the ownership of a file then resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_chown_path_uid_gid
	**/
	static function chown(path:FsPath, uid:Int, gid:Int):Promise<Void>;

	/**
		Asynchronously copies `src` to `dest`.
		By default, `dest` is overwritten if it already exists.
		The `Promise` will be resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_copyfile_src_dest_flags
	**/
	static function copyFile(src:FsPath, dest:FsPath, ?flags:Int):Promise<Void>;

	/**
		Changes the permissions on a symbolic link then resolves the `Promise` with no arguments upon success.
		This method is only implemented on macOS.

		@see https://nodejs.org/api/fs.html#fs_fspromises_lchmod_path_mode
	**/
	static function lchmod(path:FsPath, mode:Int):Promise<Void>;

	/**
		Changes the ownership on a symbolic link then resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_lchown_path_uid_gid
	**/
	static function lchown(path:FsPath, uid:Int, gid:Int):Promise<Void>;

	/**
		Asynchronous `link(2)`.
		The `Promise` is resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_link_existingpath_newpath
	**/
	static function link(existingPath:FsPath, newPath:FsPath):Promise<Void>;

	/**
		Asynchronous `lstat(2)`.
		The `Promise` is resolved with the `fs.Stats` object for the given symbolic link `path`.

		@see https://nodejs.org/api/fs.html#fs_fspromises_lstat_path_options
	**/
	static function lstat(path:FsPath, ?options:FsFstatOptions):Promise<Stats>;

	/**
		Asynchronously creates a directory then resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_mkdir_path_options
	**/
	static function mkdir(path:FsPath, ?options:FsMkdirOptions):Promise<Void>;

	/**
		Creates a unique temporary directory and resolves the `Promise` with the created folder path.
		A unique directory name is generated by appending six random characters to the end of the provided `prefix`.
		Due to platform inconsistencies, avoid trailing `X` characters in `prefix`.
		Some platforms, notably the BSDs, can return more than six random characters, and replace trailing `X`
		characters in `prefix` with random characters.

		@see https://nodejs.org/api/fs.html#fs_fspromises_mkdtemp_prefix_options
	**/
	@:overload(function(prefix:String, ?options:String):Promise<String> {})
	static function mkdtemp(prefix:String, ?options:FsMkdtempOptions):Promise<String>;

	/**
		Asynchronous file open that returns a `Promise` that, when resolved, yields a `FileHandle` object.
		See `open(2)`.

		@see https://nodejs.org/api/fs.html#fs_fspromises_open_path_flags_mode
	**/
	@:overload(function(path:FsPath, flags:FsOpenFlag, ?mode:Int):Promise<FileHandle> {})
	static function open(path:FsPath, flags:Int, ?mode:Int):Promise<FileHandle>;

	/**
		Asynchronously open a directory.
		See `opendir(3)`.

		@see https://nodejs.org/api/fs.html#fs_fs_opendir_path_options_callback
	**/
	static function opendir(path:FsPath, ?options:FsOpendirOptions):Promise<Dir>;

	/**
		Reads the contents of a directory then resolves the `Promise` with an array of the names of the files in the
		directory excluding `'.'` and `'..'`.

		@see https://nodejs.org/api/fs.html#fs_fspromises_readdir_path_options
	**/
	@:overload(function(path:FsPath, ?options:String):Promise<Array<String>> {})
	@:overload(function(path:FsPath, ?options:String):Promise<Array<Buffer>> {})
	@:overload(function(path:FsPath, ?options:String):Promise<Array<Dirent>> {})
	@:overload(function(path:FsPath, ?options:FSReaddirOptions):Promise<Array<String>> {})
	@:overload(function(path:FsPath, ?options:FSReaddirOptions):Promise<Array<Buffer>> {})
	static function readdir(path:FsPath, ?options:FSReaddirOptions):Promise<Array<Dirent>>;

	/**
		Asynchronously reads the entire contents of a file.

		@see https://nodejs.org/api/fs.html#fs_fspromises_readfile_path_options
	**/
	@:overload(function(filename:FsPath_, ?options:FsReadFileOptions):Promise<String> {})
	@:overload(function(filename:FsPath_, ?options:FsReadFileOptions):Promise<Buffer> {})
	@:overload(function(filename:FsPath_, ?options:String):Promise<String> {})
	static function readFile(filename:FsPath_, options:String):Promise<Buffer>;

	/**
		Asynchronous `readlink(2)`.
		The `Promise` is resolved with the `linkString` upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_readlink_path_options
	**/
	@:overload(function(path:FsPath, ?options:String):Promise<String> {})
	@:overload(function(path:FsPath, ?options:String):Promise<Buffer> {})
	@:overload(function(path:FsPath, ?options:FsMkdtempOptions):Promise<String> {})
	static function readlink(path:FsPath, ?options:FsMkdtempOptions):Promise<Buffer>;

	/**
		Determines the actual location of `path` using the same semantics as the `fs.realpath.native()` function then
		resolves the `Promise` with the resolved path.

		@see https://nodejs.org/api/fs.html#fs_fspromises_realpath_path_options
	**/
	@:overload(function(path:FsPath, ?options:String):Promise<String> {})
	@:overload(function(path:FsPath, ?options:String):Promise<Buffer> {})
	@:overload(function(path:FsPath, ?options:FsMkdtempOptions):Promise<String> {})
	static function realpath(path:FsPath, ?options:FsMkdtempOptions):Promise<Buffer>;

	/**
		Renames `oldPath` to `newPath` and resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_rename_oldpath_newpath
	**/
	static function rename(oldPath:FsPath, newPath:FsPath):Promise<Void>;

	/**
		The `Promise` is resolved with the `fs.Stats` object for the given `path`.

		@see https://nodejs.org/api/fs.html#fs_fspromises_stat_path_options
	**/
	static function stat(path:FsPath, ?options:FsFstatOptions):Promise<Stats>;

	/**
		Creates a symbolic link then resolves the `Promise` with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_symlink_target_path_type
	**/
	static function symlink(target:FsPath, path:FsPath, ?type:SymlinkType):Promise<Void>;

	/**
		Truncates the `path` then resolves the `Promise` with no arguments upon success.
		The `path` must be a string or `Buffer`.

		@see https://nodejs.org/api/fs.html#fs_fspromises_truncate_path_len
	**/
	static function truncate(path:FsPath, ?len:Int):Promise<Void>;

	/**
		Asynchronous `unlink(2)`.
		The `Promise` is resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_unlink_path
	**/
	static function unlink(path:FsPath):Promise<Void>;

	/**
		Change the file system timestamps of the object referenced by `path` then resolves the `Promise` with no
		arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_utimes_path_atime_mtime
	**/
	static function utimes(path:FsPath, atime:Time, mtime:Time):Promise<Void>;

	/**
		Asynchronously writes data to a file, replacing the file if it already exists.
		`data` can be a string or a buffer.
		The `Promise` will be resolved with no arguments upon success.

		@see https://nodejs.org/api/fs.html#fs_fspromises_writefile_file_data_options
	**/
	@:overload(function(filename:FsPath_, data:String, ?options:FsWriteFileOptions):Promise<Void> {})
	@:overload(function(filename:FsPath_, data:String, ?options:String):Promise<Void> {})
	@:overload(function(filename:FsPath_, data:Buffer, ?options:FsWriteFileOptions):Promise<Void> {})
	@:overload(function(filename:FsPath_, data:Buffer, ?options:String):Promise<Void> {})
	@:overload(function(filename:FsPath_, data:ArrayBufferView, ?options:FsWriteFileOptions):Promise<Void> {})
	static function writeFile(filename:FsPath_, data:ArrayBufferView, ?options:String):Promise<Void>;
}

typedef FsPath_ = EitherType<FsPath, FileHandle>
