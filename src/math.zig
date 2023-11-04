const std = @import("std");

pub const Vec3 = @Vector(3, f32);

const Rotor3 = @Vector(4, f32);
const rotor3 = struct {
    pub fn exp(b: Rotor3) Rotor3 {
        const mag: f32 = std.math.sqrt(b[3] * b[3] + b[2] * b[2] + b[1] * b[1]);

        const sin: f32 = @sin(mag) / mag;
        const cos: f32 = @cos(mag);

        const exp: f32 = 0.5 * @exp(b[0]);

        const scalar: f32 = exp * cos;
        const vector: f32 = exp * sin;

        return .{
            scalar + scalar,
            2 * vector * b[1],
            2 * vector * b[2],
            2 * vector * b[3],
        };
    }

    pub fn geo(a: Rotor3, b: Rotor3) Multi3 {
        return .{
            a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[3] * b[1] - a[1] * b[3],
        };
    }

    pub fn conj(a: Rotor3) Rotor3 {
        return .{ a[0], -a[1], -a[2], -a[3] };
    }

    pub fn add(a: Rotor3, b: Rotor3) Rotor3 {
        return .{
            a[0] + b[0],
            a[1] + b[1],
            a[2] + b[2],
            a[3] + b[3],
        };
    }

    pub fn sub(a: Rotor3, b: Rotor3) Rotor3 {
        return .{
            a[0] - b[0],
            a[1] - b[1],
            a[2] - b[2],
            a[3] - b[3],
        };
    }

    pub fn grade0(a: Rotor3) f32 {
        return a[0];
    }

    pub fn grade2(a: Rotor3) Vec3 {
        return .{ a[1], a[2], a[3] };
    }

    pub fn scalar(b: Rotor3, a: f32) Rotor3 {
        var c: Rotor3 = b;
        c[0] = a;

        return c;
    }

    pub fn bivec(b: Rotor3, a: Vec3) Rotor3 {
        var c: Rotor3 = b;
        c[1] = a[0];
        c[2] = a[1];
        c[3] = a[2];

        return c;
    }
};

pub const Multi3 = @Vector(8, f32);
pub const multi3 = struct {
    pub fn exp(b: Multi3) Multi3 {
        const ap: f32 = std.math.sqrt((b[3] + b[4]) * (b[3] + b[4]) + (b[2] + b[6]) * (b[2] + b[6]) + (b[1] + b[5]) * (b[1] + b[5]));
        const an: f32 = std.math.sqrt((b[3] - b[4]) * (b[3] - b[4]) + (b[2] - b[6]) * (b[2] - b[6]) + (b[1] - b[5]) * (b[1] - b[5]));

        const sinan: f32 = @sin(an) / an;
        const sinap: f32 = @sin(ap) / ap;

        const cosan: f32 = @cos(an);
        const cosap: f32 = @cos(ap);

        const expa: f32 = 0.5 * @exp(b[0]);
        const exphp: f32 = @exp(b[7]);
        const exphn: f32 = @exp(-b[7]);

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

    pub fn grade0(b: Multi3) f32 {
        return b[0];
    }

    pub fn grade1(b: Multi3) Vec3 {
        return .{ b[1], b[2], b[3] };
    }

    pub fn grade2(b: Multi3) Vec3 {
        return .{ b[4], b[5], b[6] };
    }

    pub fn grade3(b: Multi3) f32 {
        return b[7];
    }

    pub fn scalar(b: Multi3, a: f32) Multi3 {
        var c: Multi3 = b;
        c[0] = a;

        return c;
    }

    pub fn vec(b: Multi3, a: Vec3) Multi3 {
        var c: Multi3 = b;
        c[1] = a[0];
        c[2] = a[1];
        c[3] = a[2];

        return c;
    }

    pub fn bivec(b: Multi3, a: Vec3) Multi3 {
        var c: Multi3 = b;
        c[4] = a[0];
        c[5] = a[1];
        c[6] = a[2];

        return c;
    }

    pub fn trivec(b: Multi3, a: f32) Multi3 {
        var c: Multi3 = b;
        c[7] = a;

        return c;
    }

    pub fn rotor(b: Multi3, a: Rotor3) Multi3 {
        var c: Multi3 = b;

        c[0] = a[0];
        c[4] = a[1];
        c[5] = a[2];
        c[6] = a[3];

        return c;
    }
};
