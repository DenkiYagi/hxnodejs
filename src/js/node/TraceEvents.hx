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

package js.node;

/**
	Trace Event provides a mechanism to centralize tracing information generated
	by V8, Node.js core, and userspace code.

	@see https://nodejs.org/api/tracing.html#tracing_trace_events
**/
@:jsRequire("trace_events")
extern class TraceEvents {
	/**
		Creates and returns a `Tracing` object for the given set of categories.

		@see https://nodejs.org/api/tracing.html#tracing_trace_events_createtracing_options
	**/
	public static function createTracing(options:{categories:Array<String>}):Tracing;

	/**
		Returns a comma-separated list of all currently-enabled trace event categories.
		The current set of enabled trace event categories is determined
		by the union of all currently-enabled `Tracing` objects and any categories enabled
		using the `--trace-event-categories` flag.

		@see https://nodejs.org/api/tracing.html#tracing_trace_events_getenabledcategories
	**/
	public static function getEnabledCategories():String;
}

/**
	The `Tracing` object is used to enable or disable tracing for sets of categories.
	Instances are created using the `trace_events.createTracing()` method.

	@see https://nodejs.org/api/tracing.html#tracing_tracing_object
**/
extern class Tracing {
	/**
		A comma-separated list of the trace event categories covered by this `Tracing` object.

		@see https://nodejs.org/api/tracing.html#tracing_tracing_categories
	**/
	public var categories(default, never):String;

	/**
		Disables this `Tracing` object.

		@see https://nodejs.org/api/tracing.html#tracing_tracing_disable
	**/
	public function disable():Void;

	/**
		Enables this `Tracing` object for the set of categories covered by the `Tracing` object.

		@see https://nodejs.org/api/tracing.html#tracing_tracing_enable
	**/
	public function enable():Void;

	/**
		@see https://nodejs.org/api/tracing.html#tracing_tracing_enabled
	**/
	public var enabled(default, never):Bool;
}
