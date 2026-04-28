using System;
namespace Wasm4Game;

static
{
	[CLink]
	public static extern void BeefStart();

	[Export]
	[CLink]
	private static void BeefStop(){}
}