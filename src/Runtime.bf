using System;

namespace Wasm4;

internal static
{
	[CLink]
	internal static extern void BeefStart();

	[Export]
	[CLink]
	private static void BeefStop(){}
}