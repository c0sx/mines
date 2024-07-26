const std = @import("std");

pub const Cell = struct {
    is_mined: bool,

    pub fn render(self: Cell) []const u8 {
        if (self.is_mined) {
            return "x";
        }

        return "o";
    }
};
