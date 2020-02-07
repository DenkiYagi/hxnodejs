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
	@see https://nodejs.org/api/perf_hooks.html#perf_hooks_class_performanceobserver
**/
extern class PerformanceObserver {
	/**
		`PerformanceObserver` objects provide notifications
		when new `PerformanceEntry` instances have been added to the Performance Timeline.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_new_performanceobserver_callback
	**/
	public function new(callback:PerformanceObserverEntryList->PerformanceObserver->Void);

	/**
		Disconnects the `PerformanceObserver` instance from all notifications.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceobserver_disconnect
	**/
	public function disconnect():Void;

	/**
		Subscribes the `PerformanceObserver` instance to notifications of
		new `PerformanceEntry` instances identified by `options.entryTypes`.

		@see https://nodejs.org/api/perf_hooks.html#perf_hooks_performanceobserver_observe_options
	**/
	public function observe(options:ObserveOptions):Void;
}

/**
	An options type for `observe` of `PerformanceObserver`.
**/
typedef ObserveOptions = {
	/**
		An array of strings identifying the types of `PerformanceEntry` instances the observer is interested in.
		If not provided an error will be thrown.
	**/
	var entryTypes:Array<String>;

	/**
		If `true`, the notification callback will be called
		using `setImmediate()` and multiple `PerformanceEntry` instance notifications will be buffered internally.
		If `false`, notifications will be immediate and synchronous.
		Default: `false`.
	**/
	var buffered:Bool;
};
