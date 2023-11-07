pub fn contains(comptime t: type, comptime val: t, comptime arr: []t) bool {
    for (arr) |v| {
        if (v == val) return true;
    }

    return false;
}
