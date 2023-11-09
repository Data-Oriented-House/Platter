const SIMD4f = @Vector(4, f32);
const SIMD3f = @Vector(3, f32);

const Grade0 = f32;

pub const Grade1 = struct {
    data: SIMD3f,

    pub fn init(a: SIMD3f) Grade1 {
        return .{ .data = a };
    }

    pub const wedge = struct {
        pub fn grade1(a: Grade1, b: Grade1) Grade2 {
            _ = b;
            _ = a;
        }

        pub fn grade2(a: Grade1, b: Grade2) Grade3 {
            _ = b;
            _ = a;
        }

        pub fn grade3(a: Grade1, b: Grade3) Grade2 {
            _ = b;
            _ = a;
        }
    };
};

pub const Grade2 = struct {
    data: SIMD3f,

    pub fn init(a: SIMD3f) Grade2 {
        return .{ .data = a };
    }

    pub fn exp(bivec: Grade2) Grade02 {
        const mag: Grade0 = @sqrt(bivec.data[2] * bivec.data[2] + bivec.data[1] * bivec.data[1] + bivec.data[0] * bivec.data[0]);

        const sin: Grade0 = @sin(mag) / mag;
        const cos: Grade0 = @cos(mag);

        return .{
            cos,
            sin * bivec.data[0],
            sin * bivec.data[1],
            sin * bivec.data[2],
        };
    }

    pub const wedge = struct {
        pub fn grade1(a: Grade1, b: Grade1) Grade2 {
            return Grade1.wedge.grade2(b, a);
        }

        pub fn grade2(a: Grade2, b: Grade2) Grade3 {
            _ = b;
            _ = a;
        }
        pub fn grade3(a: Grade2, b: Grade3) Grade3 {
            _ = b;
            _ = a;
        }
    };
};

pub const Grade3 = struct {
    data: Grade0,

    pub fn init(a: Grade0) Grade1 {
        return .{ .data = a };
    }

    pub const wedge = struct {
        pub fn grade1(a: Grade3, b: Grade1) Grade2 {
            Grade1.wedge.grade3(b, a);
        }

        pub fn grade2(a: Grade3, b: Grade2) Grade3 {
            Grade2.wedge.grade3(b, a);
        }

        pub fn grade3(a: Grade3, b: Grade2) Grade0 {
            Grade2.wedge.grade3(b, a);
        }
    };
};

pub const Grade02 = struct {
    data: SIMD4f,

    pub fn init(a: SIMD4f) Grade02 {
        return .{ .data = a };
    }

    pub const sandwich = struct {
        pub fn grade1(a: Grade02, b: Grade1) Grade1 {
            const grade13: SIMD4f = .{
                a.data[0] * b.data[0] + a.data[1] * b.data[1] - a.data[3] * b.data[2],
                a.data[0] * b.data[1] - a.data[1] * b.data[0] + a.data[2] * b.data[2],
                a.data[0] * b.data[2] - a.data[2] * b.data[1] + a.data[3] * b.data[0],
                a.data[1] * b.data[2] + a.data[2] * b.data[0] + a.data[3] * b.data[1],
            };

            const grade3 = .{
                grade13[0] * a.data[0] + grade13[1] * a.data[1] - grade13[2] * a.data[3] + grade13[3] * a.data[2],
                -grade13[0] * a.data[1] + grade13[1] * a.data[0] + grade13[2] * a.data[2] + grade13[3] * a.data[3],
                -grade13[0] * a.data[3] - grade13[1] * a.data[2] + grade13[2] * a.data[0] + grade13[3] * a.data[1],
            };

            return grade3;
        }
    };

    pub const geo = struct {
        pub fn grade02(a: Grade02, b: Grade02) Grade02 {
            return .{
                a.data[0] * b.data[0] + a.data[1] * b.data[1] + a.data[2] * b.data[2] + a.data[3] * b.data[3],
                a.data[1] * b.data[2] - a.data[2] * b.data[1],
                a.data[2] * b.data[3] - a.data[3] * b.data[2],
                a.data[3] * b.data[1] - a.data[1] * b.data[3],
            };
        }
    };

    pub fn exp(parabivec: Grade02) Grade02 {
        const mag: Grade0 = @sqrt(parabivec.data[3] * parabivec.data[3] + parabivec.data[2] * parabivec.data[2] + parabivec.data[1] * parabivec.data[1]);

        const sin: Grade0 = @sin(mag) / mag;
        const cos: Grade0 = @cos(mag);

        const exps: Grade0 = @exp(parabivec.data[0]);

        return .{
            exps * cos,
            exps * sin * parabivec.data[0],
            exps * sin * parabivec.data[1],
            exps * sin * parabivec.data[2],
        };
    }

    pub fn grade0(a: Grade02) Grade0 {
        return a[0];
    }

    pub fn grade2(a: Grade02) Grade2 {
        return .{ a[1], a[2], a[3] };
    }

    pub fn scalar(b: Grade02, a: Grade0) Grade02 {
        var c: Grade02 = b;
        c[0] = a;

        return c;
    }

    pub fn bivector(b: Grade02, a: Grade2) Grade02 {
        var c: Grade02 = b;
        c.data[1] = a.data[0];
        c.data[2] = a.data[1];
        c.data[3] = a.data[2];

        return c;
    }
};

