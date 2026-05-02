using System;
using System.Threading;
using System.Collections;

namespace Wasm4;

public abstract class Game<T> where T : Game<T>, class, new
{
	private static readonly Game<T> _game = new T();

	[Export]
	[LinkName("start")]
	private static void StartInternal()
	{
		BeefStart();
		_game.Start();
	}

	[Export]
	[LinkName("update")]
	private static void UpdateInternal()
	{
		_game.Update();
	}

	protected virtual void Start(){}
	protected virtual void Update(){}
}

