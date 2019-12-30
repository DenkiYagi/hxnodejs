package js.node.fs;

import haxe.extern.EitherType;
import js.node.Fs;
#if haxe4
import js.lib.Error;
#else
import js.Error;
#end

@:jsRequire("fs", "realpathSync")
extern class RealpathSync {
	/**
		Returns the resolved pathname.

		@see https://nodejs.org/api/fs.html#fs_fs_realpathsync_path_options
	**/
	@:selfCall
	@:overload(function(path:FsPath):String {})
	static function realpathSync(path:FsPath, options:EitherType<String, FsMkdtempOptions>):EitherType<String, Buffer>;

	/**
		Synchronous `realpath(3)`.

		@see https://nodejs.org/api/fs.html#fs_fs_realpathsync_native_path_options
	**/
	@:overload(function(path:FsPath):String {})
	static function native(path:FsPath, options:EitherType<String, FsMkdtempOptions>):EitherType<String, Buffer>;
}
