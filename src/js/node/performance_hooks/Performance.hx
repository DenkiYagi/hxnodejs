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
	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_performance
**/
extern class Performance {
	/**
		If `name` is not provided, removes all `PerformanceMark` objects from the Performance Timeline.
		If `name` is provided, removes only the named mark.
	**/
	public function clearMarks(?name:String):Void;

	/**
		Creates a new `PerformanceMark` entry in the Performance Timeline.
		A `PerformanceMark` is a subclass of `PerformanceEntry` whose `performanceEntry.entryType` is always `'mark'`,
		and whose `performanceEntry.duration` is always `0`.
		Performance marks are used to mark specific significant moments in the Performance Timeline.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_mark_name
	**/
	public function mark(?name:String):Void;

	/**
		Creates a new `PerformanceMeasure` entry in the Performance Timeline.
		A `PerformanceMeasure` is a subclass of `PerformanceEntry` whose `performanceEntry.entryType` is always `'measure'`,
		and whose `performanceEntry.duration` measures the number of milliseconds
		elapsed since `startMark` and `endMark`.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_measure_name_startmark_endmark
	**/
	public function measure():Void;

	/**
		An instance of the `PerformanceNodeTiming` class that provides performance metrics
		for specific Node.js operational milestones.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_nodetiming
	**/
	public var nodeTiming(default, never):PerformanceNodeTiming;

	/**
		Returns the current high resolution millisecond timestamp,
		where 0 represents the start of the current `node` process.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_now
	**/
	public function now():Int;

	/**
		The `timeOrigin` specifies the high resolution millisecond timestamp at which the current `node` process began,
		measured in Unix time.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_timeorigin
	**/
	public var timeOrigin(default, never):Int;

	/**
		Wraps a function within a new function that measures the running time of the wrapped function.
		A `PerformanceObserver` must be subscribed to the `'function'` event type
		in order for the timing details to be accessed.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_timerify_fn
	**/
	public function timerify(fn:haxe.Constraints.Function):Void;
}