pub const Grade0123 = struct {
    data: @Vector(8, Grade0),

    pub fn init(a: SIMD3f) Grade0123 {
        return .{ .data = a };
    }

    pub fn exp(b: Grade0123) Grade0123 {
        const ap: Grade0 = @sqrt((b.data[3] + b.data[4]) * (b.data[3] + b.data[4]) + (b.data[2] + b.data[6]) * (b.data[2] + b.data[6]) + (b.data[1] + b.data[5]) * (b.data[1] + b.data[5]));
        const an: Grade0 = @sqrt((b.data[3] - b.data[4]) * (b.data[3] - b.data[4]) + (b.data[2] - b.data[6]) * (b.data[2] - b.data[6]) + (b.data[1] - b.data[5]) * (b.data[1] - b.data[5]));

        const sinan: Grade0 = @sin(an) / an;
        const sinap: Grade0 = @sin(ap) / ap;

        const cosan: Grade0 = @cos(an);
        const cosap: Grade0 = @cos(ap);

        const expa: Grade0 = 0.5 * @exp(b.data[0]);
        const exphp: Grade0 = @exp(b.data[7]);
        const exphn: Grade0 = @exp(-b.data[7]);

        const left: Grade0 = expa * exphp;
        const right: Grade0 = expa * exphn;

        const leftScalar: Grade0 = left * cosan;
        const rightScalar: Grade0 = right * cosap;

        const leftVector: Grade0 = left * sinan;
        const rightVector: Grade0 = right * sinap;

        return .{
            leftScalar + rightScalar,
            leftVector * (b.data[1] - b.data[5]) + rightVector * (b.data[1] + b.data[5]),
            leftVector * (b.data[2] - b.data[6]) + rightVector * (b.data[2] + b.data[6]),
            leftVector * (b.data[3] - b.data[4]) + rightVector * (b.data[3] + b.data[4]),
            leftVector * (b.data[4] - b.data[3]) + rightVector * (b.data[3] + b.data[4]),
            leftVector * (b.data[5] - b.data[1]) + rightVector * (b.data[1] + b.data[5]),
            leftVector * (b.data[6] - b.data[2]) + rightVector * (b.data[2] + b.data[6]),
            leftScalar - rightScalar,
        };
    }

    pub fn geo(a: Grade0123, b: Grade0123) Grade0123 {

        // Sona did this by hand
        //
        // God rest her soul.
        return .{
            a.data[0] * b.data[0] + a.data[1] * b.data[1] + a.data[2] * b.data[2] + a.data[3] * b.data[3] - a.data[4] * b.data[4] - a.data[5] * b.data[5] - a.data[6] * b.data[6] - a.data[7] * b.data[7],
            a.data[0] * b.data[1] + a.data[1] * b.data[0] - a.data[2] * b.data[4] + a.data[3] * b.data[6] + a.data[4] * b.data[2] - a.data[5] * b.data[7] - a.data[6] * b.data[3] - a.data[7] * b.data[5],
            a.data[0] * b.data[2] + a.data[1] * b.data[4] + a.data[2] * b.data[0] - a.data[3] * b.data[5] - a.data[4] * b.data[1] + a.data[5] * b.data[3] - a.data[6] * b.data[7] - a.data[7] * b.data[6],
            a.data[0] * b.data[3] - a.data[1] * b.data[6] + a.data[2] * b.data[5] + a.data[3] * b.data[0] - a.data[4] * b.data[7] - a.data[5] * b.data[2] + a.data[6] * b.data[1] - a.data[7] * b.data[4],
            a.data[0] * b.data[4] + a.data[1] * b.data[2] - a.data[2] * b.data[1] + a.data[3] * b.data[7] + a.data[4] * b.data[0] - a.data[5] * b.data[6] + a.data[6] * b.data[5] + a.data[7] * b.data[3],
            a.data[0] * b.data[5] + a.data[1] * b.data[7] + a.data[2] * b.data[3] - a.data[3] * b.data[2] + a.data[4] * b.data[6] + a.data[5] * b.data[0] - a.data[6] * b.data[4] + a.data[7] * b.data[1],
            a.data[0] * b.data[6] - a.data[1] * b.data[3] + a.data[2] * b.data[7] + a.data[3] * b.data[1] - a.data[4] * b.data[5] + a.data[5] * b.data[4] + a.data[6] * b.data[0] + a.data[7] * b.data[2],
            a.data[0] * b.data[7] + a.data[1] * b.data[5] + a.data[2] * b.data[6] + a.data[3] * b.data[4] + a.data[4] * b.data[3] + a.data[5] * b.data[1] + a.data[6] * b.data[2] + a.data[7] * b.data[0],
        };
    }

    pub fn conj(a: Grade0123) Grade0123 {
        return .{ a.data[0], -a.data[1], -a.data[2], -a.data[3], -a.data[4], -a.data[5], -a.data[6], a.data[7] };
    }

    pub fn add(a: Grade0123, b: Grade0123) Grade0123 {
        return .{
            a.data[0] + b.data[0],
            a.data[1] + b.data[1],
            a.data[2] + b.data[2],
            a.data[3] + b.data[3],
            a.data[4] + b.data[4],
            a.data[5] + b.data[5],
            a.data[6] + b.data[6],
            a.data[7] + b.data[7],
        };
    }

    pub fn sub(a: Grade0123, b: Grade0123) Grade0123 {
        return .{
            a.data[0] - b.data[0],
            a.data[1] - b.data[1],
            a.data[2] - b.data[2],
            a.data[3] - b.data[3],
            a.data[4] - b.data[4],
            a.data[5] - b.data[5],
            a.data[6] - b.data[6],
            a.data[7] - b.data[7],
        };
    }
};
