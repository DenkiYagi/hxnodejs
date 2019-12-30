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

import js.node.url.URL;
import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.lib.ArrayBufferView;
import js.node.Buffer;
import js.node.fs.Dir;
import js.node.fs.Dirent;
import js.node.fs.Constants;
import js.node.fs.FSWatcher;
import js.node.fs.ReadStream;
import js.node.fs.WriteStream;
import js.node.fs.Stats;

/**
	The `fs` module provides an API for interacting with the file system in a manner closely modeled around standard
	POSIX functions.

	@see https://nodejs.org/api/fs.html#fs_file_system
**/
@:jsRequire("fs")
extern class Fs {
	/**
		Tests a user's permissions for the file or directory specified by `path`.

		@param mode FileAccessConstants
		@see https://nodejs.org/api/fs.html#fs_fs_access_path_mode_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Void):Void {})
	static function access(path:FsPath, mode:FsAccessMode, callback:Null<Error>->Void):Void;

	/**
		Synchronously tests a user's permissions for the file or directory specified by `path`.

		@param mode FileAccessConstants
		@see https://nodejs.org/api/fs.html#fs_fs_accesssync_path_mode
	**/
	@:overload(function(path:FsPath):Void {})
	static function accessSync(path:FsPath, mode:FsAccessMode):Void;

	/**
		Asynchronously append data to a file, creating the file if it does not yet exist.

		@see https://nodejs.org/api/fs.html#fs_fs_appendfile_path_data_options_callback
	**/
	@:overload(function(path:FsPathOrFD, data:EitherType<String, Buffer>, callback:Null<Error>->Void):Void {})
	static function appendFile(path:FsPathOrFD, data:EitherType<String, Buffer>, options:EitherType<String, FsWriteFileOptions>,
		callback:Null<Error>->Void):Void;

	/**
		Synchronously append data to a file, creating the file if it does not yet exist.

		@see https://nodejs.org/api/fs.html#fs_fs_appendfilesync_path_data_options
	**/
	@:overload(function(path:FsPathOrFD, data:EitherType<String, Buffer>):Void {})
	static function appendFileSync(path:FsPathOrFD, data:EitherType<String, Buffer>, ?options:EitherType<String, FsWriteFileOptions>):Void;

	/**
		Asynchronously changes the permissions of a file.

		@see https://nodejs.org/api/fs.html#fs_fs_chmod_path_mode_callback
	**/
	static function chmod(path:FsPath, mode:Int, callback:Null<Error>->Void):Void;

	/**
		For detailed information, see the documentation of the asynchronous version of this API: `fs.chmod()`.

		@see https://nodejs.org/api/fs.html#fs_fs_chmodsync_path_mode
	**/
	static function chmodSync(path:FsPath, mode:Int):Void;

	/**
		Asynchronously changes owner and group of a file.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_chown_path_uid_gid_callback
	**/
	static function chown(path:FsPath, uid:Int, gid:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronously changes owner and group of a file.
		Returns `undefined`.
		This is the synchronous version of `fs.chown()`.

		@see https://nodejs.org/api/fs.html#fs_fs_chownsync_path_uid_gid
	**/
	static function chownSync(path:FsPath, uid:Int, gid:Int):Void;

	/**
		Asynchronous `close(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_close_fd_callback
	**/
	static function close(fd:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `close(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_closesync_fd
	**/
	static function closeSync(fd:Int):Void;

	/**
		Returns an object containing commonly used constants for file system operations.
		The specific constants currently defined are described in [FS Constants](https://nodejs.org/api/fs.html#fs_fs_constants_1).

		@see https://nodejs.org/api/fs.html#fs_fs_constants
	 */
	static var constants(default, never):js.node.fs.Constants;

	/**
		Asynchronously copies `src` to `dest`.
		By default, `dest` is overwritten if it already exists.
		No arguments other than a possible exception are given to the callback function.
		Node.js makes no guarantees about the atomicity of the copy operation.
		If an error occurs after the destination file has been opened for writing, Node.js will attempt to remove the
		destination.

		@see https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_flags_callback
	**/
	@:overload(function(src:FsPath, dest:FsPath, callback:Null<Error>->Void):Void {})
	static function copyFile(src:FsPath, dest:FsPath, flags:FsCopyFlag, callback:Null<Error>->Void):Void;

	/**
		Synchronously copies `src` to `dest`.
		By default, dest is overwritten if it already exists.
		Returns `undefined`.
		Node.js makes no guarantees about the atomicity of the copy operation.
		If an error occurs after the destination file has been opened for writing, Node.js will attempt to remove the
		destination.

		@see https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_flags_callback
	**/
	@:overload(function(src:FsPath, dest:FsPath):Void {})
	static function copyFileSync(src:FsPath, dest:FsPath, flags:FsCopyFlag):Void;

	/**
		Unlike the 16 kb default `highWaterMark` for a readable stream, the stream returned by this method has a default
		`highWaterMark` of 64 kb.

		@see https://nodejs.org/api/fs.html#fs_fs_createreadstream_path_options
	**/
	@:overload(function(path:FsPath):ReadStream {})
	static function createReadStream(path:FsPath, options:EitherType<String, FsCreateReadStreamOptions>):ReadStream;

	/**
		`options` may also include a `start` option to allow writing data at some position past the beginning of the
		file, allowed values are in the `[0, Number.MAX_SAFE_INTEGER]` range.
		Modifying a file rather than replacing it may require a `flags` mode of `r+` rather than the default mode `w`.
		The `encoding` can be any one of those accepted by `Buffer`.

		@see https://nodejs.org/api/fs.html#fs_fs_createwritestream_path_options
	**/
	@:overload(function(path:FsPath):WriteStream {})
	static function createWriteStream(path:FsPath, options:EitherType<String, FsCreateWriteStreamOptions>):WriteStream;

	/**
		@see https://nodejs.org/api/fs.html#fs_fs_exists_path_callback
	**/
	@:deprecated
	static function exists(path:FsPath, callback:Bool->Void):Void;

	/**
		Returns `true` if the path exists, `false` otherwise.

		@see https://nodejs.org/api/fs.html#fs_fs_existssync_path
	**/
	static function existsSync(path:FsPath):Bool;

	/**
		Asynchronous `fchmod(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_fchmod_fd_mode_callback
	**/
	static function fchmod(fd:Int, mode:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `fchmod(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_fchmodsync_fd_mode
	**/
	static function fchmodSync(fd:Int, mode:Int):Void;

	/**
		Asynchronous `fchown(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_fchown_fd_uid_gid_callback
	**/
	static function fchown(fd:Int, uid:Int, gid:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `fchown(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_fchownsync_fd_uid_gid
	**/
	static function fchownSync(fd:Int, uid:Int, gid:Int):Void;

	/**
		Asynchronous `fdatasync(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_fdatasync_fd_callback
	**/
	static function fdatasync(fd:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `fdatasync(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_fdatasyncsync_fd
	**/
	static function fdatasyncSync(fd:Int):Void;

	/**
		Asynchronous `fstat(2)`.
		The callback gets two arguments `(err, stats)` where `stats` is an `fs.Stats` object.
		`fstat()` is identical to `stat()`, except that the file to be stat-ed is specified by the file descriptor `fd`.

		@see https://nodejs.org/api/fs.html#fs_fs_fstat_fd_options_callback
	**/
	@:overload(function(fd:Int, callback:Null<Error>->Stats->Void):Void {})
	static function fstat(fd:Int, options:FsFstatOptions, callback:Null<Error>->Stats->Void):Void;

	/**
		Synchronous `fstat(2)`.

		@see https://nodejs.org/api/fs.html#fs_fs_fstatsync_fd_options
	**/
	@:overload(function(fd:Int):Stats {})
	static function fstatSync(fd:Int, options:FsFstatOptions):Stats;

	/**
		Asynchronous `fsync(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_fsync_fd_callback
	**/
	static function fsync(fd:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `fsync(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_fsyncsync_fd
	**/
	static function fsyncSync(fd:Int):Void;

	/**
		Asynchronous `ftruncate(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_ftruncate_fd_len_callback
	**/
	@:overload(function(fd:Int, callback:Null<Error>->Void):Void {})
	static function ftruncate(fd:Int, len:Int, callback:Null<Error>->Void):Void;

	/**
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_ftruncatesync_fd_len
	**/
	@:overload(function(fd:Int):Void {})
	static function ftruncateSync(fd:Int, ?len:Int):Void;

	/**
		Change the file system timestamps of the object referenced by the supplied file descriptor.
		See `fs.utimes()`.

		@see https://nodejs.org/api/fs.html#fs_fs_futimes_fd_atime_mtime_callback
	**/
	static function futimes(fd:Int, atime:FsTime, mtime:FsTime, callback:Null<Error>->Void):Void;

	/**
		Synchronous version of `fs.futimes()`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_futimessync_fd_atime_mtime
	**/
	static function futimesSync(fd:Int, atime:FsTime, mtime:FsTime):Void;

	/**
		Asynchronous `lchmod(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_lchmod_path_mode_callback
	**/
	static function lchmod(path:FsPath, mode:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `lchmod(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_lchmodsync_path_mode
	**/
	static function lchmodSync(path:FsPath, mode:Int):Void;

	/**
		Asynchronous `lchown(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_lchown_path_uid_gid_callback
	**/
	static function lchown(path:FsPath, uid:Int, gid:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `lchown(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_lchownsync_path_uid_gid
	**/
	static function lchownSync(path:FsPath, uid:Int, gid:Int):Void;

	/**
		Asynchronous `link(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_link_existingpath_newpath_callback
	**/
	static function link(existingPath:FsPath, newPath:FsPath, callback:Null<Error>->Void):Void;

	/**
		Synchronous `link(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_linksync_existingpath_newpath
	**/
	static function linkSync(existingPath:FsPath, newPath:FsPath):Void;

	/**
		Asynchronous `lstat(2)`.
		The callback gets two arguments `(err, stats)` where `stats` is a `fs.Stats` object.
		`lstat()` is identical to `stat()`, except that if `path` is a symbolic link, then the link itself is stat-ed,
		not the file that it refers to.

		@see https://nodejs.org/api/fs.html#fs_fs_lstat_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Stats->Void):Void {})
	static function lstat(path:FsPath, options:FsFstatOptions, callback:Null<Error>->Stats->Void):Void;

	/**
		Synchronous `lstat(2)`.

		@see https://nodejs.org/api/fs.html#fs_fs_lstatsync_path_options
	**/
	@:overload(function(path:FsPath):Stats {})
	static function lstatSync(path:FsPath, options:FsFstatOptions):Stats;

	/**
		Asynchronously creates a directory.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_mkdir_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Void):Void {})
	static function mkdir(path:FsPath, options:FsMkdirOptions, callback:Null<Error>->Void):Void;

	/**
		Synchronously creates a directory.
		Returns `undefined`.
		This is the synchronous version of `fs.mkdir()`.

		@see https://nodejs.org/api/fs.html#fs_fs_mkdirsync_path_options
	**/
	@:overload(function(path:FsPath):Void {})
	static function mkdirSync(path:FsPath, ?options:FsMkdirOptions):Void;

	/**
		Creates a unique temporary directory.

		@see https://nodejs.org/api/fs.html#fs_fs_mkdtemp_prefix_options_callback
	**/
	@:overload(function(prefix:String, callback:Null<Error>->String->Void):Void {})
	static function mkdtemp(prefix:String, options:EitherType<String, FsMkdtempOptions>, callback:Null<Error>->String->Void):Void;

	/**
		Returns the created folder path.

		@see https://nodejs.org/api/fs.html#fs_fs_mkdtempsync_prefix_options
	**/
	@:overload(function(prefix:String):String {})
	static function mkdtempSync(prefix:String, options:EitherType<String, FsMkdtempOptions>):String;

	/**
		Asynchronous file open.
		See `open(2)`.

		@see https://nodejs.org/api/fs.html#fs_fs_open_path_flags_mode_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Int->Void):Void {})
	@:overload(function(path:FsPath, flags:EitherType<Int, FsOpenFlag>, callback:Null<Error>->Int->Void):Void {})
	static function open(path:FsPath, flags:EitherType<Int, FsOpenFlag>, mode:Int, callback:Null<Error>->Int->Void):Void;

	/**
		Asynchronously open a directory.
		See `opendir(3)`.

		@see https://nodejs.org/api/fs.html#fs_fs_opendir_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Dir->Void):Void {})
	static function opendir(path:FsPath, options:FsOpendirOptions, callback:Null<Error>->Dir->Void):Void;

	/**
		Synchronously open a directory.
		See `opendir(3)`.

		@see https://nodejs.org/api/fs.html#fs_fs_opendirsync_path_options
	**/
	@:overload(function(path:FsPath):Dir {})
	static function opendirSync(path:FsPath, options:FsOpendirOptions):Dir;

	/**
		Returns an integer representing the file descriptor.

		@see https://nodejs.org/api/fs.html#fs_fs_opensync_path_flags_mode
	**/
	@:overload(function(path:FsPath):Int {})
	@:overload(function(path:FsPath, flags:EitherType<Int, FsOpenFlag>):Int {})
	static function openSync(path:FsPath, flags:EitherType<Int, FsOpenFlag>, mode:Int):Int;

	/**
		Read data from the file specified by `fd`.

		@see https://nodejs.org/api/fs.html#fs_fs_read_fd_buffer_offset_length_position_callback
	**/
	@:overload(function(fd:Int, buffer:ArrayBufferView, offset:Int, length:Int, position:Null<Int>, callback:Null<Error>->Int->Buffer->Void):Void {})
	static function read(fd:Int, buffer:Buffer, offset:Int, length:Int, position:Null<Int>, callback:Null<Error>->Int->Buffer->Void):Void;

	/**
		Asynchronous `readdir(3)`.
		Reads the contents of a directory.
		The callback gets two arguments `(err, files)` where `files` is an array of the names of the files in the
		directory excluding `'.'` and `'..'`.

		@see https://nodejs.org/api/fs.html#fs_fs_readdir_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Array<String>->Void):Void {})
	static function readdir(path:FsPath, options:EitherType<String, FSReaddirOptions>,
		callback:Null<Error>->EitherType<Array<String>, EitherType<Array<Buffer>, Array<Dirent>>>->Void):Void;

	/**
		Synchronous `readdir(3).`

		@see https://nodejs.org/api/fs.html#fs_fs_readdirsync_path_options
	**/
	@:overload(function(path:FsPath):Array<String> {})
	static function readdirSync(path:FsPath, options:EitherType<String, FSReaddirOptions>):EitherType<Array<String>, EitherType<Array<Buffer>, Array<Dirent>>>;

	/**
		Asynchronously reads the entire contents of a file.

		@see https://nodejs.org/api/fs.html#fs_fs_readfile_path_options_callback
	**/
	@:overload(function(filename:FsPathOrFD, callback:Null<Error>->Buffer->Void):Void {})
	static function readFile(filename:FsPathOrFD, options:EitherType<String, FsReadFileOptions>, callback:Null<Error>->EitherType<String, Buffer>->Void):Void;

	/**
		Returns the contents of the `path`.

		@see https://nodejs.org/api/fs.html#fs_fs_readfilesync_path_options
	**/
	@:overload(function(filename:FsPath):Buffer {})
	static function readFileSync(filename:FsPath, options:EitherType<String, FsReadFileOptions>):EitherType<String, Buffer>;

	/**
		Asynchronous `readlink(2)`.
		The callback gets two arguments `(err, linkString)`.

		@see https://nodejs.org/api/fs.html#fs_fs_readlink_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->String->Void):Void {})
	static function readlink(path:FsPath, options:EitherType<String, FsMkdtempOptions>, callback:Null<Error>->EitherType<String, Buffer>->Void):Void;

	/**
		Synchronous `readlink(2)`.
		Returns the symbolic link's string value.

		@see https://nodejs.org/api/fs.html#fs_fs_readlinksync_path_options
	**/
	@:overload(function(path:FsPath):String {})
	static function readlinkSync(path:FsPath, options:EitherType<String, FsMkdtempOptions>):EitherType<String, Buffer>;

	/**
		Returns the number of `bytesRead`.

		@see https://nodejs.org/api/fs.html#fs_fs_readsync_fd_buffer_offset_length_position
	**/
	@:overload(function(fd:Int, buffer:Buffer, offset:Int, length:Int, position:Null<Int>):Int {})
	static function readSync(fd:Int, buffer:ArrayBufferView, offset:Int, length:Int, position:Null<Int>):Int;

	/**
		Asynchronously computes the canonical pathname by resolving `.`, `..` and symbolic links.

		@see https://nodejs.org/api/fs.html#fs_fs_realpath_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->String->Void):Void {})
	static function realpath(path:FsPath, options:EitherType<String, FsMkdtempOptions>, callback:Null<Error>->EitherType<String, Buffer>->Void):Void;

	/**
		Returns the resolved pathname.

		@see https://nodejs.org/api/fs.html#fs_fs_realpathsync_path_options
	**/
	@:overload(function(path:FsPath):String {})
	static function realpathSync(path:FsPath, options:EitherType<String, FsMkdtempOptions>):EitherType<String, Buffer>;

	/**
		Asynchronously rename file at `oldPath` to the pathname provided as `newPath`.
		In the case that `newPath` already exists, it will be overwritten.
		If there is a directory at `newPath`, an error will be raised instead.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_rename_oldpath_newpath_callback
	**/
	static function rename(oldPath:FsPath, newPath:FsPath, callback:Null<Error>->Void):Void;

	/**
		Synchronous `rename(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_renamesync_oldpath_newpath
	**/
	static function renameSync(oldPath:FsPath, newPath:FsPath):Void;

	/**
		Asynchronous `rmdir(2)`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_rmdir_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Void):Void {})
	static function rmdir(path:FsPath, options:FsRmdirOptions, callback:Null<Error>->Void):Void;

	/**
		Synchronous `rmdir(2)`.
		Returns undefined.

		@see https://nodejs.org/api/fs.html#fs_fs_rmdirsync_path_options
	**/
	@:overload(function(path:FsPath):Void {})
	static function rmdirSync(path:FsPath, options:FsRmdirOptions):Void;

	/**
		Asynchronous `stat(2)`.
		The callback gets two arguments `(err, stats)` where stats is an `fs.Stats` object.

		@see https://nodejs.org/api/fs.html#fs_fs_stat_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Stats->Void):Void {})
	static function stat(path:FsPath, options:FsFstatOptions, callback:Null<Error>->Stats->Void):Void;

	/**
		Synchronous `stat(2)`.

		@see https://nodejs.org/api/fs.html#fs_fs_statsync_path_options
	**/
	@:overload(function(path:FsPath):Stats {})
	static function statSync(path:FsPath, options:FsFstatOptions):Stats;

	/**
		Asynchronous `symlink(2)` which creates the link called `path` pointing to `target`.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_symlink_target_path_type_callback
	**/
	@:overload(function(target:FsPath, path:FsPath, callback:Null<Error>->Void):Void {})
	static function symlink(target:FsPath, path:FsPath, type:SymlinkType, callback:Null<Error>->Void):Void;

	/**
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_symlinksync_target_path_type
	**/
	@:overload(function(target:FsPath, path:FsPath):Void {})
	static function symlinkSync(target:FsPath, path:FsPath, type:SymlinkType):Void;

	/**
		Asynchronous `truncate(2)`.
		No arguments other than a possible exception are given to the completion callback.
		A file descriptor can also be passed as the first argument.
		In this case, `fs.ftruncate()` is called.

		@see https://nodejs.org/api/fs.html#fs_fs_truncate_path_len_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->Void):Void {})
	static function truncate(path:FsPath, len:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronous `truncate(2)`.
		Returns `undefined`.
		A file descriptor can also be passed as the first argument.
		In this case, `fs.ftruncateSync()` is called.

		@see https://nodejs.org/api/fs.html#fs_fs_truncatesync_path_len
	**/
	@:overload(function(path:FsPath):Void {})
	static function truncateSync(path:FsPath, len:Int):Void;

	/**
		Asynchronously removes a file or symbolic link.
		No arguments other than a possible exception are given to the completion callback.

		@see https://nodejs.org/api/fs.html#fs_fs_unlink_path_callback
	**/
	static function unlink(path:FsPath, callback:Null<Error>->Void):Void;

	/**
		Synchronous `unlink(2)`.
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_unlinksync_path
	**/
	static function unlinkSync(path:FsPath):Void;

	/**
		Stop watching for changes on `filename`.
		If `listener` is specified, only that particular listener is removed.
		Otherwise, all listeners are removed, effectively stopping watching of `filename`.

		@see https://nodejs.org/api/fs.html#fs_fs_unwatchfile_filename_listener
	**/
	@:overload(function(filename:FsPath):Void {})
	static function unwatchFile(filename:FsPath, listener:Stats->Stats->Void):Void;

	/**
		Change the file system timestamps of the object referenced by `path`.

		@see https://nodejs.org/api/fs.html#fs_fs_utimes_path_atime_mtime_callback
	**/
	static function utimes(path:FsPath, atime:FsTime, mtime:FsTime, callback:Null<Error>->Void):Void;

	/**
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_utimessync_path_atime_mtime
	**/
	static function utimesSync(path:FsPath, atime:FsTime, mtime:FsTime):Void;

	/**
		Watch for changes on `filename`, where `filename` is either a file or a directory.

		@see https://nodejs.org/api/fs.html#fs_fs_watch_filename_options_listener
	**/
	@:overload(function(filename:FsPath, listener:FSWatcherChangeType->EitherType<String, Buffer>->Void):FSWatcher {})
	static function watch(filename:FsPath, options:EitherType<String, FsWatchOptions>,
		listener:FSWatcherChangeType->EitherType<String, Buffer>->Void):FSWatcher;

	/**
		Watch for changes on `filename`.
		The callback `listener` will be called each time the file is accessed.

		@see https://nodejs.org/api/fs.html#fs_fs_watchfile_filename_options_listener
	**/
	#if haxe4
	@:overload(function(filename:FsPath, listener:(current:Stats, previous:Stats) -> Void):Void {})
	static function watchFile(filename:FsPath, options:FsWatchFileOptions, listener:(current:Stats, previous:Stats) -> Void):Void;
	#else
	@:overload(function(filename:FsPath, listener:Stats->Stats->Void):Void {})
	static function watchFile(filename:FsPath, options:FsWatchFileOptions, listener:Stats->Stats->Void):Void;
	#end

	/**
		Write `buffer` to the file specified by `fd`.

		@see https://nodejs.org/api/fs.html#fs_fs_write_fd_buffer_offset_length_position_callback
		@see https://nodejs.org/api/fs.html#fs_fs_write_fd_string_position_encoding_callback
	**/
	@:overload(function(fd:Int, buffer:Buffer, ?offset:Int, ?length:Int, ?position:Int, callback:Error->Int->Buffer->Void):Void {})
	@:overload(function(fd:Int, buffer:ArrayBufferView, ?offset:Int, ?length:Int, ?position:Int, callback:Error->Int->ArrayBufferView->Void):Void {})
	static function write(fd:Int, string:String, ?position:Int, ?encoding:String, callback:Error->Int->String->Void):Void;

	/**
		When `file` is a filename, asynchronously writes data to the file, replacing the file if it already exists.
		`data` can be a string or a buffer.

		@see https://nodejs.org/api/fs.html#fs_fs_writefile_file_data_options_callback
	**/
	@:overload(function(filename:FsPathOrFD, data:EitherType<String, EitherType<Buffer, ArrayBufferView>>, callback:Null<Error>->Void):Void {})
	static function writeFile(filename:FsPathOrFD, data:EitherType<String, EitherType<Buffer, ArrayBufferView>>,
		options:EitherType<String, FsWriteFileOptions>, callback:Null<Error>->Void):Void;

	/**
		Returns `undefined`.

		@see https://nodejs.org/api/fs.html#fs_fs_writefilesync_file_data_options
	**/
	@:overload(function(filename:FsPathOrFD, data:EitherType<String, EitherType<Buffer, ArrayBufferView>>):Void {})
	static function writeFileSync(filename:FsPathOrFD, data:EitherType<String, EitherType<Buffer, ArrayBufferView>>,
		options:EitherType<String, FsWriteFileOptions>):Void;

	/**
		For detailed information, see the documentation of the asynchronous version of this API:
		`fs.write(fd, buffer...)`.

		@see https://nodejs.org/api/fs.html#fs_fs_writesync_fd_buffer_offset_length_position
		@see https://nodejs.org/api/fs.html#fs_fs_writesync_fd_string_position_encoding
	**/
	@:overload(function(fd:Int, buffer:Buffer, ?offset:Int, ?length:Int, ?position:Int):Int {})
	@:overload(function(fd:Int, buffer:ArrayBufferView, ?offset:Int, ?length:Int, ?position:Int):Int {})
	static function writeSync(fd:Int, string:String, ?position:Int, ?encoding:String):Int;

	/**
		Write an array of `ArrayBufferViews` to the file specified by `fd` using `writev()`.

		@see https://nodejs.org/api/fs.html#fs_fs_writev_fd_buffers_position_callback
	**/
	@:overload(function(fd:Int, buffers:Array<ArrayBufferView>, callback:Null<Error>->Int->Array<ArrayBufferView>):Void {})
	static function writev(fd:Int, buffers:Array<ArrayBufferView>, position:Int, callback:Null<Error>->Int->Array<ArrayBufferView>):Void;

	/**
		For detailed information, see the documentation of the asynchronous version of this API: `fs.writev()`.

		@see https://nodejs.org/api/fs.html#fs_fs_writevsync_fd_buffers_position
	**/
	@:overload(function(fd:Int, buffers:Array<ArrayBufferView>):Int {})
	static function writevSync(fd:Int, buffers:Array<ArrayBufferView>, position:Int):Int;
}

typedef FsPath = EitherType<String, EitherType<Buffer, URL>>;
typedef FsPathOrFD = EitherType<FsPath, Int>;
typedef FsTime = EitherType<Int, EitherType<String, Date>>;

/**
	The following constants are meant for use with `Fs.access()`.
**/
@:enum abstract FsAccessMode(Int) {
	/**
		Flag indicating that the file is visible to the calling process.
		This is useful for determining if a file exists, but says nothing about `rwx` permissions.
		Default if no mode is specified.
	**/
	public static var F_OK(get, never):FsAccessMode;

	static extern inline function get_F_OK() {
		return cast Constants.F_OK;
	}

	/**
		Flag indicating that the file can be read by the calling process.
	**/
	public static var R_OK(get, never):FsAccessMode;

	static extern inline function get_R_OK() {
		return cast Constants.R_OK;
	}

	/**
		Flag indicating that the file can be written by the calling process.
	**/
	public static var W_OK(get, never):FsAccessMode;

	static extern inline function get_W_OK() {
		return cast Constants.W_OK;
	}

	/**
		Flag indicating that the file can be executed by the calling process.
		This has no effect on Windows (will behave like `fs.constants.F_OK`).
	**/
	public static var X_OK(get, never):FsAccessMode;

	static extern inline function get_X_OK() {
		return cast Constants.X_OK;
	}
}

/**
	The following constants are meant for use with `Fs.copyFile()`.
**/
@:enum abstract FsCopyFlag(Int) {
	/**
		If present, the copy operation will fail with an error if the destination path already exists.
	**/
	public static var COPYFILE_EXCL(get, never):FsCopyFlag;

	static extern inline function get_COPYFILE_EXCL() {
		return cast Constants.COPYFILE_EXCL;
	}

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then a fallback copy mechanism is used.
	**/
	public static var COPYFILE_FICLONE(get, never):FsCopyFlag;

	static extern inline function get_COPYFILE_FICLONE() {
		return cast Constants.COPYFILE_FICLONE;
	}

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then the operation will fail with an error.
	**/
	public static var COPYFILE_FICLONE_FORCE(get, never):FsCopyFlag;

	static extern inline function get_COPYFILE_FICLONE_FORCE() {
		return cast Constants.COPYFILE_FICLONE_FORCE;
	}
}

/**
	Options object used by `Fs.appendFile` and `Fs.writeFile`.
**/
typedef FsWriteFileOptions = {
	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:Null<String>;

	/**
		Default: `0o666`.
	**/
	@:optional var mode:Int;

	/**
		See support of file system flags.
	**/
	@:optional var flag:FsOpenFlag;
}

/**
	Enumeration of possible flags for opening file.

	@see https://nodejs.org/api/fs.html#fs_file_system_flags
**/
@:enum abstract FsOpenFlag(String) {
	/**
		Open file for appending.
		The file is created if it does not exist.
	**/
	var AppendCreate = "a";

	/**
		Like `'a'` but fails if the path exists.
	**/
	var AppendCheck = "ax";

	/**
		Open file for reading and appending.
		The file is created if it does not exist.
	 */
	var AppendReadCreate = "a+";

	/**
		Like `'a+'` but fails if the path exists.
	**/
	var AppendReadCheck = "ax+";

	/**
		Open file for appending in synchronous mode.
		The file is created if it does not exist.
	**/
	var AppendCreateSync = "as";

	/**
		Open file for reading and appending in synchronous mode.
		The file is created if it does not exist.
	**/
	var AppendReadCreateSync = "as+";

	/**
		Open file for reading.
		An exception occurs if the file does not exist.
	**/
	var Read = "r";

	/**
		Open file for reading and writing.
		An exception occurs if the file does not exist.
	**/
	var ReadWrite = "r+";

	/**
		Open file for reading and writing in synchronous mode.
		Instructs the operating system to bypass the local file system cache.
	**/
	var ReadWriteSync = "rs+";

	/**
		Open file for writing.
		The file is created (if it does not exist) or truncated (if it exists).
	**/
	var WriteCreate = "w";

	/**
		Like `'w'` but fails if the path exists.
	**/
	var WriteCheck = "wx";

	/**
		Open file for reading and writing.
		The file is created (if it does not exist) or truncated (if it exists).
	**/
	var WriteReadCreate = "w+";

	/**
		Like `'w+'` but fails if the path exists.
	**/
	var WriteReadCheck = "wx+";
}

/**
	Options object used by `Fs.createReadStream`.
**/
typedef FsCreateReadStreamOptions = {
	/**
		See support of file system `flags`.

		Default: `'r'`.
	**/
	@:optional var flags:FsOpenFlag;

	/**
		Default: `null`.
	**/
	@:optional var encoding:String;

	/**
		Default: `null`.
	**/
	@:optional var fd:Int;

	/**
		Default: `0o666`.
	**/
	@:optional var mode:Int;

	/**
		Default: `true`.
	**/
	@:optional var autoClose:Bool;

	/**
		Default: `false`.
	**/
	@:optional var emitClose:Bool;

	@:optional var start:Int;

	/**
		Default: `Infinity`.
	**/
	@:optional var end:Int;

	/**
		Default: `64 * 1024`.
	**/
	@:optional var highWaterMark:Int;
};

/**
	Options object used by `Fs.createWriteStream`.
**/
typedef FsCreateWriteStreamOptions = {
	/**
		See support of file system `flags`.

		Default: `'w'`.
	**/
	@:optional var flags:String;

	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:String;

	/**
		Default: `null`.
	**/
	@:optional var fd:Int;

	/**
		Default: `0o666`.
	**/
	@:optional var mode:Int;

	/**
		Default: `true`.
	**/
	@:optional var autoClose:Bool;

	/**
		Default: `false`.
	**/
	@:optional var emitClose:Bool;

	@:optional var start:Int;
}

/**
	Options object used by `Fs.fstat`, `Fs.lstat` and `Fs.stat`.
**/
typedef FsFstatOptions = {
	/**
		Whether the numeric values in the returned `fs.Stats` object should be bigint.

		Default: `false`.
	**/
	@:optional var bigint:Bool;
}

/**
	Options object used by `Fs.rmdir`.
**/
typedef FsRmdirOptions = {
	/**
		If an `EMFILE` error is encountered, Node.js will retry the operation with a linear backoff of 1ms longer
		on each try until the timeout duration passes this limit.
		This option is ignored if the recursive option is not true.

		Default: `1000`.
	**/
	@:optional var emfileWait:Int;

	/**
		If an `EBUSY`, `ENOTEMPTY`, or `EPERM` error is encountered,
		Node.js will retry the operation with a linear backoff wait of 100ms longer on each try.
		This option represents the number of retries.
		This option is ignored if the `recursive` option is not true.

		Default: `3`.
	**/
	@:optional var maxBusyTries:Int;

	/**
		If `true`, perform a recursive directory removal.
		In recursive mode, errors are not reported if `path` does not exist, and operations are retried on failure.

		Default: `false`.
	**/
	@:optional var recursive:Bool;
}

/**
	Options object used by `Fs.mkdir`.
**/
typedef FsMkdirOptions = {
	/**
		Default: `false`.
	**/
	@:optional var recursive:Bool;

	/**
		Not supported on Windows.

		Default: `0o777`.
	**/
	@:optional var mode:Int;
}

/**
	Options object used by `Fs.mkdtemp`, `Fs.readlink` and `Fs.realpath`.
**/
typedef FsMkdtempOptions = {
	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:String;
}

/**
	Options object used by `Fs.opendir`.
**/
typedef FsOpendirOptions = {
	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:Null<String>;

	/**
		Number of directory entries that are buffered internally when reading from the directory.
		Higher values lead to better performance but higher memory usage.

		Default: `32`.
	**/
	@:optional var bufferSize:Int;
}

/**
	Options object used by `Fs.readdir`.
**/
typedef FSReaddirOptions = {
	/**
		Default: `'utf8'`.
	**/
	@:optional var encoding:String;

	/**
		Default: `false`.
	**/
	@:optional var withFileTypes:Bool;
}

/**
	Options object used by `Fs.readFile`.
**/
typedef FsReadFileOptions = {
	/**
		Default: `null`.
	**/
	@:optional var encoding:Null<String>;

	/**
		See support of file system `flags`.

		Default: `'r'`.
	**/
	@:optional var flag:FsOpenFlag;
}

/**
	Enumeration of possible symlink types.
**/
@:enum abstract SymlinkType(String) from String to String {
	var Dir = "dir";
	var File = "file";
	var Junction = "junction";
}

/**
	Options object used by `Fs.watch`.
**/
typedef FsWatchOptions = {
	/**
		Indicates whether the process should continue to run as long as files are being watched.

		Default: `true`.
	**/
	@:optional var persistent:Bool;

	/**
		Indicates whether all subdirectories should be watched, or only the current directory.
		This applies when a directory is specified, and only on supported platforms (See Caveats).

		Default: `false`.
	**/
	@:optional var recursive:Bool;

	/**
		Specifies the character encoding to be used for the filename passed to the listener.

		Default: `'utf8'`.
	**/
	@:optional var encoding:String;
}

/**
	Options object used by `Fs.watchFile`.
**/
typedef FsWatchFileOptions = {
	/**
		Default: `true`.
	**/
	@:optional var persistent:Bool;

	/**
		Default: `5007`.
	**/
	@:optional var interval:Int;
}
