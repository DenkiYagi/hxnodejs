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
	Tracks the event loop delay at a given sampling rate.

	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_histogram
**/
extern class Histogram {
	/**
		Disables the event loop delay sample timer.
		Returns `true` if the timer was stopped, `false` if it was already stopped.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_disable
	**/
	public function disable():Bool;

	/**
		Enables the event loop delay sample timer.
		Returns `true` if the timer was started, `false` if it was already started.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_enable
	**/
	public function enable():Bool;

	/**
		The number of times the event loop delay exceeded the maximum 1 hour event loop delay threshold.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_exceeds
	**/
	public var exceeds(default, never):Int;

	/**
		The maximum recorded event loop delay.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_max
	**/
	public var max(default, never):Int;

	/**
		The mean of the recorded event loop delays.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_mean
	**/
	public var mean(default, never):Int;

	/**
		The minimum recorded event loop delay.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_min
	**/
	public var min(default, never):Int;

	/**
		Returns the value at the given percentile.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_percentile_percentile
	**/
	public function percentile(percentile:Int):Int;

	/**
		Returns a Map object detailing the accumulated percentile distribution.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_percentiles
	**/
	public var percentiles(default, never):Map<Int, Int>;

	/**
		Resets the collected histogram data.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_reset
	**/
	public function reset():Void;

	/**
		The standard deviation of the recorded event loop delays.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_histogram_stddev
	**/
	public var stddev(default, never):Int;
}
