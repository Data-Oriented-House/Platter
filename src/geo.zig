const SIMD3 = @Vector(3, f32);
const SCALAR = f32;

fn geotypeS(comptime a: u8, comptime b: u8) @Vector(bool, 4) {
    const diff0 = @abs(a - b);
    const diff2 = diff0 + 2;

    const vec: type = .{ diff0 == 0, diff0 == 1, diff0 == 2 or diff2 == 2, diff0 == 3 or diff2 == 3 };
    return vec;
}

fn geotypeM(comptime a: type, comptime b: type) type {
    comptime var result = @as(@Vector(4, bool), @splat(false));

    inline for (0.., a) |i, v| {
        if (@TypeOf(v) != void) continue;

        inline for (0.., b) |j, u| {
            if (@TypeOf(u) != void) continue;

            result |= geotypeS(i, j);
        }
    }

    return Multivector(result[0], result[1], result[2], result[3]);
}

fn addtypeM(comptime a: type, comptime b: type) type {
    comptime var result = @as(@Vector(4, bool), @splat(false));

    inline for (0.., a, b) |i, v, u| {
        if (@TypeOf(v) != void or @TypeOf(u) != void) result[i] = true;
    }

    return Multivector(result[0], result[1], result[2], result[3]);
}

pub inline fn Multivector(scalar: bool, vector: bool, bivector: bool, trivector: bool) type {
    return struct {
        @"0": if (scalar) SCALAR else void,
        @"1": if (vector) SIMD3 else void,
        @"2": if (bivector) SIMD3 else void,
        @"3": if (trivector) SCALAR else void,
    };
}

pub fn add(a: anytype, b: anytype) addtypeM(a, b) {
    var result: addtypeM(@TypeOf(a), @TypeOf(b)) = null;

    inline for (a, b, 0..) |v, u, i| {
        if (@TypeOf(u) != void and @TypeOf(v) == void) result[i] = u;
        if (@TypeOf(u) == void and @TypeOf(v) != void) result[i] = v;
        if (@TypeOf(u) != void and @TypeOf(v) != void) result[i] = v + u;
    }

    return result;
}

pub fn geo(a: anytype, b: anytype) geotypeM(a, b) {
    var result: geotypeM(@TypeOf(a), @TypeOf(b)) = null;
    _ = result;

    inline for (a, 0..) |v, i| {
        if (@TypeOf(v) == void) continue;

        inline for (b, 0..) |u, j| {
            if (@TypeOf(u) == void) continue;

            add(result, switch (.{ i, j }) {
                .{0, 0} => .{}
            })
        }
    }
}

pub fn exp2(bivec: Multivector(0, 0, 1, 0)) Multivector(1, 0, 1, 0) {
    const mag = @sqrt(bivec[2][2] * bivec[2][2] + bivec[2][1] * bivec[2][1] + bivec[2][0] * bivec[2][0]);

    const sin = @sin(mag) / mag;
    const cos = @cos(mag);

    return .{ cos, bivec[2] * @as(SIMD3, @splat(sin)) };
}

pub fn exp02(parabivec: Multivector(1, 0, 1, 0)) Multivector(1, 0, 1, 0) {
    const mag = @sqrt(parabivec[2][2] * parabivec[2][2] + parabivec[2][1] * parabivec[2][1] + parabivec[2][0] * parabivec[2][0]);

    const sin = @sin(mag) / mag;
    const cos = @cos(mag);

    const exps = @exp(parabivec[0]);

    return .{
        exps * cos,
        @as(SIMD3, @splat(exps)) * @as(SIMD3, @splat(sin)) * parabivec[2],
    };
}
