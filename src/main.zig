const std = @import("std");
const math = @import("math.zig");

pub fn main() !void {
    var point: math.Rotor3 = math.rotor3.bivec(@splat(0), .{ 0, 1, 0 });
    std.debug.print("{any}\n", .{point});

    var bivec: math.Multi3 = math.multi3.bivec(@splat(0), .{ 1, 0, 0 });
    bivec *= @splat(std.math.pi / 4.0);
    var rotor = math.multi3.exp(bivec);
    rotor = math.multi3.geo(math.multi3.geo(rotor, rotor), rotor);

    point = math.multi3.geo(rotor, point);
    point = math.multi3.geo(point, math.multi3.conj(rotor));
    std.debug.print("{any}\n", .{point});
}
