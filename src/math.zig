const std = @import("std");

const vga = struct {
    pub const Grade0 = @Vector(1, f32);
    pub const Grade1 = @Vector(3, f32);
    pub const Grade2 = @Vector(3, f32);
    pub const Grade3 = @Vector(1, f32);
    pub const Grade01 = @Vector(4, f32);
    pub const Grade02 = @Vector(4, f32);
    pub const Grade03 = @Vector(2, f32);
    pub const Grade013 = @Vector(5, f32);
    pub const Grade023 = @Vector(5, f32);
    pub const Grade0123 = @Vector(8, f32);
    pub const Grade12 = @Vector(6, f32);
    pub const Grade13 = @Vector(6, f32);
    pub const Grade123 = @Vector(7, f32);

    pub fn geo0_3(a: Grade0, b: Grade3) Grade3 {
        return .{a * b};
    }

    pub fn geo1_3(a: Grade1, b: Grade3) Grade2 {
        return .{ a[2] * b, a[0] * b, a[1] * b };
    }

    pub fn geo2_3(a: Grade2, b: Grade3) Grade1 {
        return .{.{ a[1] * b, a[2] * b, a[0] * b }};
    }

    pub fn geo3_3(a: Grade3, b: Grade3) Grade0 {
        return .{-a * b};
    }

    pub fn geo0_2(a: Grade0, b: Grade2) Grade2 {
        return .{.{@as(Grade2, @splat(a)) * b}};
    }

    pub fn geo1_2(a: Grade1, b: Grade2) Grade02 {
        return .{ a[1] * b[5] + a[2] * b[6] + a[3] * b[4], a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[3] * b[5], a[1] * b[6] + a[2] * b[5] };
    }

    pub fn geo2_2(a: Grade2, b: Grade2) Grade02 {
        return .{ a[0] * b[0] - a[1] * b[1] - a[2] * b[2], a[1] * b[2] + a[2] * b[1], a[0] * b[2] + a[2] * b[0], a[0] * b[1] + a[1] * b[0] };
    }

    pub fn geo3_2(a: Grade3, b: Grade2) Grade1 {
        return .{.{ a * b[1], a * b[2], a * b[0] }};
    }

    pub fn geo0_1(a: Grade0, b: Grade1) Grade1 {
        return .{.{@as(Grade1, @splat(a)) * b}};
    }

    pub fn geo1_1(a: Grade1, b: Grade1) Grade02 {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], .a[1] * b[2] - a[2] * b[1], a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[3] * b[1] };
    }

    pub fn geo2_1(a: Grade2, b: Grade1) Grade13 {
        return .{ a[0] * b[1] - a[2] * b[2], a[0] * b[0] + a[1] * b[2], a[1] * b[1] + a[2] * b[0], a[0] * b[2] + a[1] * b[0] + a[2] * b[1] };
    }

    pub fn geo3_1(a: Grade3, b: Grade1) Grade2 {
        return .{.{ a * b[2], a * b[0], a * b[1] }};
    }

    pub fn geo0_0(a: Grade0, b: Grade0) Grade0 {
        return .{a * b};
    }

    pub fn geo1_0(a: Grade1, b: Grade0) Grade1 {
        return .{a * @as(Grade1, @splat(b))};
    }

    pub fn geo2_0(a: Grade2, b: Grade0) Grade2 {
        return .{a * @as(Grade2, @splat(b))};
    }

    pub fn geo3_0(a: Grade3, b: Grade0) Grade3 {
        return .{a * b};
    }

    pub fn geo01_0(a: Grade01, b: Grade0) Grade01 {
        return .{ a[0] * b, a[1] * b, a[2] * b, a[3] * b };
    }

    pub fn geo01_1(a: Grade01, b: Grade1) Grade01 {
        _ = b;
        _ = a;
        return .{};
    }
    // pub const multivec3 = struct {
    //     pub fn exp(b: Multivec3) Multivec3 {
    //         const ap: f32 = std.math.sqrt((b[3] + b[4]) * (b[3] + b[4]) + (b[2] + b[6]) * (b[2] + b[6]) + (b[1] + b[5]) * (b[1] + b[5]));
    //         const an: f32 = std.math.sqrt((b[3] - b[4]) * (b[3] - b[4]) + (b[2] - b[6]) * (b[2] - b[6]) + (b[1] - b[5]) * (b[1] - b[5]));

    //         const sinan: f32 = @sin(an) / an;
    //         const sinap: f32 = @sin(ap) / ap;

    //         const cosan: f32 = @cos(an);
    //         const cosap: f32 = @cos(ap);

    //         const expa: f32 = 0.5 * @exp(b[0]);
    //         const exphp: f32 = @exp(b[7]);
    //         const exphn: f32 = @exp(-b[7]);

    //         const left: f32 = expa * exphp;
    //         const right: f32 = expa * exphn;

    //         const leftScalar: f32 = left * cosan;
    //         const rightScalar: f32 = right * cosap;

    //         const leftVector: f32 = left * sinan;
    //         const rightVector: f32 = right * sinap;

    //         return .{
    //             leftScalar + rightScalar,
    //             leftVector * (b[1] - b[5]) + rightVector * (b[1] + b[5]),
    //             leftVector * (b[2] - b[6]) + rightVector * (b[2] + b[6]),
    //             leftVector * (b[3] - b[4]) + rightVector * (b[3] + b[4]),
    //             leftVector * (b[4] - b[3]) + rightVector * (b[3] + b[4]),
    //             leftVector * (b[5] - b[1]) + rightVector * (b[1] + b[5]),
    //             leftVector * (b[6] - b[2]) + rightVector * (b[2] + b[6]),
    //             leftScalar - rightScalar,
    //         };
    //     }

    //     pub fn conj(a: Multivec3) Multivec3 {
    //         return .{ a[0], -a[1], -a[2], -a[3], -a[4], -a[5], -a[6], a[7] };
    //     }

    //     pub fn grade0(b: Multivec3) Scalar {
    //         return b[0];
    //     }

    //     pub fn grade1(b: Multivec3) Grade1 {
    //         return .{ b[1], b[2], b[3] };
    //     }

    //     pub fn grade2(b: Multivec3) Grade2 {
    //         return .{ b[4], b[5], b[6] };
    //     }

    //     pub fn grade3(b: Multivec3) Grade3 {
    //         return b[7];
    //     }

    //     pub fn scalar(b: Multivec3, a: Scalar) Multivec3 {
    //         var c: Multivec3 = b;
    //         c[0] = a;

    //         return c;
    //     }

    //     pub fn vec(b: Multivec3, a: Grade1) Multivec3 {
    //         var c: Multivec3 = b;
    //         c[1] = a[0];
    //         c[2] = a[1];
    //         c[3] = a[2];

    //         return c;
    //     }

    //     pub fn bivec(b: Multivec3, a: Grade2) Multivec3 {
    //         var c: Multivec3 = b;
    //         c[4] = a[0];
    //         c[5] = a[1];
    //         c[6] = a[2];

    //         return c;
    //     }

    //     pub fn trivec(b: Multivec3, a: Grade3) Multivec3 {
    //         var c: Multivec3 = b;
    //         c[7] = a;

    //         return c;
    //     }
    // };
};
