const std = @import("std");

pub const Vec3f = @Vector(3, f32);

pub const multi3 = struct {
    pub const Multi3 = @Vector(8, f32);

    pub fn exp(b: Multi3) Multi3 {
        const ap: f32 = std.math.sqrt((b[3] + b[4]) * (b[3] + b[4]) + (b[2] + b[6]) * (b[2] + b[6]) + (b[1] + b[5]) * (b[1] + b[5]));
        const an: f32 = std.math.sqrt((b[3] - b[4]) * (b[3] - b[4]) + (b[2] - b[6]) * (b[2] - b[6]) + (b[1] - b[5]) * (b[1] - b[5]));

        const sinan: f32 = std.math.sin(an) / an;
        const sinap: f32 = std.math.sin(ap) / ap;

        const cosan: f32 = std.math.cos(an);
        const cosap: f32 = std.math.cos(ap);

        const expa: f32 = 0.5 * std.math.exp(b[0]);
        const exphp: f32 = std.math.exp(b[7]);
        const exphn: f32 = std.math.exp(-b[7]);

        const left: f32 = expa * exphp;
        const right: f32 = expa * exphn;

        const leftScalar: f32 = left * cosan;
        const rightScalar: f32 = right * cosap;

        const leftVector: f32 = left * sinan;
        const rightVector: f32 = right * sinap;

        return .{
            leftScalar + rightScalar,
            leftVector * (b[1] - b[5]) + rightVector * (b[1] + b[5]),
            leftVector * (b[2] - b[6]) + rightVector * (b[2] + b[6]),
            leftVector * (b[3] - b[4]) + rightVector * (b[3] + b[4]),
            leftVector * (b[4] - b[3]) + rightVector * (b[3] + b[4]),
            leftVector * (b[5] - b[1]) + rightVector * (b[1] + b[5]),
            leftVector * (b[6] - b[2]) + rightVector * (b[2] + b[6]),
            leftScalar - rightScalar,
        };
    }

    pub fn geo(a: Multi3, b: Multi3) Multi3 {

        // Sona did this by hand
        //
        // God rest her soul.
        return .{
            a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7],
            a[0] * b[1] + a[1] * b[0] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5],
            a[0] * b[2] + a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6],
            a[0] * b[3] - a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4],
            a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3],
            a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4] + a[7] * b[1],
            a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0] + a[7] * b[2],
            a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0],
        };
    }

    pub fn conj(a: Multi3) Multi3 {
        return .{ a[0], -a[1], -a[2], -a[3], -a[4], -a[5], -a[6], a[7] };
    }

    pub fn add(a: Multi3, b: Multi3) Multi3 {
        return .{
            a[0] + b[0],
            a[1] + b[1],
            a[2] + b[2],
            a[3] + b[3],
            a[4] + b[4],
            a[5] + b[5],
            a[6] + b[6],
            a[7] + b[7],
        };
    }

    pub fn sub(a: Multi3, b: Multi3) Multi3 {
        return .{
            a[0] - b[0],
            a[1] - b[1],
            a[2] - b[2],
            a[3] - b[3],
            a[4] - b[4],
            a[5] - b[5],
            a[6] - b[6],
            a[7] - b[7],
        };
    }

    pub fn grade0(a: Multi3) f32 {
        return a[0];
    }

    pub fn grade1(a: Multi3) Vec3f {
        return .{ a[1], a[2], a[3] };
    }

    pub fn grade2(a: Multi3) Vec3f {
        return .{ a[4], a[5], a[6] };
    }

    pub fn grade3(a: Multi3) f32 {
        return a[7];
    }

    pub fn vec(a: Vec3f) Multi3 {
        return .{ 0, a[0], a[1], a[2], 0, 0, 0, 0 };
    }

    pub fn bivec(a: Vec3f) Multi3 {
        return .{ 0, 0, 0, 0, a[0], a[1], a[2], 0 };
    }

    pub fn trivec(a: f32) Multi3 {
        return .{ 0, 0, 0, 0, 0, 0, 0, a };
    }
};
