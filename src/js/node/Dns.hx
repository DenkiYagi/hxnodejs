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

import haxe.extern.EitherType;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

/**
	Enumeration of possible Int `options` values for `Dns.lookup`.
**/
@:enum abstract DnsAddressFamily(Int) from Int to Int {
	var Both = 0;
	var IPv4 = 4;
	var IPv6 = 6;
}

/**
	Type of the `options` argument for `Dns.lookup`.
**/
typedef DnsLookupOptions = {
	/**
		The record family. If not provided, both IP v4 and v6 addresses are accepted.
	**/
	@:optional var family:DnsAddressFamily;

	/**
		If present, it should be one or more of the supported `getaddrinfo` flags.
		If hints is not provided, then no flags are passed to `getaddrinfo`.
		Multiple flags can be passed through hints by logically ORing their values.
	**/
	@:optional var hints:Int;

	/**
		When true, the callback returns all resolved addresses in an array, otherwise returns a single address.
		Defaults to false.
	**/
	@:optional var all:Bool;

	/**
		When `true`, the callback receives IPv4 and IPv6 addresses in the order the DNS resolver returned them.
		When `false`, IPv4 addresses are placed before IPv6 addresses.
		Default: currently `false` (addresses are reordered) but this is expected to change in the not too distant future.
		New code should use `{ verbatim: true }`.
	**/
	@:optional var verbatim:Bool;
}

/**
	Enumeration of possible `rrtype` value for `Dns.resolve`.
**/
@:enum abstract DnsRrtype(String) from String to String {
	/**
		IPV4 addresses (default)
	**/
	var A = "A";

	/**
		IPV6 addresses
	**/
	var AAAA = "AAAA";

	/**
		any records
	**/
	var ANY = "ANY";

	/**
		canonical name records
	**/
	var CNAME = "CNAME";

	/**
		mail exchange records
	**/
	var MX = "MX";

	/**
		name authority pointer records
	**/
	var NAPTR = "NAPTR";

	/**
		name server records
	**/
	var NS = "NS";

	/**
		pointer records
	**/
	var PTR = "PTR";

	/**
		start of authority records
	**/
	var SOA = "SOA";

	/**
		service records
	**/
	var SRV = "SRV";

	/**
		text records
	**/
	var TXT = "TXT";
}

/**
	Types of address data returned by `resolve` functions.
**/
typedef DnsResolvedAddress4 = {address:String, ttl:Int};
typedef DnsResolvedAddress6 = {address:String, ttl:Int};
typedef DnsResolvedAddressMX = {priority:Int, exchange:String};
typedef DnsResolvedAddressNaptr = {flags:String, service:String, regexp:String, replacement:String, order:Int, preference:Int};
typedef DnsResolvedAddressSoa = {
	nsname:String,
	hostmaster:String,
	serial:Int,
	refresh:Int,
	retry:Int,
	expire:Int,
	minttl:Int
};
typedef DnsResolvedAddressSrv = {
	priority:Int,
	weight:Int,
	port:Int,
	name:String
};
typedef DnsResolvedAddressAny = EitherType<
	{type:String, address:String, ttl:Int}, EitherType< // A, AAAA
	{type:String, value:String}, EitherType< // Cname
	{type:String, priority:Int, exchange:String}, EitherType< // MX
	{ // NAPTR
		type:String,
		flags:String,
		service:String,
		regex:String,
		replacement:String,
		order:Int,
		preference:Int
	}, EitherType<
	{type:String, value:String}, EitherType< // Ns, Ptr
	{ // SOA
		type:String,
		nsname:String,
		hostmaster:String,
		serial:Int,
		refersh:Int,
		retry:Int,
		expire:Int,
		minttl:Int
	}, EitherType<
	{ // SRV
		type:String,
		priority:Int,
		weight:Int,
		port:Int,
		name:String
	},
	{type:String, entries:Array<String>} // TXT
>>>>>>>;

