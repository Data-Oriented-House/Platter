const std = @import("std");

const Build = std.Build;

pub fn build(b: *Build) void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const executable = b.addExecutable(.{ .name = "platter", .root_source_file = .{ .path = "src/main.zig" }, .target = target, .optimize = optimize });

    b.installArtifact(executable);

    const run = b.addRunArtifact(executable);

    const run_step = b.step("run", "Run the app");
    run_step.dependOn(&run.step);
}
