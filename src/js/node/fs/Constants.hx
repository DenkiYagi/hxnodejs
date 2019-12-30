package js.node.fs;

/**
	The following constants are exported by `fs.constants`.

	@see https://nodejs.org/api/fs.html#fs_fs_constants_1
**/
@:jsRequire("fs", "constants")
extern class Constants {
	/**
		Flag indicating that the file is visible to the calling process.
		This is useful for determining if a file exists, but says nothing about `rwx` permissions.
		Default if no mode is specified.
	**/
	static var F_OK(default, never):Int;

	/**
		Flag indicating that the file can be read by the calling process.
	**/
	static var R_OK(default, never):Int;

	/**
		Flag indicating that the file can be written by the calling process.
	**/
	static var W_OK(default, never):Int;

	/**
		Flag indicating that the file can be executed by the calling process.
		This has no effect on Windows (will behave like `fs.constants.F_OK`).
	**/
	static var X_OK(default, never):Int;

	/**
		If present, the copy operation will fail with an error if the destination path already exists.
	**/
	static var COPYFILE_EXCL(default, never):Int;

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then a fallback copy mechanism is used.
	**/
	static var COPYFILE_FICLONE(default, never):Int;

	/**
		If present, the copy operation will attempt to create a copy-on-write reflink.
		If the underlying platform does not support copy-on-write, then the operation will fail with an error.
	**/
	static var COPYFILE_FICLONE_FORCE(default, never):Int;

	/**
		Flag indicating to open a file for read-only access.
	**/
	static var O_RDONLY(default, never):Int;

	/**
		Flag indicating to open a file for write-only access.
	**/
	static var O_WRONLY(default, never):Int;

	/**
		Flag indicating to open a file for read-write access.
	**/
	static var O_RDWR(default, never):Int;

	/**
		Flag indicating to create the file if it does not already exist.
	**/
	static var O_CREAT(default, never):Int;

	/**
		Flag indicating that opening a file should fail if the `O_CREAT` flag is set and the file already exists.
	**/
	static var O_EXCL(default, never):Int;

	/**
		Flag indicating that if path identifies a terminal device, opening the path shall not cause that terminal to
		become the controlling terminal for the process (if the process does not already have one).
	**/
	static var O_NOCTTY(default, never):Int;

	/**
		Flag indicating that if the file exists and is a regular file, and the file is opened successfully for write
		access, its length shall be truncated to zero.
	**/
	static var O_TRUNC(default, never):Int;

	/**
		Flag indicating that data will be appended to the end of the file.
	**/
	static var O_APPEND(default, never):Int;

	/**
		Flag indicating that the open should fail if the path is not a directory.
	**/
	static var O_DIRECTORY(default, never):Int;

	/**
		Flag indicating reading accesses to the file system will no longer result in an update to the `atime`
		information associated with the file.
		This flag is available on Linux operating systems only.
	**/
	static var O_NOATIME(default, never):Int;

	/**
		Flag indicating that the open should fail if the path is a symbolic link.
	**/
	static var O_NOFOLLOW(default, never):Int;

	/**
		Flag indicating that the file is opened for synchronized I/O with write operations waiting for file integrity.
	**/
	static var O_SYNC(default, never):Int;

	/**
		Flag indicating that the file is opened for synchronized I/O with write operations waiting for data integrity.
	**/
	static var O_DSYNC(default, never):Int;

	/**
		Flag indicating to open the symbolic link itself rather than the resource it is pointing to.
	**/
	static var O_SYMLINK(default, never):Int;

	/**
		When set, an attempt will be made to minimize caching effects of file I/O.
	**/
	static var O_DIRECT(default, never):Int;

	/**
		Flag indicating to open the file in nonblocking mode when possible.
	**/
	static var O_NONBLOCK(default, never):Int;

	/**
		When set, a memory file mapping is used to access the file.
		This flag is available on Windows operating systems only.
		On other operating systems, this flag is ignored.
	**/
	static var UV_FS_O_FILEMAP(default, never):Int;

	/**
		Bit mask used to extract the file type code.
	**/
	static var S_IFMT(default, never):Int;

	/**
		File type constant for a regular file.
	**/
	static var S_IFREG(default, never):Int;

	/**
		File type constant for a directory.
	**/
	static var S_IFDIR(default, never):Int;

	/**
		File type constant for a character-oriented device file.
	**/
	static var S_IFCHR(default, never):Int;

	/**
		File type constant for a block-oriented device file.
	**/
	static var S_IFBLK(default, never):Int;

	/**
		File type constant for a FIFO/pipe.
	**/
	static var S_IFIFO(default, never):Int;

	/**
		File type constant for a symbolic link.
	**/
	static var S_IFLNK(default, never):Int;

	/**
		File type constant for a socket.
	**/
	static var S_IFSOCK(default, never):Int;

	/**
		File mode indicating readable, writable, and executable by owner.
	**/
	static var S_IRWXU(default, never):Int;

	/**
		File mode indicating readable by owner.
	**/
	static var S_IRUSR(default, never):Int;

	/**
		File mode indicating writable by owner.
	**/
	static var S_IWUSR(default, never):Int;

	/**
		File mode indicating executable by owner.
	**/
	static var S_IXUSR(default, never):Int;

	/**
		File mode indicating readable, writable, and executable by group.
	**/
	static var S_IRWXG(default, never):Int;

	/**
		File mode indicating readable by group.
	**/
	static var S_IRGRP(default, never):Int;

	/**
		File mode indicating writable by group.
	**/
	static var S_IWGRP(default, never):Int;

	/**
		File mode indicating executable by group.
	**/
	static var S_IXGRP(default, never):Int;

	/**
		File mode indicating readable, writable, and executable by others.
	**/
	static var S_IRWXO(default, never):Int;

	/**
		File mode indicating readable by others.
	**/
	static var S_IROTH(default, never):Int;

	/**
		File mode indicating writable by others.
	**/
	static var S_IWOTH(default, never):Int;

	/**
		File mode indicating executable by others.
	**/
	static var S_IXOTH(default, never):Int;
}
