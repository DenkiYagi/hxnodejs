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

/**
	A `fs.Stats` object provides information about a file.

	@see https://nodejs.org/api/fs.html#fs_class_fs_stats
**/
@:jsRequire("fs", "Stats")
extern class Stats {
	/**
		Returns `true` if the `fs.Stats` object describes a block device.

		@see https://nodejs.org/api/fs.html#fs_stats_isblockdevice
	**/
	function isBlockDevice():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a character device.

		@see https://nodejs.org/api/fs.html#fs_stats_ischaracterdevice
	**/
	function isCharacterDevice():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a file system directory.

		@see https://nodejs.org/api/fs.html#fs_stats_isdirectory
	**/
	function isDirectory():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a first-in-first-out (FIFO) pipe.

		@see https://nodejs.org/api/fs.html#fs_stats_isfifo
	**/
	function isFIFO():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a regular file.

		@see https://nodejs.org/api/fs.html#fs_stats_isfile
	**/
	function isFile():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a socket.

		@see https://nodejs.org/api/fs.html#fs_stats_issocket
	**/
	function isSocket():Bool;

	/**
		Returns `true` if the `fs.Stats` object describes a symbolic link.

		@see https://nodejs.org/api/fs.html#fs_stats_issymboliclink
	**/
	function isSymbolicLink():Bool;

	/**
		The numeric identifier of the device containing the file.

		@see https://nodejs.org/api/fs.html#fs_stats_dev
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var dev(default, null):Int;

	/**
		The file system specific "Inode" number for the file.

		@see https://nodejs.org/api/fs.html#fs_stats_ino
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var ino(default, null):Int;

	/**
		A bit-field describing the file type and mode.

		@see https://nodejs.org/api/fs.html#fs_stats_mode
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var mode(default, null):Int;

	/**
		The number of hard-links that exist for the file.

		@see https://nodejs.org/api/fs.html#fs_stats_nlink
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var nlink(default, null):Int;

	/**
		The numeric user identifier of the user that owns the file (POSIX).

		@see https://nodejs.org/api/fs.html#fs_stats_uid
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var uid(default, null):Int;

	/**
		The numeric group identifier of the group that owns the file (POSIX).

		@see https://nodejs.org/api/fs.html#fs_stats_gid
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var gid(default, null):Int;

	/**
		A numeric device identifier if the file is considered "special".

		@see https://nodejs.org/api/fs.html#fs_stats_rdev
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var rdev(default, null):Int;

	/**
		The size of the file in bytes.

		@see https://nodejs.org/api/fs.html#fs_stats_size
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var size(default, null):Int;

	/**
		The file system block size for i/o operations.

		@see https://nodejs.org/api/fs.html#fs_stats_blksize
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var blksize(default, null):Int;

	/**
		The number of blocks allocated for this file.

		@see https://nodejs.org/api/fs.html#fs_stats_blocks
	**/
	// TODO: If bigint is implemented, change to EitherType<Int, BigInt>.
	var blocks(default, null):Int;

	/**
		The timestamp indicating the last time this file was accessed expressed in milliseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_atimems
	**/
	// TODO: If bigint is implemented, change to EitherType<Float, BigInt>.
	var atimeMs(default, null):Float;

	/**
		The timestamp indicating the last time this file was modified expressed in milliseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_mtimems
	**/
	// TODO: If bigint is implemented, change to EitherType<Float, BigInt>.
	var mtimeMs(default, null):Float;

	/**
		The timestamp indicating the last time the file status was changed expressed in milliseconds since the POSIX
		Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_ctimems
	**/
	// TODO: If bigint is implemented, change to EitherType<Float, BigInt>.
	var ctimeMs(default, null):Float;

	/**
		https://nodejs.org/api/fs.html#fs_stats_birthtimems

		@see https://nodejs.org/api/fs.html#fs_stats_birthtimems
	**/
	// TODO: If bigint is implemented, change to EitherType<Float, BigInt>.
	var birthtimeMs(default, null):Float;

	/**
		Only present when `bigint: true` is passed into the method that generates the object.
		The timestamp indicating the last time this file was accessed expressed in nanoseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_atimens
	**/
	// TODO: If bigint is implemented, change to BigInt.
	var atimeNs(default, null):Dynamic;

	/**
		Only present when `bigint: true` is passed into the method that generates the object.
		The timestamp indicating the last time this file was modified expressed in nanoseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_mtimens
	**/
	// TODO: If bigint is implemented, change to BigInt.
	var mtimeNs(default, null):Dynamic;

	/**
		Only present when `bigint: true` is passed into the method that generates the object.
		The timestamp indicating the last time the file status was changed
		expressed in nanoseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_ctimens
	**/
	// TODO: If bigint is implemented, change to BigInt.
	var ctimeNs(default, null):Dynamic;

	/**
		Only present when `bigint: true` is passed into the method that generates the object.
		The timestamp indicating the creation time of this file expressed in nanoseconds since the POSIX Epoch.

		@see https://nodejs.org/api/fs.html#fs_stats_birthtimens
	**/
	// TODO: If bigint is implemented, change to BigInt.
	var birthtimeNs(default, null):Dynamic;

	/**
		The timestamp indicating the last time this file was accessed.

		@see https://nodejs.org/api/fs.html#fs_stats_atime
	**/
	var atime(default, null):Date;

	/**
		The timestamp indicating the last time this file was modified.

		@see https://nodejs.org/api/fs.html#fs_stats_mtime
	**/
	var mtime(default, null):Date;

	/**
		The timestamp indicating the last time the file status was changed.

		@see https://nodejs.org/api/fs.html#fs_stats_ctime
	**/
	var ctime(default, null):Date;

	/**
		The timestamp indicating the creation time of this file.

		@see https://nodejs.org/api/fs.html#fs_stats_birthtime
	**/
	var birthtime(default, null):Date;
}
