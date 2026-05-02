using System;
namespace Wasm4.Sample;

[AlwaysInclude]
class MyGame : Game<MyGame>
{
	protected override void Start()
	{
		Wasm4.Trace("Hello!");
	}

	protected override void Update()
	{
		Wasm4.Text("Hello world!", 35, 10);
	}
}