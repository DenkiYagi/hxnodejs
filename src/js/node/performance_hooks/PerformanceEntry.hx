/*
 * Copyright (C)2014-2020 Haxe Foundation
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

package js.node.performance_hooks;

/**
	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_performanceentry
**/
extern class PerformanceEntry {
	/**
		The total number of milliseconds elapsed for this entry.
		This value will not be meaningful for all Performance Entry types.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceentry_duration
	**/
	public var duration(default, never):Int;

	/**
		The name of the performance entry.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceentry_name
	**/
	public var name(default, never):String;

	/**
		The high resolution millisecond timestamp marking the starting time of the Performance Entry.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceentry_starttime
	**/
	public var startTime(default, never):Int;

	/**
		The type of the performance entry.
		Currently it may be one of: `'node'`, `'mark'`, `'measure'`, `'gc'`, `'function'`, `'http2'` or `'http'`.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceentry_entrytype
	**/
	public var entryType(default, never):String;

	/**
		When `performanceEntry.entryType` is equal to `'gc'`,
		the performance.kind property identifies the type of garbage collection operation that occurred.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceentry_kind
	**/
	public var kind(default, never):Int;
}
