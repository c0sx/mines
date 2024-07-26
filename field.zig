const std = @import("std");

const cell = @import("./cell.zig");

pub const Size = struct {
    width: u32,
    height: u32,
};

pub fn render(size: Size, list: *std.ArrayList(cell.Cell)) !void {
    var stdout = std.io.getStdOut().writer();
    var i: u32 = 0;

    while (i < size.height) : (i += 1) {
        var j: u32 = 0;
        while (j < size.width) : (j += 1) {
            const index = i * size.height + j;
            const c = list.items[index];
            try stdout.print("{s}", .{c.render()});
        }

        try stdout.print("{s}", .{"\n"});
    }
}
