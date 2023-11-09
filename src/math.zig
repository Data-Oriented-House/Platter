const SIMD4 = @Vector(4, f32);
const SIMD3 = @Vector(3, f32);
const SCALAR = f32;

pub const Grade0 = struct {
    data: SCALAR,

    pub inline fn init(a: SCALAR) Grade0 {
        return .{ .data = a };
    }

    pub const geo = struct {
        pub inline fn grade0(a: Grade2, b: Grade0) Grade2 {
            return Grade0.init(a.data * b.data);
        }

        pub inline fn grade1(a: Grade0, b: Grade1) Grade1 {
            return Grade1.init(a.data * @as(SIMD3, @splat(b.data)));
        }

        pub inline fn grade2(a: Grade0, b: Grade2) Grade2 {
            return Grade2.init(a.data * @as(SIMD3, @splat(b.data)));
        }

        pub inline fn grade3(a: Grade0, b: Grade3) Grade3 {
            return Grade3.init(a.data * b.data);
        }
    };

    pub inline fn add(a: Grade0, b: Grade0) Grade0 {
        return a.data + b.data;
    }

    pub inline fn sub(a: Grade0, b: Grade0) Grade0 {
        return a.data - b.data;
    }
};

pub const Grade1 = struct {
    data: SIMD3,

    pub inline fn init(a: SIMD3) Grade1 {
        return .{ .data = a };
    }

    pub const geo = struct {
        pub inline fn grade0(a: Grade1, b: Grade0) Grade1 {
            return Grade0.geo.grade1(b, a);
        }

        pub fn grade1(a: Grade1, b: Grade1) Grade02 {
            return Grade02.init(.{
                a.data[0] * b.data[0] + a.data[1] * b.data[1] + a.data[2] * b.data[2],
                a.data[0] * b.data[1] - a.data[1] * b.data[0],
                a.data[1] * b.data[2] - a.data[2] * b.data[1],
                a.data[0] * b.data[2] + a.data[2] * b.data[0],
            });
        }

        pub fn grade2(a: Grade1, b: Grade2) Grade23 {
            return Grade23.init(.{
                a.data[1] * b.data[0] + a.data[2] * b.data[2],
                a.data[0] * b.data[0] - a.data[2] * b.data[1],
                a.data[0] * b.data[2] + a.data[1] * b.data[1],
                a.data[0] * b.data[1] + a.data[1] * b.data[2] + a.data[2] * b.data[0],
            });
        }

        pub inline fn grade3(a: Grade1, b: Grade3) Grade2 {
            return Grade2.init(a.data * @as(SIMD3, @splat(b.data)));
        }
    };

    pub inline fn add(a: Grade1, b: Grade1) Grade1 {
        return a.data + b.data;
    }

    pub inline fn sub(a: Grade1, b: Grade1) Grade1 {
        return a.data - b.data;
    }
};

pub const Grade2 = struct {
    data: SIMD3,

    pub inline fn init(a: SIMD3) Grade2 {
        return .{ .data = a };
    }

    pub const geo = struct {
        pub inline fn grade0(a: Grade2, b: Grade0) Grade2 {
            return Grade0.geo.grade2(b, a);
        }

        pub inline fn grade1(a: Grade1, b: Grade1) Grade2 {
            return Grade1.geo.grade2(b, a);
        }

        pub fn grade2(a: Grade2, b: Grade2) Grade02 {
            return Grade02.init(.{
                a.data[0] * b.data[0] - a.data[1] * b.data[1] - a.data[2] * b.data[2],
                a.data[1] * b.data[2] + a.data[2] * b.data[1],
                a.data[0] * b.data[2] - a.data[2] * b.data[0],
                a.data[0] * b.data[1] + a.data[1] * b.data[0],
            });
        }
        pub inline fn grade3(a: Grade2, b: Grade3) Grade1 {
            return Grade1.init(a.data * @as(SIMD3, @splat(b.data)));
        }
    };

    pub inline fn add(a: Grade2, b: Grade2) Grade2 {
        return a.data + b.data;
    }

    pub inline fn sub(a: Grade2, b: Grade2) Grade2 {
        return a.data - b.data;
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
};

pub const Grade3 = struct {
    data: SCALAR,

    pub inline fn init(a: SCALAR) Grade1 {
        return .{ .data = a };
    }

    pub const geo = struct {
        pub inline fn grade0(a: Grade2, b: Grade0) Grade2 {
            return Grade0.geo.grade3(b, a);
        }

        pub inline fn grade1(a: Grade3, b: Grade1) Grade2 {
            return Grade1.geo.grade3(b, a);
        }

        pub inline fn grade2(a: Grade3, b: Grade2) Grade3 {
            return Grade2.geo.grade3(b, a);
        }

        pub inline fn grade3(a: Grade3, b: Grade3) Grade0 {
            return Grade0.init(a.data * b.data);
        }
    };

    pub inline fn add(a: Grade3, b: Grade3) Grade3 {
        return a.data + b.data;
    }

    pub inline fn sub(a: Grade3, b: Grade3) Grade3 {
        return a.data - b.data;
    }
};

pub const Grade02 = struct {
    data: SIMD4,

    pub inline fn init(a: SIMD4) Grade02 {
        return .{ .data = a };
    }

    pub const geo = struct {
        pub fn grade02(a: Grade02, b: Grade02) Grade02 {
            const scal1 = select(a, Grade0);
            const scal2 = select(b, Grade0);

            const bivec1 = select(a, Grade2);
            const bivec2 = select(b, Grade2);

            const grade02data = bivec1.geo.grade2(bivec2);
            const scalar = scal1.geo.grade0(scal2).add(grade02data.select(Grade0));
            const bivec = bivec1.geo.grade0(scal2).add(bivec2.geo.grade0(scal1)).add(grade02data.select(Grade2));

            return .{ scalar, bivec[0], bivec[1], bivec[2] };
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

    pub inline fn conj(a: Grade02) Grade02 {
        return Grade02.init(.{ a.data[0], -a.data[1], -a.data[2], -a.data[3] });
    }

    pub inline fn select(a: Grade02, comptime grade: type) grade {
        return switch (grade) {
            Grade0 => Grade0.init(a.data[0]),
            Grade2 => Grade2.init(.{ a.data[1], a.data[2], a.data[3] }),
        };
    }
};

pub const Grade23 = struct {
    data: @Vector(4, Grade0),

    pub inline fn init(a: SIMD4) Grade23 {
        return .{ .data = a };
    }
};

pub const Grade0123 = struct {
    data: @Vector(8, Grade0),

    pub fn init(a: SIMD3) Grade0123 {
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
