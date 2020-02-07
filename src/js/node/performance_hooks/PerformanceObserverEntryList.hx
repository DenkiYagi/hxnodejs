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
	The `PerformanceObserverEntryList` class is used to provide access to
	the `PerformanceEntry` instances passed to a `PerformanceObserver`.

	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_performanceobserverentrylist
**/
extern class PerformanceObserverEntryList {
	/**
		Returns a list of `PerformanceEntry` objects in chronological order
		with respect to `performanceEntry.startTime`.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceobserverentrylist_getentries
	**/
	public function getEntries():Array<PerformanceEntry>;

	/**
		Returns a list of `PerformanceEntry` objects in chronological order
		with respect to `performanceEntry.startTime` whose `performanceEntry.name` is equal to `name`,
		and optionally, whose `performanceEntry.entryType` is equal to `type`.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceobserverentrylist_getentriesbyname_name_type
	**/
	public function getEntriesByName(name:String, ?type:String):Array<PerformanceEntry>;

	/**
		Returns a list of `PerformanceEntry` objects in chronological order
		with respect to `performanceEntry.startTime` whose `performanceEntry.entryType` is equal to type.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceobserverentrylist_getentriesbytype_type
	**/
	public function getEntriesByType(type:String):Array<PerformanceEntry>;
}
