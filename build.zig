const std = @import("std");
const vkgen = @import("external/vulkan-zig/generator/index.zig");

const Build = std.Build;

pub fn build(b: *Build) !void {
    const target = b.standardTargetOptions(.{});
    const optimize = b.standardOptimizeOption(.{});

    const executable = b.addExecutable(.{ .name = "platter", .root_source_file = .{ .path = "src/main.zig" }, .target = target, .optimize = optimize });

    if (b.args == null) {
        _ = try std.io.getStdOut().write("Need arguments!");

        return;
    }

    const gen = vkgen.VkGenerateStep.create(b, b.args.?[0]);

    executable.addModule("vulkan", gen.getModule());

    b.installArtifact(executable);
}
