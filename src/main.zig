//! By convention, main.zig is where your main function lives in the case that
//! you are building an executable. If you are making a library, the convention
//! is to delete this file and start with root.zig instead.

const std = @import("std");
const windows = @cImport({
    @cDefine("_NO_CRT_STDIO_INLINE", "1");
    @cInclude("Windows.h");
});

const steam = @import("./steam_api64.zig");
pub fn main() !void {
    //_ = windows.MessageBoxA(null, "Hello!", "Notice", windows.MB_OK | windows.MB_ICONINFORMATION);
    if (steam.SteamAPI_InitFlat() == true) {
        std.debug.print("Steamworks is connected.. wow", .{});
    }

    const stdout_file = std.io.getStdOut().writer();
    var bw = std.io.bufferedWriter(stdout_file);
    const stdout = bw.writer();

    try stdout.print("In-dev\n", .{});

    try bw.flush(); // Don't forget to flush!
}
