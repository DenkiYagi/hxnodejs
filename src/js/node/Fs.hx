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
import haxe.DynamicAccess;
import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end
import js.node.Buffer;
import js.node.fs.Stats;
import js.node.fs.FSWatcher;
import js.node.fs.ReadStream;
import js.node.fs.WriteStream;

/**
	Possible options for `Fs.watchFile`.
**/
typedef FsWatchFileOptions = {
	/**
		indicates whether the process should continue to run as long as files are being watched
		default: true
	**/
	@:optional var persistent:Bool;

	/**
		indicates how often the target should be polled, in milliseconds
		default: 5007
	**/
	@:optional var interval:Int;
}

/**
	The `mode` argument used by `Fs.open` and related functions
	can be either an integer or a string with octal number.
**/
typedef FsMode = EitherType<Int, String>;

/**
	Enumeration of possible symlink types
**/
@:enum abstract SymlinkType(String) from String to String {
	var Dir = "dir";
	var File = "file";
	var Junction = "junction";
}

/**
	The `fs` module provides an API for interacting with the file system in a manner closely modeled around standard
	POSIX functions.

	@see https://nodejs.org/api/fs.html#fs_file_system
**/
@:jsRequire("fs")
extern class Fs {
	/**
		Tests a user's permissions for the file or directory specified by `path`.

		@see https://nodejs.org/api/fs.html#fs_fs_access_path_mode_callback
	**/
	static function access(path:FsPath, ?mode:Int, ?callback:Null<Error>->Void):Void;

	/**
		Synchronously tests a user's permissions for the file or directory specified by `path`.

		@see https://nodejs.org/api/fs.html#fs_fs_accesssync_path_mode
	**/
	static function accessSync(path:FsPath, ?mode:Int):Void;

	/**
		Asynchronously append data to a file, creating the file if it does not yet exist.

		@see https://nodejs.org/api/fs.html#fs_fs_appendfile_path_data_options_callback
	**/
	@:overload(function(path:FsPath_, data:String, ?options:FsWriteFileOptions, callback:Null<Error>->Void):Void {})
	@:overload(function(path:FsPath_, data:Buffer, ?options:FsWriteFileOptions, callback:Null<Error>->Void):Void {})
	@:overload(function(path:FsPath_, data:String, ?options:String, callback:Null<Error>->Void):Void {})
	static function appendFile(path:FsPath_, data:Buffer, ?options:String, callback:Null<Error>->Void):Void;

	/**
		Synchronously append data to a file, creating the file if it does not yet exist.

		@see https://nodejs.org/api/fs.html#fs_fs_appendfilesync_path_data_options
	**/
	@:overload(function(path:FsPath_, data:String, ?options:FsWriteFileOptions):Void {})
	@:overload(function(path:FsPath_, data:Buffer, ?options:FsWriteFileOptions):Void {})
	@:overload(function(path:FsPath_, data:String, ?options:String):Void {})
	static function appendFileSync(path:FsPath_, data:Buffer, ?options:String):Void;

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
		The specific constants currently defined are described in FS Constants.

		@see https://nodejs.org/api/fs.html#fs_fs_constants
	**/
	static var constants(default, null):FsConstants;

	/**
		Asynchronously copies `src` to `dest`.
		By default, `dest` is overwritten if it already exists.
		No arguments other than a possible exception are given to the callback function.
		Node.js makes no guarantees about the atomicity of the copy operation.
		If an error occurs after the destination file has been opened for writing, Node.js will attempt to remove the
		destination.

		@see https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_flags_callback
	**/
	static function copyFile(src:FsPath, dest:FsPath, ?flags:Int, callback:Null<Error>->Void):Void;

	/**
		Synchronously copies `src` to `dest`.
		By default, dest is overwritten if it already exists.
		Returns `undefined`.
		Node.js makes no guarantees about the atomicity of the copy operation.
		If an error occurs after the destination file has been opened for writing, Node.js will attempt to remove the
		destination.

		@see https://nodejs.org/api/fs.html#fs_fs_copyfile_src_dest_flags_callback
	**/
	static function copyFileSync(src:FsPath, dest:FsPath, ?flags:Int):Void;

	/**
		Unlike the 16 kb default `highWaterMark` for a readable stream, the stream returned by this method has a default
		`highWaterMark` of 64 kb.

		@see https://nodejs.org/api/fs.html#fs_fs_createreadstream_path_options
	**/
	@:overload(function(path:FsPath, ?options:String):ReadStream {})
	static function createReadStream(path:FsPath, ?options:FsCreateReadStreamOptions):ReadStream;

	/**
		`options` may also include a `start` option to allow writing data at some position past the beginning of the
		file, allowed values are in the `[0, Number.MAX_SAFE_INTEGER]` range.
		Modifying a file rather than replacing it may require a `flags` mode of `r+` rather than the default mode `w`.
		The `encoding` can be any one of those accepted by `Buffer`.

		@see https://nodejs.org/api/fs.html#fs_fs_createwritestream_path_options
	**/
	static function createWriteStream(path:FsPath, ?options:FsCreateWriteStreamOptions):WriteStream;

	/**
		Asynchronous rename(2).
	**/
	static function rename(oldPath:FsPath, newPath:FsPath, callback:Error->Void):Void;

	/**
		Synchronous rename(2).
	**/
	static function renameSync(oldPath:FsPath, newPath:FsPath):Void;

	/**
		Asynchronous ftruncate(2).
	**/
	static function ftruncate(fd:Int, len:Int, callback:Error->Void):Void;

	/**
		Synchronous ftruncate(2).
	**/
	static function ftruncateSync(fd:Int, len:Int):Void;

	/**
		Asynchronous truncate(2).
	**/
	static function truncate(path:FsPath, len:Int, callback:Error->Void):Void;

	/**
		Synchronous truncate(2).
	**/
	static function truncateSync(path:FsPath, len:Int):Void;

	/**
		Asynchronous fchown(2).
	**/
	static function fchown(fd:Int, uid:Int, gid:Int, callback:Error->Void):Void;

	/**
		Synchronous fchown(2).
	**/
	static function fchownSync(fd:Int, uid:Int, gid:Int):Void;

	/**
		Asynchronous lchown(2).
	**/
	static function lchown(path:FsPath, uid:Int, gid:Int, callback:Error->Void):Void;

	/**
		Synchronous lchown(2).
	**/
	static function lchownSync(path:FsPath, uid:Int, gid:Int):Void;

	/**
		Asynchronous fchmod(2).
	**/
	static function fchmod(fd:Int, mode:FsMode, callback:Error->Void):Void;

	/**
		Synchronous fchmod(2).
	**/
	static function fchmodSync(fd:Int, mode:FsMode):Void;

	/**
		Asynchronous lchmod(2).
		Only available on Mac OS X.
	**/
	static function lchmod(path:FsPath, mode:FsMode, callback:Error->Void):Void;

	/**
		Synchronous lchmod(2).
	**/
	static function lchmodSync(path:FsPath, mode:FsMode):Void;

	/**
		Asynchronous stat(2).
	**/
	static function stat(path:FsPath, callback:Error->Stats->Void):Void;

	/**
		Asynchronous lstat(2).

		lstat() is identical to stat(), except that if path is a symbolic link,
		then the link itself is stat-ed, not the file that it refers to.
	**/
	static function lstat(path:FsPath, callback:Error->Stats->Void):Void;

	/**
		Asynchronous fstat(2).

		fstat() is identical to stat(), except that the file to be stat-ed
		is specified by the file descriptor fd.
	**/
	static function fstat(fd:Int, callback:Error->Stats->Void):Void;

	/**
		Synchronous stat(2).
	**/
	static function statSync(path:FsPath):Stats;

	/**
		Synchronous lstat(2).
	**/
	static function lstatSync(path:FsPath):Stats;

	/**
		Synchronous fstat(2).
	**/
	static function fstatSync(fd:Int):Stats;

	/**
		Asynchronous link(2).
	**/
	static function link(srcpath:FsPath, dstpath:FsPath, callback:Error->Void):Void;

	/**
		Synchronous link(2).
	**/
	static function linkSync(srcpath:FsPath, dstpath:FsPath):Void;

	/**
		Asynchronous symlink(2).

		The `type` argument can be set to 'dir', 'file', or 'junction' (default is 'file')
		and is only available on Windows (ignored on other platforms). Note that Windows junction
		points require the destination path to be absolute. When using 'junction', the destination
		argument will automatically be normalized to absolute path.
	**/
	@:overload(function(srcpath:FsPath, dstpath:FsPath, callback:Error->Void):Void {})
	static function symlink(srcpath:FsPath, dstpath:FsPath, type:SymlinkType, callback:Error->Void):Void;

	/**
		Synchronous symlink(2).
	**/
	@:overload(function(srcpath:FsPath, dstpath:FsPath):Void {})
	static function symlinkSync(srcpath:FsPath, dstpath:FsPath, type:SymlinkType):Void;

	/**
		Asynchronous readlink(2).
	**/
	static function readlink(path:FsPath, callback:Error->String->Void):Void;

	/**
		Synchronous readlink(2).
		Returns the symbolic link's string value.
	**/
	static function readlinkSync(path:FsPath):String;

	/**
		Asynchronous realpath(2).

		The callback gets two arguments (err, resolvedPath).

		May use process.cwd to resolve relative paths.

		`cache` is an object literal of mapped paths that can be used to force a specific path resolution
		or avoid additional `stat` calls for known real paths.
	**/
	@:overload(function(path:FsPath, callback:Error->String->Void):Void {})
	static function realpath(path:FsPath, cache:DynamicAccess<String>, callback:Error->String->Void):Void;

	/**
		Synchronous realpath(2).
		Returns the resolved path.
	**/
	@:overload(function(path:FsPath):String {})
	static function realpathSync(path:FsPath, cache:DynamicAccess<String>):String;

	/**
		Asynchronous unlink(2).
	**/
	static function unlink(path:FsPath, callback:Error->Void):Void;

	/**
		Synchronous unlink(2).
	**/
	static function unlinkSync(path:FsPath):Void;

	/**
		Asynchronous rmdir(2).
	**/
	static function rmdir(path:FsPath, callback:Error->Void):Void;

	/**
		Synchronous rmdir(2).
	**/
	static function rmdirSync(path:FsPath):Void;

	/**
		Asynchronous mkdir(2).
		`mode` defaults to 0777.
	**/
	@:overload(function(path:FsPath, callback:Error->Void):Void {})
	static function mkdir(path:FsPath, mode:FsMode, callback:Error->Void):Void;

	/**
		Synchronous mkdir(2).
	**/
	static function mkdirSync(path:FsPath, ?mode:FsMode):Void;

	/**
		Creates a unique temporary directory.

		Generates six random characters to be appended behind a required `prefix` to create a unique temporary directory.

		The created folder path is passed as a string to the `callback`'s second parameter.
	**/
	static function mkdtemp(prefix:String, callback:Error->String->Void):Void;

	/**
		The synchronous version of `mkdtemp`.

		Returns the created folder path.
	**/
	static function mkdtempSync(template:String):String;

	/**
		Asynchronous readdir(3).
		Reads the contents of a directory.

		The callback gets two arguments (err, files) where files is an array of the
		names of the files in the directory excluding '.' and '..'.
	**/
	static function readdir(path:FsPath, callback:Error->Array<String>->Void):Void;

	/**
		Synchronous readdir(3).
		Returns an array of filenames excluding '.' and '..'.
	**/
	static function readdirSync(path:FsPath):Array<String>;

	/**
		Asynchronous file open. See open(2).

		See `FsOpenFlag` for description of possible `flags`.

		`mode` sets the file mode (permission and sticky bits), but only if the file was created.
		It defaults to 0666, readable and writeable.

		The `callback` gets two arguments (err, fd).
	**/
	@:overload(function(path:FsPath, flags:FsOpenFlag, callback:Error->Int->Void):Void {})
	static function open(path:FsPath, flags:FsOpenFlag, mode:FsMode, callback:Error->Int->Void):Void;

	/**
		Synchronous version of open().
	**/
	@:overload(function(path:FsPath, flags:FsOpenFlag):Int {})
	static function openSync(path:FsPath, flags:FsOpenFlag, mode:FsMode):Int;

	/**
		Change file timestamps of the file referenced by the supplied path.
	**/
	static function utimes(path:FsPath, atime:Date, mtime:Date, callback:Error->Void):Void;

	/**
		Change file timestamps of the file referenced by the supplied path.
	**/
	static function utimesSync(path:FsPath, atime:Date, mtime:Date):Void;

	/**
		Change the file timestamps of a file referenced by the supplied file descriptor.
	**/
	static function futimes(fd:Int, atime:Date, mtime:Date, callback:Error->Void):Void;

	/**
		Change the file timestamps of a file referenced by the supplied file descriptor.
	**/
	static function futimesSync(fd:Int, atime:Date, mtime:Date):Void;

	/**
		Asynchronous fsync(2).
	**/
	static function fsync(fd:Int, callback:Error->Void):Void;

	/**
		Synchronous fsync(2).
	**/
	static function fsyncSync(fd:Int):Void;

	/**
		Documentation for the overloads with the `buffer` argument:

		Write `buffer` to the file specified by `fd`.

		`offset` and `length` determine the part of the `buffer` to be written.

		`position` refers to the offset from the beginning of the file where this data should be written.
		If position is null, the data will be written at the current position. See pwrite(2).

		The `callback` will be given three arguments (err, written, buffer)
		where `written` specifies how many bytes were written from `buffer`.

		---

		Documentation for the overloads with the `data` argument:

		Write `data` to the file specified by `fd`. If `data` is not a `Buffer` instance then
		the value will be coerced to a string.

		`position` refers to the offset from the beginning of the file where this data should be written.
		If omitted, the data will be written at the current position. See pwrite(2).

		`encoding` is the expected string encoding.

		The `callback` will receive the arguments (err, written, string) where written specifies how many bytes
		the passed string required to be written. Note that bytes written is not the same as string characters.
		See `Buffer.byteLength`.

		Unlike when writing `buffer`, the entire string must be written. No substring may be specified.
		This is because the byte offset of the resulting data may not be the same as the string offset.

		---

		Common notes:

		Note that it is unsafe to use `write` multiple times on the same file without waiting for the callback.
		For this scenario, `createWriteStream` is strongly recommended.

		On Linux, positional writes don't work when the file is opened in append mode. The kernel ignores the position
		argument and always appends the data to the end of the file.
	**/
	@:overload(function(fd:Int, data:Dynamic, position:Int, encoding:String, callback:Error->Int->String->Void):Void {})
	@:overload(function(fd:Int, data:Dynamic, position:Int, callback:Error->Int->String->Void):Void {})
	@:overload(function(fd:Int, data:Dynamic, callback:Error->Int->String->Void):Void {})
	@:overload(function(fd:Int, buffer:Buffer, offset:Int, length:Int, callback:Error->Int->Buffer->Void):Void {})
	static function write(fd:Int, buffer:Buffer, offset:Int, length:Int, position:Int, callback:Error->Int->Buffer->Void):Void;

	/**
		Synchronous version of `write`. Returns the number of bytes written.
	**/
	@:overload(function(fd:Int, data:Dynamic, position:Int, encoding:String):Int {})
	@:overload(function(fd:Int, data:Dynamic, ?position:Int):Int {})
	static function writeSync(fd:Int, buffer:Buffer, offset:Int, length:Int, ?position:Int):Int;

	/**
		Read data from the file specified by `fd`.

		`buffer` is the buffer that the data will be written to.

		`offset` is the offset in the `buffer` to start writing at.

		`length` is an integer specifying the number of bytes to read.

		`position` is an integer specifying where to begin reading from in the file.
		If position is null, data will be read from the current file position.

		The `callback` is given the three arguments, (err, bytesRead, buffer).
	**/
	static function read(fd:Int, buffer:Buffer, offset:Int, length:Int, position:Null<Int>, callback:Error->Int->Buffer->Void):Void;

	/**
		Synchronous version of `read`. Returns the number of bytes read.
	**/
	static function readSync(fd:Int, buffer:Buffer, offset:Int, length:Int, position:Null<Int>):Int;

	/**
		Asynchronously reads the entire contents of a file.

		The `callback` is passed two arguments (err, data), where data is the contents of the file.
		If no `encoding` is specified, then the raw buffer is returned.

		If `options` is a string, then it specifies the encoding.
	**/
	@:overload(function(filename:FsPath, callback:Error->Buffer->Void):Void {})
	@:overload(function(filename:FsPath, options:{flag:FsOpenFlag}, callback:Error->Buffer->Void):Void {})
	@:overload(function(filename:FsPath, options:String, callback:Error->String->Void):Void {})
	static function readFile(filename:FsPath, options:{encoding:String, ?flag:FsOpenFlag}, callback:Error->String->Void):Void;

	/**
		Synchronous version of `readFile`. Returns the contents of the filename.
		If the `encoding` option is specified then this function returns a string. Otherwise it returns a buffer.
	**/
	@:overload(function(filename:FsPath):Buffer {})
	@:overload(function(filename:FsPath, options:{flag:FsOpenFlag}):Buffer {})
	@:overload(function(filename:FsPath, options:String):String {})
	static function readFileSync(filename:FsPath, options:{encoding:String, ?flag:FsOpenFlag}):String;

	/**
		Asynchronously writes data to a file, replacing the file if it already exists.

		`data` can be a string or a buffer.

		The encoding option is ignored if data is a buffer. It defaults to 'utf8'.
	**/
	@:overload(function(filename:FsPath, data:Buffer, callback:Error->Void):Void {})
	@:overload(function(filename:FsPath, data:String, callback:Error->Void):Void {})
	@:overload(function(filename:FsPath, data:Buffer, options:EitherType<String, FsWriteFileOptions>, callback:Error->Void):Void {})
	static function writeFile(filename:FsPath, data:String, options:EitherType<String, FsWriteFileOptions>, callback:Error->Void):Void;

	/**
		The synchronous version of `writeFile`.
	**/
	@:overload(function(filename:FsPath, data:Buffer):Void {})
	@:overload(function(filename:FsPath, data:String):Void {})
	@:overload(function(filename:FsPath, data:Buffer, options:EitherType<String, FsWriteFileOptions>):Void {})
	static function writeFileSync(filename:FsPath, data:String, options:EitherType<String, FsWriteFileOptions>):Void;

	/**
		Unstable. Use `watch` instead, if possible.

		Watch for changes on `filename`.
		The callback `listener` will be called each time the file is accessed.

		The `options` if provided should be an object containing two members:
			- `persistent` indicates whether the process should continue to run as long as files are being watched.
			- `interval` indicates how often the target should be polled, in milliseconds.
		The default is { persistent: true, interval: 5007 }.

		The `listener` gets two arguments: the current stat object and the previous stat object.
	**/
	@:overload(function(filename:FsPath, listener:Stats->Stats->Void):Void {})
	static function watchFile(filename:FsPath, options:FsWatchFileOptions, listener:Stats->Stats->Void):Void;

	/**
		Unstable. Use `watch` instead, if possible.

		Stop watching for changes on filename.
		If `listener` is specified, only that particular listener is removed.
		Otherwise, all listeners are removed and you have effectively stopped watching filename.
		Calling `unwatchFile` with a `filename` that is not being watched is a no-op, not an error.
	**/
	static function unwatchFile(filename:FsPath, ?listener:Stats->Stats->Void):Void;

	/**
		Watch for changes on `filename`, where filename is either a file or a directory.

		`persistent` indicates whether the process should continue to run as long as files are being watched. Default is `true`.

		The `listener` callback gets two arguments (event, filename). event is either 'rename' or 'change', and filename
		is the name of the file which triggered the event.
	**/
	@:overload(function(filename:FsPath):FSWatcher {})
	@:overload(function(filename:FsPath, options:{persistent:Bool, ?recursive:Bool}, listener:FSWatcherChangeType->String->Void):FSWatcher {})
	static function watch(filename:FsPath, listener:FSWatcherChangeType->FsPath->Void):FSWatcher;

	/**
		Test whether or not the given `path` exists by checking with the file system.
		Then call the `callback` argument with either `true` or `false`.

		`exists` is an anachronism and exists only for historical reasons.
		There should almost never be a reason to use it in your own code.

		In particular, checking if a file exists before opening it is an anti-pattern that leaves you vulnerable to race conditions:
		another process may remove the file between the calls to `exists` and `open`.

		Just open the file and handle the error when it's not there.
	**/
	@:deprecated("Use Fs.stat or Fs.access instead")
	static function exists(path:FsPath, callback:Bool->Void):Void;

	/**
		Synchronous version of `exists`.
	**/
	static function existsSync(path:FsPath):Bool;

	/**
		A mode flag for `access` and `accessSync` methods:

		File is visible to the calling process.
		This is useful for determining if a file exists, but says nothing about rwx permissions.
	**/
	static var F_OK(default, null):Int;

	/**
		A mode flag for `access` and `accessSync` methods:

		File can be read by the calling process.
	**/
	static var R_OK(default, null):Int;

	/**
		A mode flag for `access` and `accessSync` methods:

		File can be written by the calling process.
	**/
	static var W_OK(default, null):Int;

	/**
		A mode flag for `access` and `accessSync` methods:

		File can be executed by the calling process.
		This has no effect on Windows.
	**/
	static var X_OK(default, null):Int;
}

