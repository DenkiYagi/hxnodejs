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

import js.node.Dns;
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
	/**
		An alias of `Dns.getServers()`.
	**/
	static function getServers():Array<String>;

	/**
		An alias of `Dns.resolve()`.
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<String>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<DnsResolvedAddressAny>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<DnsResolvedAddressMX>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<DnsResolvedAddressNaptr>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<DnsResolvedAddressSoa>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<DnsResolvedAddressSrv>->Void):Void {})
	static function resolve(hostname:String, ?rrtype:DnsRrtype, callback:Null<DnsError>->Array<Array<String>>->Void):Void; // Txt

	/**
		An alias of `Dns.resolve4()`.
	**/
	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:Null<DnsError>->Array<String>->Void):Void {})
	static function resolve4(hostname:String, ?options:{ttl:Bool}, callback:Null<DnsError>->Array<DnsResolvedAddress4>->Void):Void;

	/**
		An alias of `Dns.resolve6()`.
	**/
	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:Null<DnsError>->Array<String>->Void):Void {})
	static function resolve6(hostname:String, ?options:{ttl:Bool}, callback:Null<DnsError>->Array<DnsResolvedAddress6>->Void):Void;

	/**
		An alias of `Dns.resolveAny()`.
	**/
	static function resolveAny(hostname:String, callback:Null<DnsError>->Array<DnsResolvedAddressAny>->Void):Void;

	/**
		An alias of `Dns.resolveCname()`.
	**/
	static function resolveCname(hostname:String, callback:Null<DnsError>->Array<String>->Void):Void;

	/**
		An alias of `Dns.resolveMx()`.
	**/
	static function resolveMx(hostname:String, callback:Null<DnsError>->Array<DnsResolvedAddressMX>->Void):Void;

	/**
		An alias of `Dns.resolveNaptr()`.
	**/
	static function resolveNaptr(hostname:String, callback:Null<DnsError>->Array<DnsResolvedAddressNaptr>->Void):Void;

	/**
		An alias of `Dns.resolveNs()`.
	**/
	static function resolveNs(hostname:String, callback:Null<DnsError>->Array<String>->Void):Void;

	/**
		An alias of `Dns.resolvePtr()`.
	**/
	static function resolvePtr(hostname:String, callback:Null<DnsError>->Array<String>->Void):Void;

	/**
		An alias of `Dns.resolveSoa()`.
	**/
	static function resolveSoa(hostname:String, callback:Null<DnsError>->DnsResolvedAddressSoa->Void):Void;

	/**
		An alias of `Dns.resolveSrv()`.
	**/
	static function resolveSrv(hostname:String, callback:Null<DnsError>->Array<DnsResolvedAddressSrv>->Void):Void;

	/**
		An alias of `Dns.resolveTxt()`.
	**/
	static function resolveTxt(hostname:String, callback:Null<DnsError>->Array<Array<String>>->Void):Void;

	/**
		An alias of `Dns.reverse()`.
	**/
	static function reverse(ip:String, callback:Null<DnsError>->Array<String>->Void):Void;

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
