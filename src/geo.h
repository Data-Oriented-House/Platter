#pragma once

namespace pga
{
	typedef float number;

	struct Point {
		number x;
		number y;
		number z;
		number w;
	};

	struct Line {
		number dx;
		number dy;
		number dz;
		number px;
		number py;
		number pz;
	};

	struct Plane {
		number x;
		number y;
		number z;
		number w;
	};

	Line static inline join(Point a, Point b)
	{
		return {
			a.w * b.x - a.x * b.w,
			a.w * b.y - a.y * b.w,
			a.w * b.z - a.z * b.w,
			a.y * b.z - a.z * b.y,
			a.z * b.x - a.x * b.z,
			a.x * b.y - a.y * b.x
		};
	}

	Plane static inline join(Line a, Point b)
	{
		return {
			a.dy * b.z - a.dz * b.y + a.px * b.w,
			a.dz * b.x - a.dx * b.z + a.py * b.w,
			a.dx * b.y - a.dy * b.x + a.pz * b.w,
			-(a.px * b.x + a.py * b.y + a.pz * b.z)
		};
	}

	Line static inline meet(Plane a, Plane b)
	{
		return {
			a.z * b.y - a.y * b.z,
			a.x * b.z - a.z * b.x,
			a.y * b.x - a.x * b.z,
			a.x * b.w - a.w * b.x,
			a.y * b.w - a.w * b.y,
			a.z * b.w - a.w * b.z
		};
	}

	Point static inline meet(Line a, Plane b)
	{
		return {
			a.py * b.z - a.pz * b.y + a.dx * b.w,
			a.pz * b.x - a.px * b.z + a.dy * b.w,
			a.px * b.y - a.py * b.x + a.dz * b.w,
			-(a.dx * b.x + a.dy * b.y + a.dz * b.z)
		};
	}

} // namespace cga