/**
	Error objects returned by dns lookups are of this type
**/
extern class DnsError extends Error {
	/**
		Values for error codes are listed in `Dns` class.
	**/
	var code(default, null):DnsErrorCode;
}

/**
	Each DNS query can return one of the following error codes

	@see https://nodejs.org/api/dns.html#dns_error_codes
**/
@:jsRequire("dns")
@:enum extern abstract DnsErrorCode(String) {
	/**
		DNS server returned answer with no data.
	**/
	var NODATA;

	/**
		DNS server claims query was misformatted.
	**/
	var FORMERR;

	/**
		DNS server returned general failure.
	**/
	var SERVFAIL;

	/**
		Domain name not found.
	**/
	var NOTFOUND;

	/**
		DNS server does not implement requested operation.
	**/
	var NOTIMP;

	/**
		DNS server refused query.
	**/
	var REFUSED;

	/**
		Misformatted DNS query.
	**/
	var BADQUERY;

	/**
		Misformatted domain name.
	**/
	var BADNAME;

	/**
		Unsupported address family.
	**/
	var BADFAMILY;

	/**
		Misformatted DNS reply.
	**/
	var BADRESP;

	/**
		Could not contact DNS servers.
	**/
	var CONNREFUSED;

	/**
		Timeout while contacting DNS servers.
	**/
	var TIMEOUT;

	/**
		End of file.
	**/
	var EOF;

	/**
		Error reading file.
	**/
	var FILE;

	/**
		Out of memory.
	**/
	var NOMEM;

	/**
		Channel is being destroyed.
	**/
	var DESTRUCTION;

	/**
		Misformatted string.
	**/
	var BADSTR;

	/**
		Illegal flags specified.
	**/
	var BADFLAGS;

	/**
		Given hostname is not numeric.
	**/
	var NONAME;

	/**
		Illegal hints flags specified.
	**/
	var BADHINTS;

	/**
		c-ares library initialization not yet performed.
	**/
	var NOTINITIALIZED;

	/**
		Error loading `iphlpapi.dll`.
	**/
	var LOADIPHLPAPI;

	/**
		Could not find `GetNetworkParams` function.
	**/
	var ADDRGETNETWORKPARAMS;

	/**
		DNS query cancelled.
	**/
	var CANCELLED;
}

typedef DnsLookupCallbackSingle =
#if (haxe_ver >= 4)
    (err : DnsError, address : String, family : DnsAddressFamily) -> Void;
#else
	DnsError->String->DnsAddressFamily->Void
#end

typedef DnsLookupCallbackAll =
#if (haxe_ver >= 4)
    (err : DnsError, addresses : Array<DnsLookupCallbackAllEntry>) -> Void;
#else
	DnsError->Array<DnsLookupCallbackAllEntry>->Void;
#end
typedef DnsLookupCallbackAllEntry = {address:String, family:DnsAddressFamily};

