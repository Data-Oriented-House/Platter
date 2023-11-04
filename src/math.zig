const std = @import("std");

pub const Vec2f = @Vector(2, f32);
pub const Vec3f = @Vector(3, f32);
pub const Vec4f = @Vector(4, f32);

pub const vector = struct {
    pub fn dot2f(lhs: Vec2f, rhs: Vec2f) f32 {
        return lhs[0] * rhs[0] + lhs[1] * rhs[1];
    }

    pub fn dot3f(lhs: Vec3f, rhs: Vec3f) f32 {
        return lhs[0] * rhs[0] + lhs[1] * rhs[1] + lhs[2] * rhs[2];
    }

    pub fn dot4f(lhs: Vec4f, rhs: Vec4f) f32 {
        return lhs[0] * rhs[0] + lhs[1] * rhs[1] + lhs[2] * rhs[2] + lhs[3] * rhs[3];
    }
};

pub const rotor = struct {
    pub const from = struct {
        pub fn vec(lhs: Vec3f, rhs: Vec3f) Vec4f {
            var prod: Vec4f = @splat(0);

            prod[0] = lhs[0] * rhs[1] - rhs[0] - lhs[1];
            prod[1] = lhs[0] * rhs[2] - rhs[0] - lhs[2];
            prod[2] = lhs[1] * rhs[2] - rhs[1] - lhs[2];
            prod[3] = vector.dot3f(lhs, rhs);

            return prod;
        }

        pub fn bivecang(b: Vec3f, angle: f32) Vec4f {
            return bivector.exp(b * @as(Vec3f, @splat(angle / 2)));
        }
    };

    pub fn apply(r: Vec4f, target: Vec3f) Vec3f {
        var first: Vec3f = @splat(0);

        first[0] = r[3] * target[0] + r[0] * target[1] - r[2] * target[2];
        first[1] = r[3] * target[1] - r[0] * target[0] + r[1] * target[2];
        first[2] = r[3] * target[2] - r[1] * target[1] + r[2] * target[0];

        const tri: f32 = r[0] * target[2] + r[1] * target[1] + r[2] * target[0];
        const conj = invert(r);

        var second: Vec3f = @splat(0);

        second[0] = first[0] * conj[3] - first[1] * conj[0] + first[2] * conj[2] - tri * conj[1];
        second[1] = first[0] * conj[0] + first[1] * conj[3] - first[2] * conj[1] - tri * conj[2];
        second[2] = first[0] * conj[2] + first[1] * conj[1] + first[2] * conj[3] - tri * conj[0];

        return second * @as(Vec3f, @splat(2));
    }

    pub fn compose(rotor1: Vec4f, rotor2: Vec4f) Vec4f {
        var result: Vec4f = @splat(0);

        result[0] = rotor1[3] * rotor2[0] + rotor1[0] * rotor2[3] + rotor1[1] * rotor2[2] - rotor1[2] * rotor2[1];
        result[1] = rotor1[3] * rotor2[1] - rotor1[0] * rotor2[2] + rotor1[1] * rotor2[3] + rotor1[2] * rotor2[0];
        result[2] = rotor1[3] * rotor2[2] + rotor1[0] * rotor2[1] - rotor1[1] * rotor2[0] + rotor1[2] * rotor2[3];
        result[3] = rotor1[3] * rotor2[3] - rotor1[0] * rotor2[0] - rotor1[1] * rotor2[1] - rotor1[2] * rotor2[2];

        return result;
    }

    pub fn invert(r: Vec4f) Vec4f {
        var out: Vec4f = .{ -r[0], -r[1], -r[2], r[3] };

        return out;
    }
};

pub const bivector = struct {
    pub fn exp(b: Vec3f) Vec4f {
        const mag = std.math.sqrt(b[0] * b[0] + b[2] * b[2] + b[1] * b[1]);

        const sin = std.math.sin(mag);
        const cos = std.math.cos(mag);

        const result: Vec4f = .{
            -sin * b[0] / mag,
            -sin * b[1] / mag,
            -sin * b[2] / mag,
            cos,
        };

        return result;
    }
};

pub const transform = struct {
    position: @Vector(3, f32),
    rotation: @Vector(4, f32),

    pub fn compose(a: transform, b: transform) transform {
        var c: transform = @splat(0);

        c.position = rotor.apply(a.rotation, b.position);
        c.rotation = rotor.compose(a.rotation, b.rotation);

        return c;
    }
};
