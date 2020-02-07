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

package js.node;

import js.node.performance_hooks.Histogram;
import js.node.performance_hooks.Performance;

/**
	The Performance Timing API provides an implementation of the `W3C Performance Timeline` specification.
	The purpose of the API is to support collection of high resolution performance metrics.
	This is the same Performance API as implemented in modern Web browsers.

	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performance_timing_api
**/
@:jsRequire("perf_hooks")
extern class PerformanceHooks {
	static public var performance:Performance;

	/**
		Creates a `Histogram` object that samples and reports the event loop delay over time.
		The delays will be reported in nanoseconds.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_perf_hooks_monitoreventloopdelay_options
	**/
	public function monitorEventLoopDelay(?options:{resolution:Int}):Histogram;
}
