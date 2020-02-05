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

/**
	The inspector module provides an API for interacting with the V8 inspector.

	@see https://nodejs.org/api/inspector.html#inspector_inspector
**/
@:jsRequire("inspector")
extern class Inspector {
	/**
		Deactivate the inspector.
		Blocks until there are no active connections.

		@see https://nodejs.org/api/inspector.html#inspector_inspector_close
	**/
	static public function close():Void;

	/**
		The inspector console does not have API parity with Node.js console.

		@see https://nodejs.org/api/inspector.html#inspector_inspector_console
	**/
	static public var console(default, never):Class<Dynamic>;

	/**
		Activate inspector on host and port.
		Equivalent to `node --inspect=[[host:]port]`,
		but can be done programmatically after node has started.

		@see https://nodejs.org/api/inspector.html#inspector_inspector_open_port_host_wait
	**/
	static public function open(?port:Int, ?host:String, ?wait:Bool):Void;

	/**
		Return the URL of the active inspector,
		or `undefined` if there is none.

		@see https://nodejs.org/api/inspector.html#inspector_inspector_url
	**/
	static public function url():Null<String>;

	/**
		Blocks until a client (existing or connected later) has sent `Runtime.runIfWaitingForDebugger` command.

		@see https://nodejs.org/api/inspector.html#inspector_inspector_waitfordebugger
	**/
	static public function waitForDebugger():Void;
}