/**
	The following constants are exported by fs.constants.

	@see https://nodejs.org/api/fs.html#fs_fs_constants_1
**/
typedef FsConstants = {
	/**
		Flag indicating that the file is visible to the calling process.
		This is useful for determining if a file exists, but says nothing about `rwx` permissions.
		Default if no mode is specified.
	**/
	var F_OK:Int;

	/**
		Flag indicating that the file can be read by the calling process.
	**/
	var R_OK:Int;

	/**
		Flag indicating that the file can be written by the calling process.
	**/
	var W_OK:Int;

	/**
		Flag indicating that the file can be executed by the calling process.
		This has no effect on Windows (will behave like `fs.constants.F_OK`).
	**/
	var X_OK:Int;

	/**
		If present, the copy operation will fail with an error if the destination path already exists.
	**/
	var COPYFILE_EXCL:Int;

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then a fallback copy mechanism is used.
	**/
	var COPYFILE_FICLONE:Int;

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then the operation will fail with an error.
	**/
	var COPYFILE_FICLONE_FORCE:Int;

	/**
		Flag indicating to open a file for read-only access.
	**/
	var O_RDONLY:Int;

	/**
		Flag indicating to open a file for write-only access.
	**/
	var O_WRONLY:Int;

	/**
		Flag indicating to open a file for read-write access.
	**/
	var O_RDWR:Int;

	/**
		Flag indicating to create the file if it does not already exist.
	**/
	var O_CREAT:Int;

	/**
		Flag indicating that opening a file should fail if the `O_CREAT` flag is set and the file already exists.
	**/
	var O_EXCL:Int;

	/**
		Flag indicating that if path identifies a terminal device, opening the path shall not cause that terminal to
		become the controlling terminal for the process (if the process does not already have one).
	**/
	var O_NOCTTY:Int;

	/**
		Flag indicating that if the file exists and is a regular file, and the file is opened successfully for write
		access, its length shall be truncated to zero.
	**/
	var O_TRUNC:Int;

	/**
		Flag indicating that data will be appended to the end of the file.
	**/
	var O_APPEND:Int;

	/**
		Flag indicating that the open should fail if the path is not a directory.
	**/
	var O_DIRECTORY:Int;

	/**
		Flag indicating reading accesses to the file system will no longer result in an update to the `atime`
		information associated with the file.
		This flag is available on Linux operating systems only.
	**/
	var O_NOATIME:Int;

	/**
		Flag indicating that the open should fail if the path is a symbolic link.
	**/
	var O_NOFOLLOW:Int;

	/**
		Flag indicating that the file is opened for synchronized I/O with write operations waiting for file integrity.
	**/
	var O_SYNC:Int;

	/**
		Flag indicating that the file is opened for synchronized I/O with write operations waiting for data integrity.
	**/
	var O_DSYNC:Int;

	/**
		Flag indicating to open the symbolic link itself rather than the resource it is pointing to.
	**/
	var O_SYMLINK:Int;

	/**
		When set, an attempt will be made to minimize caching effects of file I/O.
	**/
	var O_DIRECT:Int;

	/**
		Flag indicating to open the file in nonblocking mode when possible.
	**/
	var O_NONBLOCK:Int;

	/**
		When set, a memory file mapping is used to access the file.
		This flag is available on Windows operating systems only.
		On other operating systems, this flag is ignored.
	**/
	var UV_FS_O_FILEMAP:Int;

	/**
		Bit mask used to extract the file type code.
	**/
	var S_IFMT:Int;

	/**
		File type constant for a regular file.
	**/
	var S_IFREG:Int;

	/**
		File type constant for a directory.
	**/
	var S_IFDIR:Int;

	/**
		File type constant for a character-oriented device file.
	**/
	var S_IFCHR:Int;

	/**
		File type constant for a block-oriented device file.
	**/
	var S_IFBLK:Int;

	/**
		File type constant for a FIFO/pipe.
	**/
	var S_IFIFO:Int;

	/**
		File type constant for a symbolic link.
	**/
	var S_IFLNK:Int;

	/**
		File type constant for a socket.
	**/
	var S_IFSOCK:Int;

	/**
		File mode indicating readable, writable, and executable by owner.
	**/
	var S_IRWXU:Int;

	/**
		File mode indicating readable by owner.
	**/
	var S_IRUSR:Int;

	/**
		File mode indicating writable by owner.
	**/
	var S_IWUSR:Int;

	/**
		File mode indicating executable by owner.
	**/
	var S_IXUSR:Int;

	/**
		File mode indicating readable, writable, and executable by group.
	**/
	var S_IRWXG:Int;

	/**
		File mode indicating readable by group.
	**/
	var S_IRGRP:Int;

	/**
		File mode indicating writable by group.
	**/
	var S_IWGRP:Int;

	/**
		File mode indicating executable by group.
	**/
	var S_IXGRP:Int;

	/**
		File mode indicating readable, writable, and executable by others.
	**/
	var S_IRWXO:Int;

	/**
		File mode indicating readable by others.
	**/
	var S_IROTH:Int;

	/**
		File mode indicating writable by others.
	**/
	var S_IWOTH:Int;

	/**
		File mode indicating executable by others.
	**/
	var S_IXOTH:Int;
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
	Most FS functions now support passing `String` and `Buffer`.
	This type is used for path arguments and allows passing either of those.
**/
typedef FsPath = EitherType<String, EitherType<Buffer, URL>>;

typedef FsPath_ = EitherType<FsPath, Int>;

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
		Default: `'a'`.
	**/
	@:optional var flag:FsOpenFlag;
}

/**
	Enumeration of possible flags for opening file.

	@see https://nodejs.org/api/fs.html#fs_file_system_flags
**/
@:enum abstract FsOpenFlag(String) from String to String {
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
