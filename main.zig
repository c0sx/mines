const std = @import("std");

const field = @import("./field.zig");
const mines = @import("./mines.zig");

const FIELD_WIDTH = 30;
const FIELD_HEIGHT = 10;
const MINES_AMOUNT = 10;

pub fn main() !void {
    const size = field.Size{
        .width = FIELD_WIDTH,
        .height = FIELD_HEIGHT,
    };

    try mines.generate(10);
    try field.render(size);
}
