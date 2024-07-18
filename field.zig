const std = @import("std");

pub const Size = struct {
    width: u32,
    height: u32,
};

pub fn render(size: Size) !void {
    var stdout = std.io.getStdOut().writer();
    var i: u32 = 0;

    while (i < size.height) : (i += 1) {
        var j: u32 = 0;
        while (j < size.width) : (j += 1) {
            try stdout.print("{s}", .{"o"});
        }

        try stdout.print("{s}", .{"\n"});
    }
}
