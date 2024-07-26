const std = @import("std");

const field = @import("./field.zig");
const cell = @import("./cell.zig");

pub fn generate(amount: u32, size: field.Size, list: *std.ArrayList(cell.Cell)) !void {
    var i: u32 = 0;
    const len = size.width * size.height;

    while (i < len) : (i += 1) {
        const c = cell.Cell{
            .is_mined = i < amount,
        };

        try list.append(c);
    }
}
