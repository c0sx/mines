const std = @import("std");

pub const Size = struct {
    width: u32,
    height: u32,
};

pub fn render(size: Size, list: *std.ArrayList(u32)) !void {
    var stdout = std.io.getStdOut().writer();
    var i: u32 = 0;
    var index: u32 = 0;

    while (i < size.height) : (i += 1) {
        var j: u32 = 0;
        while (j < size.width) : (j += 1) {
            index = i * j;

            const includes = search_mine(index, list);
            const cell = if (includes) "x" else "o";

            try stdout.print("{s}", .{cell});
        }

        try stdout.print("{s}", .{"\n"});
    }
}

fn search_mine(i: u32, list: *std.ArrayList(u32)) bool {
    const is_includes = for (list.items) |item| {
        if (item == i) break true;
    } else false;

    return is_includes;
}
