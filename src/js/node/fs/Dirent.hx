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
import js.node.Buffer;

/**
	A representation of a directory entry, as returned by reading from an `fs.Dir`.

	@see https://nodejs.org/api/fs.html#fs_class_fs_dirent
**/
@:jsRequire("fs", "Dirent")
extern class Dirent {
	/**
		Returns `true` if the `fs.Dirent` object describes a block device.

		@see https://nodejs.org/api/fs.html#fs_dirent_isblockdevice
	**/
	function isBlockDevice():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a character device.

		@see https://nodejs.org/api/fs.html#fs_dirent_ischaracterdevice
	**/
	function isCharacterDevice():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a file system directory.

		@see https://nodejs.org/api/fs.html#fs_dirent_isdirectory
	**/
	function isDirectory():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a first-in-first-out (FIFO) pipe.

		@see https://nodejs.org/api/fs.html#fs_dirent_isfifo
	**/
	function isFIFO():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a regular file.

		@see https://nodejs.org/api/fs.html#fs_dirent_isfile
	**/
	function isFile():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a socket.

		@see https://nodejs.org/api/fs.html#fs_dirent_issocket
	**/
	function isSocket():Bool;

	/**
		Returns `true` if the `fs.Dirent` object describes a symbolic link.

		@see https://nodejs.org/api/fs.html#fs_dirent_issymboliclink
	**/
	function isSymbolicLink():Bool;

	/**
		The file name that this `fs.Dirent` object refers to.
		The type of this value is determined by the `options.encoding` passed to `fs.readdir()` or `fs.readdirSync()`.

		@see https://nodejs.org/api/fs.html#fs_dirent_name
	**/
	var name(default, null):EitherType<String, Buffer>;
}
