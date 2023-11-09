const std = @import("std");
const math = @import("math.zig");

pub fn main() !void {
    var point: math.Vec3 = .{ 0, 1, 0 };
    std.debug.print("{any}\n", .{point});

    var bivec: math.Rotor3 = math.rotor3.bivec(@splat(0), .{ 0, 1, 0 });
    bivec *= @splat(std.math.pi / 4.0);
    var rotor = math.rotor3.exp(bivec);
    const newpoint = math.rotor3.apply(rotor, point);

    std.debug.print("{any}\n", .{newpoint});
}
