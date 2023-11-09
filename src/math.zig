pub const Vec3 = @Vector(3, f32);

pub const Rotor3 = @Vector(4, f32);
pub const rotor3 = struct {
    pub fn exp(b: Vec3) Rotor3 {
        const mag: f32 = @sqrt(b[2] * b[2] + b[1] * b[1] + b[0] * b[0]);

        const sin: f32 = @sin(mag) / mag;
        const cos: f32 = @cos(mag);

        return .{
            cos,
            sin * b[0],
            sin * b[1],
            sin * b[2],
        };
    }

    pub fn compose(a: Rotor3, b: Rotor3) Rotor3 {
        return .{
            a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[3] * b[1] - a[1] * b[3],
        };
    }

    pub fn apply(a: Rotor3, b: Vec3) Vec3 {
        const grade13 = .{
            a[0] * b[0] + a[1] * b[1] - a[3] * b[2],
            a[0] * b[1] - a[1] * b[0] + a[2] * b[2],
            a[0] * b[2] - a[2] * b[1] + a[3] * b[0],
            a[1] * b[2] + a[2] * b[0] + a[3] * b[1],
        };

        const grade3 = .{
            grade13[0] * a[0] + grade13[1] * a[1] - grade13[2] * a[3] + grade13[3] * a[2],
            -grade13[0] * a[1] + grade13[1] * a[0] + grade13[2] * a[2] + grade13[3] * a[3],
            -grade13[0] * a[3] - grade13[1] * a[2] + grade13[2] * a[0] + grade13[3] * a[1],
        };

        return grade3;
    }

    pub fn conj(a: Rotor3) Rotor3 {
        return .{ a[0], -a[1], -a[2], -a[3] };
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

pub const Motor3 = @Vector(7, f32);
pub const motor3 = struct {
    pub fn compose(a: Motor3, b: Motor3) Motor3 {
        const rot2 = grade02(a);
        const trans2 = grade1(a);

        const rot1 = grade02(b);
        const trans1 = grade1(b);

        var motor = rotor(b, rotor3.compose(rot2, rot1));
        motor = vec(motor, rotor3.apply(rot2, trans1) + trans2);

        return motor;
    }

    pub fn apply(a: Motor3, b: Vec3) Vec3 {
        const rot = grade02(a);
        const trans = grade1(a);

        return rotor3.apply(rot, b) + trans;
    }

    pub fn grade1(a: Motor3) Vec3 {
        return .{ a[0], a[1], a[2] };
    }

    pub fn grade02(a: Motor3) Rotor3 {
        return .{ a[3], a[4], a[5], a[6] };
    }

    pub fn vec(b: Motor3, a: Vec3) Motor3 {
        var c = b;
        c[0] = a[0];
        c[1] = a[1];
        c[2] = a[2];

        return c;
    }

    pub fn rotor(b: Motor3, a: Rotor3) Motor3 {
        var c = b;
        c[3] = a[0];
        c[4] = a[1];
        c[5] = a[2];
        c[6] = a[3];

        return c;
    }
};

pub const Multi3 = @Vector(8, f32);
pub const multi3 = struct {
    pub fn exp(b: Multi3) Multi3 {
        const ap: f32 = @sqrt((b[3] + b[4]) * (b[3] + b[4]) + (b[2] + b[6]) * (b[2] + b[6]) + (b[1] + b[5]) * (b[1] + b[5]));
        const an: f32 = @sqrt((b[3] - b[4]) * (b[3] - b[4]) + (b[2] - b[6]) * (b[2] - b[6]) + (b[1] - b[5]) * (b[1] - b[5]));

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
