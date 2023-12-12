#include "geo.h"

#include <stdio.h>

int main()
{
	geo3::Vector a = { 0.4f, 2, 3};
	geo3::Vector b = { -2, 1, -4};
	geo3::Vector c = { 1, 0, 0 };

	auto w = a ^ b;
	auto j = b ^ a;
	auto k = w * c;

	printf("%f %f %f", k.x, k.y, k.z);

	return 0;
}
