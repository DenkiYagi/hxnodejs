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

import haxe.Constraints.Function;
import haxe.DynamicAccess;
import haxe.extern.EitherType;
import js.node.events.EventEmitter;
import js.node.events.EventEmitter.Event;
import js.node.cluster.Worker;

/**
	Enumeration of events emitted by the `Cluster` class.
**/
@:enum abstract ClusterEvent<T:haxe.Constraints.Function>(Event<T>) to Event<T> {
	/**
		Emitted after the worker IPC channel has disconnected.
		This can occur when a worker exits gracefully, is killed, or is disconnected manually (such as with
		`worker.disconnect()`).

		@see https://nodejs.org/api/cluster.html#cluster_event_disconnect_1
	**/
	var Disconnect:ClusterEvent<Worker->Void> = "disconnect";

	/**
		When any of the workers die the cluster module will emit the `'exit'` event.

		@see https://nodejs.org/api/cluster.html#cluster_event_exit_1
	**/
	var Exit:ClusterEvent<Worker->Float->String->Void> = "exit";

	/**
		When a new worker is forked the cluster module will emit a `'fork'` event.
		This can be used to log worker activity, and create a custom timeout.

		@see https://nodejs.org/api/cluster.html#cluster_event_fork
	**/
	var Fork:ClusterEvent<Worker->Void> = "fork";

	/**
		After calling `listen()` from a worker, when the `'listening'` event is emitted on the server a `'listening'`
		event will also be emitted on `cluster` in the master.

		@see https://nodejs.org/api/cluster.html#cluster_event_listening_1
	**/
	var Listening:ClusterEvent<Worker->ListeningEventAddress->Void> = "listening";

	/**
		Emitted when the cluster master receives a message from any worker.

		@see https://nodejs.org/api/cluster.html#cluster_event_message_1
	**/
	var Message:ClusterEvent<Worker->Dynamic->Dynamic> = "message";

	/**
		After forking a new worker, the worker should respond with an online message.
		When the master receives an online message it will emit this event.
		The difference between `'fork'` and `'online'` is that fork is emitted when the master forks a worker, and
		`'online'` is emitted when the worker is running.

		@see https://nodejs.org/api/cluster.html#cluster_event_online_1
	**/
	var Online:ClusterEvent<Worker->Void> = "online";

	/**
		Emitted every time `.setupMaster()` is called.

		@see https://nodejs.org/api/cluster.html#cluster_event_setup
	**/
	var Setup:ClusterEvent<ClusterSettings->Void> = "setup";
}

/**
	Options for the `Cluster.Listening` event.
**/
typedef ListeningEventAddress = {
	var address:String;
	var port:Int;
	var addressType:ListeningEventAddressType;
}

@:enum abstract ListeningEventAddressType(EitherType<Int, String>) to EitherType<Int, String> {
	var TCPv4 = 4;
	var TCPv6 = 6;
	var Unix = -1;
	var UDPv4 = "udp4";
	var UDPv6 = "udp6";
}

@:jsRequire("cluster")
@:enum extern abstract ClusterSchedulingPolicy(Int) {
	/**
		The scheduling policy for round-robin.
	**/
	var SCHED_RR;

	/**
		The scheduling policy to leave it to the operating system.
	**/
	var SCHED_NONE;
}

/**
	A single instance of Node.js runs in a single thread.
	To take advantage of multi-core systems, the user will sometimes want to launch a cluster of Node.js processes to
	handle the load.

	@see https://nodejs.org/api/cluster.html#cluster_cluster
**/
@:jsRequire("cluster")
extern class Cluster extends EventEmitter<Cluster> {
	/**
		A reference to the `Cluster` object returned by node.js module.

		It can be imported into module namespace by using: "import js.node.Cluster.instance in cluster"
	**/
	public static inline var instance:Cluster = cast Cluster;

	/**
		Calls `.disconnect()` on each worker in `cluster.workers`.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_disconnect_callback
	**/
	function disconnect(?callback:Void->Void):Void;

	/**
		Spawn a new worker process.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_fork_env
	**/
	function fork(?env:DynamicAccess<String>):Worker;

	/**
		True if the process is a master.
		This is determined by the `process.env.NODE_UNIQUE_ID`.
		If `process.env.NODE_UNIQUE_ID` is undefined, then `isMaster` is `true`.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_ismaster
	**/
	var isMaster(default, null):Bool;

	/**
		True if the process is not a master (it is the negation of `cluster.isMaster`).

		@see https://nodejs.org/api/cluster.html#cluster_cluster_isworker
	**/
	var isWorker(default, null):Bool;

	/**
		The scheduling policy, either `cluster.SCHED_RR` for round-robin or `cluster.SCHED_NONE` to leave it to the
		operating system.
		This is a global setting and effectively frozen once either the first worker is spawned, or
		`cluster.setupMaster()` is called, whichever comes first.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_schedulingpolicy
	**/
	var schedulingPolicy:ClusterSchedulingPolicy;

	/**
		After calling `.setupMaster()` (or `.fork()`) this settings object will contain the settings, including the
		default values.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_settings
	**/
	var settings(default, null):ClusterSettings;

	/**
		`setupMaster` is used to change the default 'fork' behavior.
		Once called, the settings will be present in `cluster.settings`.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_setupmaster_settings
	**/
	function setupMaster(?settings:ClusterSettings):Void;

	/**
		A reference to the current worker object.
		Not available in the master process.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_worker
	**/
	var worker(default, null):Worker;

	/**
		A hash that stores the active worker objects, keyed by `id` field.
		Makes it easy to loop through all the workers.
		It is only available in the master process.

		@see https://nodejs.org/api/cluster.html#cluster_cluster_workers
	**/
	var workers(default, null):DynamicAccess<Worker>;
}

/**
	Options for the `Cluster.setupMaster` method.
**/
typedef ClusterSettings = {
	/**
		List of string arguments passed to the Node.js executable.

		Default: `process.execArgv`.
	**/
	@:optional var execArgv(default, null):Array<String>;

	/**
		File path to worker file.

		Default: `process.argv[1]`.
	**/
	@:optional var exec(default, null):String;

	/**
		String arguments passed to worker.

		Default: `process.argv.slice(2)`.
	**/
	@:optional var args(default, null):Array<String>;

	/**
		Current working directory of the worker process.

		Default: `undefined` (inherits from parent process).
	**/
	@:optional var cwd(default, null):String;

	/**
		Whether or not to send output to parent's stdio.

		Default: `false`.
	**/
	@:optional var silent(default, null):Bool;

	/**
		Configures the stdio of forked processes.
		Because the cluster module relies on IPC to function, this configuration must contain an `'ipc'` entry.
		When this option is provided, it overrides `silent`.
	**/
	@:optional var stdio(default, null):Array<Dynamic>;

	/**
		Sets the user identity of the process.
	**/
	@:optional var uid(default, null):Int;

	/**
		Sets the group identity of the process.
	**/
	@:optional var gid(default, null):Int;

	/**
		Sets inspector port of worker.
		This can be a number, or a function that takes no arguments and returns a number.
		By default each worker gets its own port, incremented from the master's `process.debugPort`.
	**/
	@:optional var inspectPort(default, null):EitherType<Float, Function>;

	/**
		Hide the forked processes console window that would normally be created on Windows systems.

		Default: `false`.
	**/
	@:optional var windowsHide(default, null):Bool;
}
