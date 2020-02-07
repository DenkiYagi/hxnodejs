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
	Provides timing details for Node.js itself.

	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_performancenodetiming_extends_performanceentry
**/
extern class PerformanceNodeTiming extends PerformanceEntry {
	/**
		The high resolution millisecond timestamp at which the Node.js process completed bootstrapping.
		If bootstrapping has not yet finished, the property has the value of -1.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_bootstrapcomplete
	**/
	public var bootstrapComplete(default, never):Int;

	/**
		The high resolution millisecond timestamp at which the Node.js environment was initialized.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_environment
	**/
	public var environment(default, never):Int;

	/**
		The high resolution millisecond timestamp at which the Node.js event loop exited.
		If the event loop has not yet exited, the property has the value of -1.
		It can only have a value of not -1 in a handler of the `'exit'` event.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_loopexit
	**/
	public var loopExit(default, never):Int;

	/**
		The high resolution millisecond timestamp at which the Node.js event loop started.
		If the event loop has not yet started (e.g., in the first tick of the main script),
		the property has the value of -1.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_loopstart
	**/
	public var loopStart(default, never):Int;

	/**
		The high resolution millisecond timestamp at which the Node.js process was initialized.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_nodestart
	**/
	public var nodeStart(default, never):Int;

	/**
		The high resolution millisecond timestamp at which the V8 platform was initialized.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performancenodetiming_v8start
	**/
	public var v8Start(default, never):Int;
}
