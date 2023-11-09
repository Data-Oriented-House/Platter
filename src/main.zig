const std = @import("std");
const math = @import("math.zig");

pub fn main() !void {
    var bivec = .{ std.math.pi / @as(comptime_float, 2), 0, 0 };
    var rotor = math.rotor3.exp(bivec);

    var motor = math.motor3.rotor(@splat(0), rotor);
    motor = math.motor3.vec(motor, .{ 0, 10, 0 });

    var motor2 = math.motor3.rotor(@splat(0), rotor);
    motor2 = math.motor3.vec(motor2, .{ 10, 0, 0 });

    motor = math.motor3.compose(motor2, motor);

    var point: math.Vec3 = .{ 1, 1, 1 };
    point = math.motor3.apply(motor, point);

    std.debug.print("{any}\n", .{point});
}
