const std = @import("std");

const field = @import("field.zig");

pub fn generate(amount: u32) !void {
    var prng = std.rand.DefaultPrng.init(blk: {
        var seed: u64 = undefined;
        try std.posix.getrandom(std.mem.asBytes(&seed));
        break :blk seed;
    });

    const rand = prng.random();

    var list = [amount]u32{};
    var i: u32 = 0;
    while (i < amont): (i += 1) {
        const value = rand.int(u32);
        list
    }

}