/**
	This module contains functions that belong to two different categories:

	1) Functions that use the underlying operating system facilities to perform name resolution,
	and that do not necessarily do any network communication. This category contains only one function: `lookup`.
	Developers looking to perform name resolution in the same way that other applications on the same operating
	system behave should use `lookup`.

	2) Functions that connect to an actual DNS server to perform name resolution,
	and that always use the network to perform DNS queries. This category contains all functions in the dns module but `lookup`.
	These functions do not use the same set of configuration files than what `lookup` uses. For instance,
	they do not use the configuration from /etc/hosts. These functions should be used by developers who do not want
	to use the underlying operating system's facilities for name resolution, and instead want to always perform DNS queries.

	@see https://nodejs.org/api/dns.html#dns_dns
**/
@:jsRequire("dns")
extern class Dns {
	/**
		Returns an array of IP address strings, formatted according to RFC 5952, that are currently configured for DNS resolution.
		A string will include a port section if a custom port is used.

		@see https://nodejs.org/api/dns.html#dns_dns_getservers
	**/
	static function getServers():Array<String>;

	/**
		Resolves a hostname (e.g. `'nodejs.org'`) into the first found A (IPv4) or AAAA (IPv6) record.
		All `option` properties are optional.
		If `options` is an integer, then it must be `4` or `6`.
		If `options` is not provided, then IPv4 and IPv6 addresses are both returned if found.

		@see https://nodejs.org/api/dns.html#dns_dns_lookup_hostname_options_callback
	**/

	@:overload(function(hostname:String, ?options:DnsAddressFamily, callback:DnsLookupCallbackSingle):Void {})
	@:overload(function(hostname:String, ?options:DnsLookupOptions, callback:DnsLookupCallbackSingle):Void {})
	static function lookup(hostname:String, options:DnsLookupOptions, callback:DnsLookupCallbackAll):Void; // when `options.all == true`

	/**
		Resolves the given `address` and `port` into a hostname and service
		using the operating system's underlying `getnameinfo` implementation.

		@see https://nodejs.org/api/dns.html#dns_dns_lookupservice_address_port_callback
	**/
	static function lookupService(address:String, port:Int, callback:DnsError->String->String->Void):Void;

	/**
		Uses the DNS protocol to resolve a hostname (e.g. `'nodejs.org'`) into an array of the resource records.
		The `callback` function has arguments `(err, records)`.
		When successful, `records` will be an array of resource records.

		@see https://nodejs.org/api/dns.html#dns_dns_resolve_hostname_rrtype_callback
	**/
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<String>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<DnsResolvedAddressAny>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<DnsResolvedAddressMX>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<DnsResolvedAddressNaptr>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<DnsResolvedAddressSoa>->Void):Void {})
	@:overload(function(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<DnsResolvedAddressSrv>->Void):Void {})
	static function resolve(hostname:String, ?rrtype:DnsRrtype, callback:DnsError->Array<Array<String>>->Void):Void; // Txt

	/**
		Uses the DNS protocol to resolve a IPv4 addresses (`A` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of IPv4 addresses (e.g. `['74.125.79.104', '74.125.79.105', '74.125.79.106']`).

		@see https://nodejs.org/api/dns.html#dns_dns_resolve4_hostname_options_callback
	**/
	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:DnsError->Array<String>->Void):Void {})
	static function resolve4(hostname:String, ?options:{ttl:Bool}, callback:DnsError->Array<DnsResolvedAddress4>->Void):Void;

	/**
		Uses the DNS protocol to resolve a IPv6 addresses (`AAAA` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of IPv6 addresses.

		@see https://nodejs.org/api/dns.html#dns_dns_resolve6_hostname_options_callback
	**/
	@:overload(function(hostname:String, ?options:{ttl:Bool}, callback:DnsError->Array<String>->Void):Void {})
	static function resolve6(hostname:String, ?options:{ttl:Bool}, callback:DnsError->Array<DnsResolvedAddress6>->Void):Void;

	/**
		Uses the DNS protocol to resolve all records (also known as `ANY` or `*` query).
		The `ret` argument passed to the `callback` function will be an array containing various types of records.
		Each object has a property `type` that indicates the type of the current record.
		And depending on the `type`, additional properties will be present on the object.

		@see https://nodejs.org/api/dns.html#dns_dns_resolveany_hostname_callback
	**/
	static function resolveAny(hostname:String, callback:DnsError->Array<DnsResolvedAddressAny>->Void):Void;

	/**
		Uses the DNS protocol to resolve `CNAME` records for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of canonical name records
		available for the `hostname` (e.g. `['bar.example.com']`).

		@see https://nodejs.org/api/dns.html#dns_dns_resolvecname_hostname_callback
	**/
	static function resolveCname(hostname:String, callback:DnsError->Array<String>->Void):Void;

	/**
		Uses the DNS protocol to resolve mail exchange records (`MX` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of objects containing
		both a `priority` and `exchange` property (e.g. `[{priority: 10, exchange: 'mx.example.com'}, ...]`).

		@see https://nodejs.org/api/dns.html#dns_dns_resolvemx_hostname_callback
	**/
	static function resolveMx(hostname:String, callback:DnsError->Array<DnsResolvedAddressMX>->Void):Void;

	/**
		Uses the DNS protocol to resolve regular expression based records (`NAPTR` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of objects with properties.

		@see https://nodejs.org/api/dns.html#dns_dns_resolvenaptr_hostname_callback
	**/
	static function resolveNaptr(hostname:String, callback:DnsError->Array<DnsResolvedAddressNaptr>->Void):Void;

	/**
		Uses the DNS protocol to resolve name server records (`NS` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will contain an array of name server records
		available for `hostname` (e.g. `['ns1.example.com', 'ns2.example.com']`).

		@see https://nodejs.org/api/dns.html#dns_dns_resolvens_hostname_callback
	**/
	static function resolveNs(hostname:String, callback:DnsError->Array<String>->Void):Void;

	/**
		Uses the DNS protocol to resolve pointer records (`PTR` records) for the hostname.
		The `addresses` argument passed to the `callback` function will be an array of strings containing the reply records.

		@see https://nodejs.org/api/dns.html#dns_dns_resolveptr_hostname_callback
	**/
	static function resolvePtr(hostname:String, callback:DnsError->Array<String>->Void):Void;

	/**
		Uses the DNS protocol to resolve a start of authority record (`SOA` record) for the `hostname`.
		The `address` argument passed to the `callback` function will be an object with the properties.

		@see https://nodejs.org/api/dns.html#dns_dns_resolvesoa_hostname_callback
	**/
	static function resolveSoa(hostname:String, callback:DnsError->DnsResolvedAddressSoa->Void):Void;

	/**
		Uses the DNS protocol to resolve service records (`SRV` records) for the `hostname`.
		The `addresses` argument passed to the `callback` function will be an array of objects with the properties.

		@see https://nodejs.org/api/dns.html#dns_dns_resolvesrv_hostname_callback
	**/
	static function resolveSrv(hostname:String, callback:DnsError->Array<DnsResolvedAddressSrv>->Void):Void;

	/**
		Uses the DNS protocol to resolve text queries (`TXT` records) for the `hostname`.
		The `records` argument passed to the `callback` function is a two-dimensional array of the text records available for `hostname` (e.g. `[ ['v=spf1 ip4:0.0.0.0 ', '~all' ] ]`).
		Each sub-array contains TXT chunks of one record.
		Depending on the use case, these could be either joined together or treated separately.

		@see https://nodejs.org/api/dns.html#dns_dns_resolvetxt_hostname_callback
	**/
	static function resolveTxt(hostname:String, callback:DnsError->Array<Array<String>>->Void):Void;

	/**
		Performs a reverse DNS query that resolves an IPv4 or IPv6 address to an array of hostnames.

		@see https://nodejs.org/api/dns.html#dns_dns_reverse_ip_callback
	**/
	static function reverse(ip:String, callback:DnsError->Array<String>->Void):Void;

	/**
		Sets the IP address and port of servers to be used when performing DNS resolution.
		The servers argument is an array of RFC 5952 formatted addresses.
		If the port is the IANA default DNS port (53) it can be omitted.

		@see https://nodejs.org/api/dns.html#dns_dns_setservers_servers
	**/
	static function setServers(servers:Array<String>):Void;

	/**
		A flag can be passed as hints to `Dns.lookup()`.

		Returned address types are determined by the types of addresses supported by the current system.
		For example, IPv4 addresses are only returned if the current system has at least one IPv4 address configured.
		Loopback addresses are not considered.

		@see https://nodejs.org/api/dns.html#dns_supported_getaddrinfo_flags
	**/
	static var ADDRCONFIG(default, null):Int;

	/**
		A flag can be passed as hints to `Dns.lookup()`.

		If the IPv6 family was specified, but no IPv6 addresses were found, then return IPv4 mapped IPv6 addresses.
		It is not supported on some operating systems (e.g FreeBSD 10.1).

		@see https://nodejs.org/api/dns.html#dns_supported_getaddrinfo_flags
	**/
	static var V4MAPPED(default, null):Int;
}
