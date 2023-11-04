const std = @import("std");
const math = @import("math.zig");

pub fn main() !void {
    var bivec: math.Vec3f = .{ 0, 0, 1 };
    var rotor = math.rotor.from.bivecang(bivec, std.math.pi / 2.0);

    var point: math.Vec3f = .{ 0, 5, 0 };
    std.debug.print("{any}\n", .{point});

    point = math.rotor.apply(rotor, point);
    std.debug.print("{any} {any}\n", .{ point, math.vector.dot3f(point, point) });

    rotor = math.rotor.compose(math.rotor.invert(rotor), rotor);
    point = .{ 0, 1, 0 };
    point = math.rotor.apply(rotor, point);

    std.debug.print("{any} {any}\n", .{ point, math.vector.dot3f(point, point) });
}
