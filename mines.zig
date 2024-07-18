const std = @import("std");

const field = @import("field.zig");

pub fn generate(amount: u32, size: field.Size, list: *std.ArrayList(u32)) !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    const rand = prng.random();

    var i: u32 = 0;
    const len = size.width * size.height;
    while (i < amount) : (i += 1) {
        const value = rand.intRangeAtMost(u32, 0, len);
        try list.append(value);
    }
}
