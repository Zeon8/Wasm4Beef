using System;
using System.Threading;
using System.Collections;

namespace Wasm4Game;

public static class Game
{
	[Export]
	[LinkName("start")]
	public static void Start()
	{
		// Call static constructors
		BeefStart();
		Wasm4.Trace("Hello!");
	}

	[Export]
	[LinkName("update")]
	public static void Update()
	{
		Wasm4.Text("Hello world!", 35, 10);
	}
}