const SIMD3 = @Vector(3, f32);
const SIMD4 = @Vector(4, f32);
const SIMD6 = @Vector(6, f32);
const SCALAR = f32;

pub inline fn Multi3(scalar: bool, vector: bool, bivector: bool, trivector: bool) type {
    return struct {
        @"0": if (scalar) SCALAR else void,
        @"1": if (vector) SIMD3 else void,
        @"2": if (bivector) SIMD3 else void,
        @"3": if (trivector) SCALAR else void,
    };
}

pub inline fn Multi4(scalar: bool, vector: bool, bivector: bool, trivector: bool, fourvector: bool) type {
    return struct {
        @"0": if (scalar) SCALAR else void,
        @"1": if (vector) SIMD4 else void,
        @"2": if (bivector) SIMD6 else void,
        @"3": if (trivector) SIMD4 else void,
        @"4": if (fourvector) SCALAR else void,
    };
}
