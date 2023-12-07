#pragma once


namespace geo3
{
	typedef float number;

	struct Vector {
		number x;
		number y;
		number z;
	};

	struct Bivector {
		number yz;
		number xz;
		number xy;
	};

	struct Trivector {
		number xyz;
	};

	Vector static inline operator-(Vector a)
	{
		return { -a.x, -a.y, -a.z};
	}

	Bivector static inline operator-(Bivector a)
	{
		return { -a.yz, -a.xz, -a.xy };
	}

	Trivector static inline operator-(Trivector a)
	{
		return { -a.xyz};
	}

	//The dot product between two multivectors is defined as
	//$\sum_{k,s} < <a>_k <b>_s >_0$

	Vector static inline operator*(number a, Vector b)
	{
		return { a * b.x, a * b.y, a * b.z };
	}

	Bivector static inline operator*(number a, Bivector b)
	{
		return { a * b.yz, a * b.xz, a * b.xy };
	}

	Trivector static inline operator*(number a, Trivector b)
	{
		return { a * b.xyz };
	}


	Vector static inline operator*(Vector a, number b)
	{
		return b * a;
	}

	number static inline operator*(Vector a, Vector b)
	{
		return a.x * b.x + a.y * b.y + a.z * b.z;
	}

	Vector static inline operator*(Vector a, Bivector b)
	{
		return {- a.z * b.xz - a.y * b.xy, a.x * b.xy - a.z * b.yz, a.x * b.xz + a.y * b.yz };
	}

	Bivector static inline operator*(Vector a, Trivector b)
	{
		return { a.x * b.xyz, -a.y * b.xyz, a.z * b.xyz };
	}


	Bivector static inline operator*(Bivector a, number b)
	{
		return b * a;
	}

	Vector static inline operator*(Bivector a, Vector b)
	{
		return - b * a;
	}

	number static inline operator*(Bivector a, Bivector b)
	{
		return -a.xy * b.xy - a.yz * b.yz - a.xz * b.xz;
	}

	Vector static inline operator*(Bivector a, Trivector b)
	{
		return { -a.yz * b.xyz, a.xz * b.xyz, -a.xy * b.xyz };
	}


	Trivector static inline operator*(Trivector a, number b)
	{
		return b * a;
	}

	Bivector static inline operator*(Trivector a, Vector b)
	{
		return {a.xyz * b.z, a.xyz * b.x, -a.xyz * b.y};
	}

	Vector static inline operator*(Trivector a, Bivector b)
	{
		return {- a.xyz * b.yz, - a.xyz * b.xz, - a.xyz * b.xy };;
	}

	number static inline operator*(Trivector a, Trivector b)
	{
		return - a.xyz * b.xyz;
	}

	//The wedge product between two multivectors is defined as
	//$\sum_{k,s} < <a>_k <b>_s >_{k+s}

	Vector static inline operator^(number a, Vector b)
	{
		return a * b;
	}

	Bivector static inline operator^(number a, Bivector b)
	{
		return a * b;
	}

	Trivector static inline operator^(number a, Trivector b)
	{
		return a * b;
	}

	Vector static inline operator^(Vector a, number b)
	{
		return a * b;
	}

	Bivector static inline operator^(Vector a, Vector b)
	{
		return {
			a.y * b.z - a.z * b.y,
			a.x * b.z - a.z * b.x,
			a.x * b.y - a.y * b.x,
		};
	}

	Trivector static inline operator^(Vector a, Bivector b)
	{
		return {
			a.x * b.yz - a.y * b.xz + a.z * b.xy 
		};
	}

	Bivector static inline operator^(Vector a, Trivector b)
	{
		return a * b;
	}

	Bivector static inline operator^(Bivector a, number b)
	{
		return a * b;
	}

	Trivector static inline operator^(Bivector a, Vector b)
	{
		return b ^ a;
	}
	
	Bivector static inline operator^(Bivector a, Bivector b)
	{
		return {
			a.xz * b.yz - a.yz * b.xz,
			a.yz * b.xy - a.xy * b.yz,
			a.xy * b.xz - a.xz * b.xy,
		};
	}

	Vector static inline operator^(Bivector a, Trivector b)
	{
		return a * b;
	}


	Bivector static inline operator^(Trivector a, Vector b)
	{
		return a * b;
	}

	Vector static inline operator^(Trivector a, Bivector b)
	{
		return a * b;
	}

	number static inline operator^(Trivector a, Trivector b)
	{
		return a * b;
	}

}

namespace geo4
{
	typedef float number;

	struct Vector {
		number x;
		number y;
		number z;
		number w;
	};

	struct Bivector {
		number dx;
		number dy;
		number dz;
		number px;
		number py;
		number pz;
	};
} // namespace pga
