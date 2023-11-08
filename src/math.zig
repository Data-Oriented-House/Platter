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

    pub inline fn geo0_0(a: Grade0, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[0] * b[0],
        };
    }
    pub inline fn geo0_1(a: Grade0, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
        };
    }
    pub inline fn geo0_2(a: Grade0, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[0] * b[4],
            a[0] * b[5],
            a[0] * b[6],
        };
    }
    pub inline fn geo0_3(a: Grade0, b: Grade3) GRADEHEREPLEASE {
        return .{a[0] * b[7]};
    }
    pub inline fn geo0_01(a: Grade0, b: Grade01) GRADEHEREPLEASE {
        return .{
            a[0] * b[0],
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
        };
    }
    pub inline fn geo0_02(a: Grade0, b: Grade02) GRADEHEREPLEASE {
        return .{
            a[0] * b[0],

            a[0] * b[4],
            a[0] * b[5],
            a[0] * b[6],
        };
    }
    pub inline fn geo0_03(a: Grade0, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[7] };
    }
    pub inline fn geo0_013(a: Grade0, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[0] * b[7] };
    }
    pub inline fn geo0_023(a: Grade0, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[0] * b[7] };
    }
    pub inline fn geo0_12(a: Grade0, b: Grade12) GRADEHEREPLEASE {
        return .{
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
            a[0] * b[4],
            a[0] * b[5],
            a[0] * b[6],
        };
    }
    pub inline fn geo0_13(a: Grade0, b: Grade13) GRADEHEREPLEASE {
        return .{ a[0] * b[1], a[0] * b[2], a[0] * b[3], a[0] * b[7] };
    }
    pub inline fn geo0_123(a: Grade0, b: Grade123) GRADEHEREPLEASE {
        return .{ a[0] * b[1], a[0] * b[2], a[0] * b[3], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[0] * b[7] };
    }
    pub inline fn geo0_0123(a: Grade0, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[0] * b[7] };
    }
    pub inline fn geo1_0(a: Grade1, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
        };
    }
    pub inline fn geo1_1(a: Grade1, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],

            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[3] * b[1],
        };
    }
    pub inline fn geo1_2(a: Grade1, b: Grade2) GRADEHEREPLEASE {
        return .{ a[2] * b[4] + a[3] * b[6], a[1] * b[4] - a[3] * b[5], a[1] * b[6] + a[2] * b[5], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo1_3(a: Grade1, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[3] * b[7],
            a[1] * b[7],
            a[2] * b[7],
        };
    }
    pub inline fn geo1_01(a: Grade1, b: Grade01) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[3] * b[1],
        };
    }
    pub inline fn geo1_02(a: Grade1, b: Grade02) GRADEHEREPLEASE {
        return .{ a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo1_03(a: Grade1, b: Grade03) GRADEHEREPLEASE {
        return .{
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
            a[3] * b[7],
            a[1] * b[7],
            a[2] * b[7],
        };
    }
    pub inline fn geo1_013(a: Grade1, b: Grade013) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
            a[1] * b[2] - a[2] * b[1] + a[3] * b[7],
            a[1] * b[7] + a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[2] * b[7] + a[3] * b[1],
        };
    }
    pub inline fn geo1_023(a: Grade1, b: Grade023) GRADEHEREPLEASE {
        return .{ a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo1_12(a: Grade1, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[2] * b[4] + a[3] * b[6], a[1] * b[4] - a[3] * b[5], a[1] * b[6] + a[2] * b[5], a[1] * b[2] - a[2] * b[1], a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[3] * b[1], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo1_13(a: Grade1, b: Grade13) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],

            a[1] * b[2] - a[2] * b[1] + a[3] * b[7],
            a[1] * b[7] + a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[2] * b[7] + a[3] * b[1],
        };
    }
    pub inline fn geo1_123(a: Grade1, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[2] * b[4] + a[3] * b[6], a[1] * b[4] - a[3] * b[5], a[1] * b[6] + a[2] * b[5], a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo1_0123(a: Grade1, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo2_0(a: Grade2, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[4] * b[0],
            a[5] * b[0],
            a[6] * b[0],
        };
    }
    pub inline fn geo2_1(a: Grade2, b: Grade1) GRADEHEREPLEASE {
        return .{ a[4] * b[2] - a[6] * b[3], a[4] * b[1] + a[5] * b[3], a[5] * b[2] + a[6] * b[1], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_2(a: Grade2, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[4] * b[4] - a[5] * b[5] - a[6] * b[6],

            a[5] * b[6] + a[6] * b[5],
            a[4] * b[6] - a[6] * b[4],
            a[4] * b[5] + a[5] * b[4],
        };
    }
    pub inline fn geo2_3(a: Grade2, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[5] * b[7],
            a[6] * b[7],
            a[4] * b[7],
        };
    }
    pub inline fn geo2_01(a: Grade2, b: Grade01) GRADEHEREPLEASE {
        return .{ a[4] * b[2] - a[6] * b[3], a[4] * b[1] + a[5] * b[3], a[5] * b[2] + a[6] * b[1], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_02(a: Grade2, b: Grade02) GRADEHEREPLEASE {
        return .{
            a[4] * b[4] - a[5] * b[5] - a[6] * b[6],

            a[4] * b[0] - a[5] * b[6] + a[6] * b[5],
            a[4] * b[6] + a[5] * b[0] - a[6] * b[4],
            a[4] * b[5] + a[5] * b[4] + a[6] * b[0],
        };
    }
    pub inline fn geo2_03(a: Grade2, b: Grade03) GRADEHEREPLEASE {
        return .{
            a[5] * b[7],
            a[6] * b[7],
            a[4] * b[7],
            a[4] * b[0],
            a[5] * b[0],
            a[6] * b[0],
        };
    }
    pub inline fn geo2_013(a: Grade2, b: Grade013) GRADEHEREPLEASE {
        return .{ a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_023(a: Grade2, b: Grade023) GRADEHEREPLEASE {
        return .{
            a[4] * b[4] - a[5] * b[5] - a[6] * b[6],
            a[5] * b[7],
            a[6] * b[7],
            a[4] * b[7],
            a[4] * b[0] - a[5] * b[6] + a[6] * b[5],
            a[4] * b[6] + a[5] * b[0] - a[6] * b[4],
            a[4] * b[5] + a[5] * b[4] + a[6] * b[0],
        };
    }
    pub inline fn geo2_12(a: Grade2, b: Grade12) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[4] * b[2] - a[6] * b[3], a[4] * b[1] + a[5] * b[3], a[5] * b[2] + a[6] * b[1], a[5] * b[6] + a[6] * b[5], a[4] * b[6] - a[6] * b[4], a[4] * b[5] + a[5] * b[4], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_13(a: Grade2, b: Grade13) GRADEHEREPLEASE {
        return .{ a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_123(a: Grade2, b: Grade123) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[5] * b[6] + a[6] * b[5], a[4] * b[6] - a[6] * b[4], a[4] * b[5] + a[5] * b[4], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo2_0123(a: Grade2, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo3_0(a: Grade3, b: Grade0) GRADEHEREPLEASE {
        return .{a[7] * b[0]};
    }
    pub inline fn geo3_1(a: Grade3, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[7] * b[3],
            a[7] * b[1],
            a[7] * b[2],
        };
    }
    pub inline fn geo3_2(a: Grade3, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[7] * b[5],
            a[7] * b[6],
            a[7] * b[4],
        };
    }
    pub inline fn geo3_3(a: Grade3, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[7] * b[7],
        };
    }
    pub inline fn geo3_01(a: Grade3, b: Grade01) GRADEHEREPLEASE {
        return .{ a[7] * b[3], a[7] * b[1], a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo3_02(a: Grade3, b: Grade02) GRADEHEREPLEASE {
        return .{ a[7] * b[5], a[7] * b[6], a[7] * b[4], a[7] * b[0] };
    }
    pub inline fn geo3_03(a: Grade3, b: Grade03) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[7] * b[0] };
    }
    pub inline fn geo3_013(a: Grade3, b: Grade013) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo3_023(a: Grade3, b: Grade023) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[7] * b[5], a[7] * b[6], a[7] * b[4], a[7] * b[0] };
    }
    pub inline fn geo3_12(a: Grade3, b: Grade12) GRADEHEREPLEASE {
        return .{
            a[7] * b[5],
            a[7] * b[6],
            a[7] * b[4],
            a[7] * b[3],
            a[7] * b[1],
            a[7] * b[2],
        };
    }
    pub inline fn geo3_13(a: Grade3, b: Grade13) GRADEHEREPLEASE {
        return .{
            a[7] * b[7],

            a[7] * b[3],
            a[7] * b[1],
            a[7] * b[2],
        };
    }
    pub inline fn geo3_123(a: Grade3, b: Grade123) GRADEHEREPLEASE {
        return .{
            a[7] * b[7],
            a[7] * b[5],
            a[7] * b[6],
            a[7] * b[4],
            a[7] * b[3],
            a[7] * b[1],
            a[7] * b[2],
        };
    }
    pub inline fn geo3_0123(a: Grade3, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[7] * b[5], a[7] * b[6], a[7] * b[4], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo01_0(a: Grade01, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[0] * b[0],
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
        };
    }
    pub inline fn geo01_1(a: Grade01, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[3] * b[1],
        };
    }
    pub inline fn geo01_2(a: Grade01, b: Grade2) GRADEHEREPLEASE {
        return .{ a[2] * b[4] + a[3] * b[6], a[1] * b[4] - a[3] * b[5], a[1] * b[6] + a[2] * b[5], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo01_3(a: Grade01, b: Grade3) GRADEHEREPLEASE {
        return .{ a[3] * b[7], a[1] * b[7], a[2] * b[7], a[0] * b[7] };
    }
    pub inline fn geo01_01(a: Grade01, b: Grade01) GRADEHEREPLEASE {
        return .{
            a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[0] * b[1] + a[1] * b[0],
            a[0] * b[2] + a[2] * b[0],
            a[0] * b[3] + a[3] * b[0],
            a[1] * b[2] - a[2] * b[1],
            a[2] * b[3] - a[3] * b[2],
            a[1] * b[3] + a[3] * b[1],
        };
    }
    pub inline fn geo01_02(a: Grade01, b: Grade02) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo01_03(a: Grade01, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[0] * b[7] };
    }
    pub inline fn geo01_013(a: Grade01, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] + a[1] * b[0], a[0] * b[2] + a[2] * b[0], a[0] * b[3] + a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[0] * b[7] };
    }
    pub inline fn geo01_023(a: Grade01, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[0] * b[4] + a[3] * b[7], a[0] * b[5] + a[1] * b[7], a[0] * b[6] + a[2] * b[7], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo01_12(a: Grade01, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] - a[2] * b[4] + a[3] * b[6], a[0] * b[2] + a[1] * b[4] - a[3] * b[5], a[0] * b[3] - a[1] * b[6] + a[2] * b[5], a[0] * b[4] + a[1] * b[2] - a[2] * b[1], a[0] * b[5] + a[2] * b[3] - a[3] * b[2], a[0] * b[6] - a[1] * b[3] + a[3] * b[1], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo01_13(a: Grade01, b: Grade13) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[0] * b[7] };
    }
    pub inline fn geo01_123(a: Grade01, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] - a[2] * b[4] + a[3] * b[6], a[0] * b[2] + a[1] * b[4] - a[3] * b[5], a[0] * b[3] - a[1] * b[6] + a[2] * b[5], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo01_0123(a: Grade01, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] + a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[0] * b[2] + a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo02_0(a: Grade02, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[0] * b[0],

            a[4] * b[0],
            a[5] * b[0],
            a[6] * b[0],
        };
    }
    pub inline fn geo02_1(a: Grade02, b: Grade1) GRADEHEREPLEASE {
        return .{ a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_2(a: Grade02, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[4] * b[4] - a[5] * b[5] - a[6] * b[6],

            a[0] * b[4] - a[5] * b[6] + a[6] * b[5],
            a[0] * b[5] + a[4] * b[6] - a[6] * b[4],
            a[0] * b[6] - a[4] * b[5] + a[5] * b[4],
        };
    }
    pub inline fn geo02_3(a: Grade02, b: Grade3) GRADEHEREPLEASE {
        return .{ a[5] * b[7], a[6] * b[7], a[4] * b[7], a[0] * b[7] };
    }
    pub inline fn geo02_01(a: Grade02, b: Grade01) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_02(a: Grade02, b: Grade02) GRADEHEREPLEASE {
        return .{
            a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6],

            a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5],
            a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4],
            a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0],
        };
    }
    pub inline fn geo02_03(a: Grade02, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[5] * b[7], a[6] * b[7], a[4] * b[7], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[0] * b[7] };
    }
    pub inline fn geo02_013(a: Grade02, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_023(a: Grade02, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[5] * b[7], a[6] * b[7], a[4] * b[7], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[0] * b[7] };
    }
    pub inline fn geo02_12(a: Grade02, b: Grade12) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[0] * b[4] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_13(a: Grade02, b: Grade13) GRADEHEREPLEASE {
        return .{ a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_123(a: Grade02, b: Grade123) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[0] * b[4] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo02_0123(a: Grade02, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo03_0(a: Grade03, b: Grade0) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[7] * b[0] };
    }
    pub inline fn geo03_1(a: Grade03, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
            a[7] * b[3],
            a[7] * b[1],
            a[7] * b[2],
        };
    }
    pub inline fn geo03_2(a: Grade03, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[7] * b[5],
            a[7] * b[6],
            a[7] * b[4],
            a[0] * b[4],
            a[0] * b[5],
            a[0] * b[6],
        };
    }
    pub inline fn geo03_3(a: Grade03, b: Grade3) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[0] * b[7] };
    }
    pub inline fn geo03_01(a: Grade03, b: Grade01) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo03_02(a: Grade03, b: Grade02) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[7] * b[5], a[7] * b[6], a[7] * b[4], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[7] * b[0] };
    }
    pub inline fn geo03_03(a: Grade03, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo03_013(a: Grade03, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo03_023(a: Grade03, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[7] * b[5], a[7] * b[6], a[7] * b[4], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo03_12(a: Grade03, b: Grade12) GRADEHEREPLEASE {
        return .{
            a[0] * b[1] - a[7] * b[5],
            a[0] * b[2] - a[7] * b[6],
            a[0] * b[3] - a[7] * b[4],
            a[0] * b[4] + a[7] * b[3],
            a[0] * b[5] + a[7] * b[1],
            a[0] * b[6] + a[7] * b[2],
        };
    }
    pub inline fn geo03_13(a: Grade03, b: Grade13) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[0] * b[7] };
    }
    pub inline fn geo03_123(a: Grade03, b: Grade123) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[0] * b[1] - a[7] * b[5], a[0] * b[2] - a[7] * b[6], a[0] * b[3] - a[7] * b[4], a[0] * b[4] + a[7] * b[3], a[0] * b[5] + a[7] * b[1], a[0] * b[6] + a[7] * b[2], a[0] * b[7] };
    }
    pub inline fn geo03_0123(a: Grade03, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[0] * b[1] - a[7] * b[5], a[0] * b[2] - a[7] * b[6], a[0] * b[3] - a[7] * b[4], a[0] * b[4] + a[7] * b[3], a[0] * b[5] + a[7] * b[1], a[0] * b[6] + a[7] * b[2], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo013_0(a: Grade013, b: Grade0) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[7] * b[0] };
    }
    pub inline fn geo013_1(a: Grade013, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],
            a[0] * b[1],
            a[0] * b[2],
            a[0] * b[3],
            a[1] * b[2] - a[2] * b[1] + a[7] * b[3],
            a[2] * b[3] - a[3] * b[2] + a[7] * b[1],
            a[1] * b[3] + a[3] * b[1] + a[7] * b[2],
        };
    }
    pub inline fn geo013_2(a: Grade013, b: Grade2) GRADEHEREPLEASE {
        return .{ a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo013_3(a: Grade013, b: Grade3) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[0] * b[7] };
    }
    pub inline fn geo013_01(a: Grade013, b: Grade01) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] + a[1] * b[0], a[0] * b[2] + a[2] * b[0], a[0] * b[3] + a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo013_02(a: Grade013, b: Grade02) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[0] * b[4], a[0] * b[5], a[0] * b[6], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo013_03(a: Grade013, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo013_013(a: Grade013, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1] + a[1] * b[0], a[0] * b[2] + a[2] * b[0], a[0] * b[3] + a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo013_023(a: Grade013, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[0] * b[4] + a[3] * b[7], a[0] * b[5] + a[1] * b[7], a[0] * b[6] + a[2] * b[7], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo013_12(a: Grade013, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[0] * b[5] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo013_13(a: Grade013, b: Grade13) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1], a[0] * b[2], a[0] * b[3], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[0] * b[7] };
    }
    pub inline fn geo013_123(a: Grade013, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo013_0123(a: Grade013, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1] + a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo023_0(a: Grade023, b: Grade0) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[7] * b[0] };
    }
    pub inline fn geo023_1(a: Grade023, b: Grade1) GRADEHEREPLEASE {
        return .{ a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo023_2(a: Grade023, b: Grade2) GRADEHEREPLEASE {
        return .{
            a[4] * b[4] - a[5] * b[5] - a[6] * b[6],
            a[7] * b[5],
            a[7] * b[6],
            a[7] * b[4],
            a[0] * b[4] - a[5] * b[6] + a[6] * b[5],
            a[0] * b[5] + a[4] * b[6] - a[6] * b[4],
            a[0] * b[6] - a[4] * b[5] + a[5] * b[4],
        };
    }
    pub inline fn geo023_3(a: Grade023, b: Grade3) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[5] * b[7], a[6] * b[7], a[4] * b[7], a[0] * b[7] };
    }
    pub inline fn geo023_01(a: Grade023, b: Grade01) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[4] * b[0] + a[7] * b[3], a[5] * b[0] + a[7] * b[1], a[6] * b[0] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo023_02(a: Grade023, b: Grade02) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[7] * b[5], a[7] * b[6], a[7] * b[4], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[7] * b[0] };
    }
    pub inline fn geo023_03(a: Grade023, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[5] * b[7], a[6] * b[7], a[4] * b[7], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo023_013(a: Grade023, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[4] * b[0] + a[7] * b[3], a[5] * b[0] + a[7] * b[1], a[6] * b[0] + a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo023_023(a: Grade023, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[5] * b[7] - a[7] * b[5], a[6] * b[7] - a[7] * b[6], a[4] * b[7] - a[7] * b[4], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo023_12(a: Grade023, b: Grade12) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[0] * b[1] + a[4] * b[2] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[7] * b[6], a[0] * b[3] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo023_13(a: Grade023, b: Grade13) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[7] * b[3], a[7] * b[1], a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo023_123(a: Grade023, b: Grade123) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo023_0123(a: Grade023, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0] + a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo12_0(a: Grade12, b: Grade0) GRADEHEREPLEASE {
        return .{
            a[1] * b[0],
            a[2] * b[0],
            a[3] * b[0],
            a[4] * b[0],
            a[5] * b[0],
            a[6] * b[0],
        };
    }
    pub inline fn geo12_1(a: Grade12, b: Grade1) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[4] * b[2] - a[6] * b[3], a[4] * b[1] + a[5] * b[3], a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1], a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[3] * b[1], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_2(a: Grade12, b: Grade2) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6], a[1] * b[4] - a[3] * b[5], a[1] * b[6] + a[2] * b[5], a[5] * b[6] + a[6] * b[5], a[4] * b[6] - a[6] * b[4], a[4] * b[5] + a[5] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo12_3(a: Grade12, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[5] * b[7],
            a[6] * b[7],
            a[4] * b[7],
            a[3] * b[7],
            a[1] * b[7],
            a[2] * b[7],
        };
    }
    pub inline fn geo12_01(a: Grade12, b: Grade01) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[1] * b[0] + a[4] * b[2] - a[6] * b[3], a[2] * b[0] - a[4] * b[1] + a[5] * b[3], a[3] * b[0] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[4] * b[0], a[2] * b[3] - a[3] * b[2] + a[5] * b[0], a[1] * b[3] + a[3] * b[1] + a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_02(a: Grade12, b: Grade02) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[1] * b[0] - a[2] * b[4] + a[3] * b[6], a[1] * b[4] + a[2] * b[0] - a[3] * b[5], a[1] * b[6] + a[2] * b[5] + a[3] * b[0], a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo12_03(a: Grade12, b: Grade03) GRADEHEREPLEASE {
        return .{
            a[1] * b[0] - a[5] * b[7],
            a[2] * b[0] - a[6] * b[7],
            a[3] * b[0] - a[4] * b[7],
            a[3] * b[7] + a[4] * b[0],
            a[1] * b[7] + a[5] * b[0],
            a[2] * b[7] + a[6] * b[0],
        };
    }
    pub inline fn geo12_013(a: Grade12, b: Grade013) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[1] * b[0] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[2] * b[0] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[5] * b[0], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[6] * b[0], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_023(a: Grade12, b: Grade023) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[5] * b[7], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[6] * b[7], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7], a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[1] * b[7] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[2] * b[7] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo12_12(a: Grade12, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[6] * b[3], a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3], a[1] * b[6] + a[2] * b[5] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] - a[5] * b[6] + a[6] * b[5], a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4], a[1] * b[3] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_13(a: Grade12, b: Grade13) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7], a[1] * b[7] + a[2] * b[3] - a[3] * b[2], a[1] * b[3] + a[2] * b[7] + a[3] * b[1], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_123(a: Grade12, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[1] * b[6] + a[2] * b[5] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] - a[5] * b[6] + a[6] * b[5], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo12_0123(a: Grade12, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo13_0(a: Grade13, b: Grade0) GRADEHEREPLEASE {
        return .{ a[1] * b[0], a[2] * b[0], a[3] * b[0], a[7] * b[0] };
    }
    pub inline fn geo13_1(a: Grade13, b: Grade1) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3],

            a[1] * b[2] - a[2] * b[1] + a[7] * b[3],
            a[2] * b[3] - a[3] * b[2] + a[7] * b[1],
            a[1] * b[3] + a[3] * b[1] + a[7] * b[2],
        };
    }
    pub inline fn geo13_2(a: Grade13, b: Grade2) GRADEHEREPLEASE {
        return .{ a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo13_3(a: Grade13, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[7] * b[7],

            a[3] * b[7],
            a[1] * b[7],
            a[2] * b[7],
        };
    }
    pub inline fn geo13_01(a: Grade13, b: Grade01) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo13_02(a: Grade13, b: Grade02) GRADEHEREPLEASE {
        return .{ a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo13_03(a: Grade13, b: Grade03) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[7] * b[0] };
    }
    pub inline fn geo13_013(a: Grade13, b: Grade013) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[7] * b[0] };
    }
    pub inline fn geo13_023(a: Grade13, b: Grade023) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo13_12(a: Grade13, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo13_13(a: Grade13, b: Grade13) GRADEHEREPLEASE {
        return .{
            a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7],

            a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3],
            a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1],
            a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2],
        };
    }
    pub inline fn geo13_123(a: Grade13, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo13_0123(a: Grade13, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo123_0(a: Grade123, b: Grade0) GRADEHEREPLEASE {
        return .{ a[1] * b[0], a[2] * b[0], a[3] * b[0], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[7] * b[0] };
    }
    pub inline fn geo123_1(a: Grade123, b: Grade1) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[4] * b[2] - a[6] * b[3], a[4] * b[1] + a[5] * b[3], a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo123_2(a: Grade123, b: Grade2) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[5] * b[6] + a[6] * b[5], a[4] * b[6] - a[6] * b[4], a[4] * b[5] + a[5] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo123_3(a: Grade123, b: Grade3) GRADEHEREPLEASE {
        return .{
            a[7] * b[7],
            a[5] * b[7],
            a[6] * b[7],
            a[4] * b[7],
            a[3] * b[7],
            a[1] * b[7],
            a[2] * b[7],
        };
    }
    pub inline fn geo123_01(a: Grade123, b: Grade01) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[1] * b[0] + a[4] * b[2] - a[6] * b[3], a[2] * b[0] - a[4] * b[1] + a[5] * b[3], a[3] * b[0] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[4] * b[0] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[5] * b[0] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[6] * b[0] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo123_02(a: Grade123, b: Grade02) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo123_03(a: Grade123, b: Grade03) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[1] * b[0] - a[5] * b[7], a[2] * b[0] - a[6] * b[7], a[3] * b[0] - a[4] * b[7], a[3] * b[7] + a[4] * b[0], a[1] * b[7] + a[5] * b[0], a[2] * b[7] + a[6] * b[0], a[7] * b[0] };
    }
    pub inline fn geo123_013(a: Grade123, b: Grade013) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[1] * b[0] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[2] * b[0] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[5] * b[0] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[6] * b[0] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo123_023(a: Grade123, b: Grade023) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[5] * b[7] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[6] * b[7] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[7] * b[4], a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[1] * b[7] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[2] * b[7] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo123_12(a: Grade123, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[6] * b[3] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo123_13(a: Grade123, b: Grade13) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo123_123(a: Grade123, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo123_0123(a: Grade123, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo0123_0(a: Grade0123, b: Grade0) GRADEHEREPLEASE {
        return .{ a[0] * b[0], a[1] * b[0], a[2] * b[0], a[3] * b[0], a[4] * b[0], a[5] * b[0], a[6] * b[0], a[7] * b[0] };
    }
    pub inline fn geo0123_1(a: Grade0123, b: Grade1) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo0123_2(a: Grade0123, b: Grade2) GRADEHEREPLEASE {
        return .{ a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] - a[7] * b[4], a[0] * b[4] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] };
    }
    pub inline fn geo0123_3(a: Grade0123, b: Grade3) GRADEHEREPLEASE {
        return .{ a[7] * b[7], a[5] * b[7], a[6] * b[7], a[4] * b[7], a[3] * b[7], a[1] * b[7], a[2] * b[7], a[0] * b[7] };
    }
    pub inline fn geo0123_01(a: Grade0123, b: Grade01) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3], a[0] * b[1] + a[1] * b[0] + a[4] * b[2] - a[6] * b[3], a[0] * b[2] + a[2] * b[0] - a[4] * b[1] + a[5] * b[3], a[0] * b[3] + a[3] * b[0] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[4] * b[0] + a[7] * b[3], a[2] * b[3] - a[3] * b[2] + a[5] * b[0] + a[7] * b[1], a[1] * b[3] + a[3] * b[1] + a[6] * b[0] + a[7] * b[2], a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo0123_02(a: Grade0123, b: Grade02) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[7] * b[4], a[0] * b[4] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo0123_03(a: Grade0123, b: Grade03) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[7] * b[7], a[1] * b[0] - a[5] * b[7], a[2] * b[0] - a[6] * b[7], a[3] * b[0] - a[4] * b[7], a[3] * b[7] + a[4] * b[0], a[1] * b[7] + a[5] * b[0], a[2] * b[7] + a[6] * b[0], a[0] * b[7] + a[7] * b[0] };
    }
    pub inline fn geo0123_013(a: Grade0123, b: Grade013) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1] + a[1] * b[0] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] + a[2] * b[0] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[5] * b[0] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[6] * b[0] + a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
    }
    pub inline fn geo0123_023(a: Grade0123, b: Grade023) GRADEHEREPLEASE {
        return .{ a[0] * b[0] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[1] * b[0] - a[2] * b[4] + a[3] * b[6] - a[5] * b[7] - a[7] * b[5], a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[6] * b[7] - a[7] * b[6], a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[7] * b[4], a[0] * b[4] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5], a[0] * b[5] + a[1] * b[7] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4], a[0] * b[6] + a[2] * b[7] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[7] * b[0] };
    }
    pub inline fn geo0123_12(a: Grade0123, b: Grade12) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6], a[0] * b[1] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo0123_13(a: Grade0123, b: Grade13) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[7] * b[7], a[0] * b[1] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3], a[0] * b[2] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7], a[0] * b[3] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1], a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[7] * b[3], a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[7] * b[1], a[1] * b[3] + a[2] * b[7] + a[3] * b[1] + a[7] * b[2], a[0] * b[7] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo0123_123(a: Grade0123, b: Grade123) GRADEHEREPLEASE {
        return .{ a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[0] * b[1] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[7] * b[2], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] };
    }
    pub inline fn geo0123_0123(a: Grade0123, b: Grade0123) GRADEHEREPLEASE {
        return .{ a[0] * b[0] + a[1] * b[1] + a[2] * b[2] + a[3] * b[3] - a[4] * b[4] - a[5] * b[5] - a[6] * b[6] - a[7] * b[7], a[0] * b[1] + a[1] * b[0] - a[2] * b[4] + a[3] * b[6] + a[4] * b[2] - a[5] * b[7] - a[6] * b[3] - a[7] * b[5], a[0] * b[2] + a[1] * b[4] + a[2] * b[0] - a[3] * b[5] - a[4] * b[1] + a[5] * b[3] - a[6] * b[7] - a[7] * b[6], a[0] * b[3] - a[1] * b[6] + a[2] * b[5] + a[3] * b[0] - a[4] * b[7] - a[5] * b[2] + a[6] * b[1] - a[7] * b[4], a[0] * b[4] + a[1] * b[2] - a[2] * b[1] + a[3] * b[7] + a[4] * b[0] - a[5] * b[6] + a[6] * b[5] + a[7] * b[3], a[0] * b[5] + a[1] * b[7] + a[2] * b[3] - a[3] * b[2] + a[4] * b[6] + a[5] * b[0] - a[6] * b[4] + a[7] * b[1], a[0] * b[6] - a[1] * b[3] + a[2] * b[7] + a[3] * b[1] - a[4] * b[5] + a[5] * b[4] + a[6] * b[0] + a[7] * b[2], a[0] * b[7] + a[1] * b[5] + a[2] * b[6] + a[3] * b[4] + a[4] * b[3] + a[5] * b[1] + a[6] * b[2] + a[7] * b[0] };
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
