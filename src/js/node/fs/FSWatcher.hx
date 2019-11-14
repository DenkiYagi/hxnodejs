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

import js.node.events.EventEmitter;
import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of possible types of changes for `'change'` event.
**/
@:enum abstract FSWatcherChangeType(String) from String to String {
	var Change = "change";
	var Rename = "rename";
}

/**
	Enumeration of events emitted by the `FSWatcher` objects.
**/
@:enum abstract FSWatcherEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted when something changes in a watched directory or file.
		See more details in `fs.watch()`.

		@see https://nodejs.org/api/fs.html#fs_event_change
	**/
	var Change:FSWatcherEvent<FSWatcherChangeType->EitherType<String, Buffer>->Void> = "change";
	
	/**
		Emitted when the watcher stops watching for changes.
		The closed `fs.FSWatcher` object is no longer usable in the event handler.

		@see https://nodejs.org/api/fs.html#fs_event_close
	**/
	var Close:FSWatcherEvent<Void->Void> = "close";

	/**
		Emitted when an error occurs while watching the file.
		The errored `fs.FSWatcher` object is no longer usable in the event handler.

		@see https://nodejs.org/api/fs.html#fs_event_error
	**/
	var Error:FSWatcherEvent<Error->Void> = "error";
}

/**
	A successful call to `fs.watch()` method will return a new `fs.FSWatcher` object.

	@see https://nodejs.org/api/fs.html#fs_class_fs_fswatcher
**/
@:jsRequire("fs", "FSWatcher")
extern class FSWatcher extends EventEmitter<FSWatcher> {
	/**
		Stop watching for changes on the given `fs.FSWatcher`.
		Once stopped, the `fs.FSWatcher` object is no longer usable.

		@see https://nodejs.org/api/fs.html#fs_watcher_close
	**/
	function close():Void;
}
