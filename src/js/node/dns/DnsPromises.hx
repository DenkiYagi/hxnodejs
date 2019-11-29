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
import js.lib.Promise;
#else
import js.Promise;
#end

/**
	An independent resolver for DNS requests.

	@see https://nodejs.org/api/dns.html#dns_class_dnspromises_resolver
**/
@:jsRequire("dnsPromises", "Resolver")
extern class DnsPromisesResolver {
	/**
		An alias of `DnsPromises.getServers()`.
	**/
	static function getServers():Promise<Array<String>>;

	/**
		An alias of `DnsPromises.resolve()`.
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressAny>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressMX>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressNaptr>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressSoa>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressSrv>}> {})
	static function resolve(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<Array<String>>}>;

	/**
		An alias of `DnsPromises.resolve4()`.
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	static function resolve4(hostname:String, ?options:{ttl:Bool}):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddress4>}>;

	/**
		An alias of `DnsPromises.resolve6()`.
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	static function resolve6(hostname:String, ?options:{ttl:Bool}):Promise<{err:Null<DnsError>, addressses:Array<DnsResolvedAddress6>}>;

	/**
		An alias of `DnsPromises.resolveAny()`.
	**/
	static function resolveAny(hostname:String):Promise<{err:Null<DnsError>, ret:Array<DnsResolvedAddressAny>}>;

	/**
		An alias of `DnsPromises.resolveCname()`.
	**/
	static function resolveCname(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		An alias of `DnsPromises.resolveMx()`.
	**/
	static function resolveMx(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddressMX>}>;

	/**
		An alias of `DnsPromises.resolveNaptr()`.
	**/
	static function resolveNaptr(hostname:String):Promise<{err:Null<DnsError>, address:Array<DnsResolvedAddressNaptr>}>;

	/**
		An alias of `DnsPromises.resolveNs()`.
	**/
	static function resolveNs(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		An alias of `DnsPromises.resolvePtr()`.
	**/
	static function resolvePtr(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		An alias of `DnsPromises.resolveSoa()`.
	**/
	static function resolveSoa(hostname:String):Promise<{err:Null<DnsError>, address:DnsResolvedAddressSoa}>;

	/**
		An alias of `DnsPromises.resolveSrv()`.
	**/
	static function resolveSrv(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddressSrv>}>;

	/**
		An alias of `DnsPromises.resolveTxt()`.
	**/
	static function resolveTxt(hostname:String):Promise<{err:Null<DnsError>, reccords:Array<Array<String>>}>;

	/**
		An alias of `DnsPromises.reverse()`.
	**/
	static function reverse(ip:String):Promise<{err:Null<DnsError>, hostnames:Array<String>}>;

	/**
		An alias of `DnsPromises.setServers()`.
	**/
	static function setServers(servers:Array<String>):Void;
}

/**
	The `dns.promises` API provides an alternative set of asynchronous DNS methods that return `Promise` objects rather than using callbacks.

	@see https://nodejs.org/api/dns.html#dns_dns_promises_api
**/
extern class DnsPromises {
	/**
		Returns an array of IP address strings, formatted according to RFC 5952, that are currently configured for DNS resolution.
		A string will include a port section if a custom port is used.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_getservers
	**/
	static function getServers():Promise<Array<String>>;

	/**
		Resolves a hostname (e.g. `'nodejs.org'`) into the first found A (IPv4) or AAAA (IPv6) record.
		All option properties are optional.
		If `options` is an integer, then it must be `4` or `6`
		If `options` is not provided, then IPv4 and IPv6 addresses are both returned if found.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_lookup_hostname_options
	**/
	@:overload(function(hostname:String, ?options:DnsAddressFamily):Promise<{err:Null<DnsError>, address:String, family:DnsAddressFamily}> {})
	@:overload(function(hostname:String, ?options:DnsLookupOptions):Promise<{err:Null<DnsError>, address:String, family:DnsAddressFamily}> {})
	static function lookup(hostname:String, options:DnsLookupOptions):Promise<{err:Null<DnsError>, addresses:Array<DnsLookupCallbackAllEntry>}>;

	/**
		Resolves the given `address` and `port` into a hostname and service
		using the operating system's underlying `getnameinfo` implementation.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_lookupservice_address_port
	**/
	static function lookupService(address:String, port:Int):Promise<{err:Null<DnsError>, hostname:String, service:String}>;

	/**
		Uses the DNS protocol to resolve a hostname (e.g. `'nodejs.org'`) into an array of the resource records.
		The `callback` function has arguments `(err, records)`.
		When successful, `records` will be an array of resource records.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolve_hostname_rrtype
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressAny>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressMX>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressNaptr>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressSoa>}> {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<DnsResolvedAddressSrv>}> {})
	static function resolve(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<Array<String>>}>;

	/**
		Uses the DNS protocol to resolve a IPv4 addresses (`A` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of IPv4 addresses (e.g. `['74.125.79.104', '74.125.79.105', '74.125.79.106']`).

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolve4_hostname_options
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	static function resolve4(hostname:String, ?options:{ttl:Bool}):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddress4>}>;

	/**
		Uses the DNS protocol to resolve IPv6 addresses (`AAAA` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of IPv6 addresses.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolve6_hostname_options
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype):Promise<{err:Null<DnsError>, records:Array<String>}> {})
	static function resolve6(hostname:String, ?options:{ttl:Bool}):Promise<{err:Null<DnsError>, addressses:Array<DnsResolvedAddress6>}>;

	/**
		Uses the DNS protocol to resolve all records (also known as `ANY` or `*` query).
		On success, the `Promise` is resolved with an array containing various types of records.
		Each object has a property `type` that indicates the type of the current record.
		And depending on the `type`, additional properties will be present on the object.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolveany_hostname
	**/
	static function resolveAny(hostname:String):Promise<{err:Null<DnsError>, ret:Array<DnsResolvedAddressAny>}>;

	/**
		Uses the DNS protocol to resolve `CNAME` records for the `hostname`.
		On success, the `Promise` is resolved with an array of canonical name records available for the `hostname` (e.g. `['bar.example.com']`).

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvecname_hostname
	**/
	static function resolveCname(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		Uses the DNS protocol to resolve mail exchange records (`MX` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of objects containing both a `priority` and `exchange` property (e.g. `[{priority: 10, exchange: 'mx.example.com'}, ...]`).

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvemx_hostname
	**/
	static function resolveMx(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddressMX>}>;

	/**
		Uses the DNS protocol to resolve regular expression based records (`NAPTR` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of objects with properties:

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvenaptr_hostname
	**/
	static function resolveNaptr(hostname:String):Promise<{err:Null<DnsError>, address:Array<DnsResolvedAddressNaptr>}>;

	/**
		Uses the DNS protocol to resolve name server records (`NS` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of name server records available for `hostname` (e.g. `['ns1.example.com', 'ns2.example.com']`).

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvens_hostname
	**/
	static function resolveNs(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		Uses the DNS protocol to resolve pointer records (`PTR` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of strings containing the reply records.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolveptr_hostname
	**/
	static function resolvePtr(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<String>}>;

	/**
		Uses the DNS protocol to resolve a start of authority record (`SOA` record) for the `hostname`.
		On success, the `Promise` is resolved with an object with properties.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvesoa_hostname
	**/
	static function resolveSoa(hostname:String):Promise<{err:Null<DnsError>, address:DnsResolvedAddressSoa}>;

	/**
		Uses the DNS protocol to resolve service records (`SRV` records) for the `hostname`.
		On success, the `Promise` is resolved with an array of objects with properties.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvesrv_hostname
	**/
	static function resolveSrv(hostname:String):Promise<{err:Null<DnsError>, addresses:Array<DnsResolvedAddressSrv>}>;

	/**
		Uses the DNS protocol to resolve text queries (`TXT` records) for the `hostname`.
		On success, the `Promise` is resolved with a two-dimensional array of the text records
		available for `hostname` (e.g. `[ ['v=spf1 ip4:0.0.0.0 ', '~all' ] ]`).
		Each sub-array contains TXT chunks of one record.
		Depending on the use case, these could be either joined together or treated separately.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_resolvetxt_hostname
	**/
	static function resolveTxt(hostname:String):Promise<{err:Null<DnsError>, reccords:Array<Array<String>>}>;

	/**
		Performs a reverse DNS query that resolves an IPv4 or IPv6 address to an array of hostnames.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_reverse_ip
	**/
	static function reverse(ip:String):Promise<{err:Null<DnsError>, hostnames:Array<String>}>;

	/**
		Sets the IP address and port of `servers` to be used when performing DNS resolution.
		The servers argument is an array of RFC 5952 formatted addresses.
		Tf the port is the IANA default DNS port (53) it can be omitted.

		@see https://nodejs.org/api/dns.html#dns_dnspromises_setservers_servers
	**/
	static function setServers(servers:Array<String>):Void;
}
