const std = @import("std");

const field = @import("./field.zig");
const mines = @import("./mines.zig");
const cell = @import("./cell.zig");

const FIELD_WIDTH = 30;
const FIELD_HEIGHT = 10;
const MINES_AMOUNT = 10;

pub fn main() !void {
    const size = field.Size{
        .width = FIELD_WIDTH,
        .height = FIELD_HEIGHT,
    };

    var gpa = std.heap.GeneralPurposeAllocator(.{}){};
    const allocator = gpa.allocator();
    var list = std.ArrayList(cell.Cell).init(allocator);
    defer list.deinit();

    try mines.generate(MINES_AMOUNT, size, &list);
    try field.render(size, &list);
}
