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

package js.node.dns;

#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	An independent resolver for DNS requests.

	@see https://nodejs.org/api/dns.html#dns_class_dns_resolver
**/
@:jsRequire("dns", "Resolver")
extern class Resolver {
	static function getServers():Array<String>;

	@:overload(function(hostname:String, ?rrtype:String, callback:Error->Array<String>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:String, callback:Error->Array<Class<Dynamic>>->Void):Void {})
	static function resolve(hostname:String, ?rrtype:String, callback:Error->Class<Dynamic>->Void):Void;

	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:Error->Array<String>->Void):Void {})
	static function resolve4(hostname:String, ?options:{ttl:Bool}, callback:Error->Array<Class<Dynamic>>->Void):Void;

	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:Error->Array<String>->Void):Void {})
	static function resolve6(hostname:String, ?options:{ttl:Bool}, callback:Error->Array<Class<Dynamic>>->Void):Void;

	static function resolveAny(hostname:String, callback:Error->Array<Class<Dynamic>>->Void):Void;

	static function resolveCname(hostname:String, callback:Error->Array<String>->Void):Void;

	static function resolveMx(hostname:String, callback:Error->Array<Class<Dynamic>>->Void):Void;

	static function resolveNaptr(hostname:String, callback:Error->Array<Class<Dynamic>>->Void):Void;

	static function resolveNs(hostname:String, callback:Error->Array<String>->Void):Void;

	static function resolvePtr(hostname:String, callback:Error->Array<String>->Void):Void;

	static function resolveSoa(hostname:String, callback:Error->Class<Dynamic>->Void):Void;

	static function resolveSrv(hostname:String, callback:Error->Array<Class<Dynamic>>->Void):Void;

	static function resolveTxt(hostname:String, callback:Error->Array<Array<String>>->Void):Void;

	static function reverse(ip:String, callback:Error->Array<String>->Void):Void;

	/**
		These methods are from the `dns` module.
	**/
	static function setServers(servers:Array<String>):Void;

	/**
		Cancel all outstanding DNS queries made by this resolver.
		The corresponding callbacks will be called with an error with code `ECANCELLED`.

		@see https://nodejs.org/api/dns.html#dns_resolver_cancel
	**/
	static function cancel():Void;
}

