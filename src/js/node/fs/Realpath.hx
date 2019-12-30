package js.node.fs;

import haxe.extern.EitherType;
import js.node.Fs;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

@:jsRequire("fs", "realpath")
extern class Realpath {
	/**
		Asynchronously computes the canonical pathname by resolving `.`, `..` and symbolic links.

		@see https://nodejs.org/api/fs.html#fs_fs_realpath_path_options_callback
	**/
	@:selfCall
	@:overload(function(path:FsPath, callback:Null<Error>->String->Void):Void {})
	static function realpath(path:FsPath, options:EitherType<String, FsMkdtempOptions>, callback:Null<Error>->EitherType<String, Buffer>->Void):Void;

	/**
		Asynchronous `realpath(3)`.

		@see https://nodejs.org/api/fs.html#fs_fs_realpath_native_path_options_callback
	**/
	@:overload(function(path:FsPath, callback:Null<Error>->String->Void):Void {})
	static function native(path:FsPath, options:EitherType<String, FsMkdtempOptions>, callback:Null<Error>->EitherType<String, Buffer>->Void):Void;
}
