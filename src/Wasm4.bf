using System;
namespace Wasm4Game;

static class Wasm4
{
	public enum GamepadButton : uint8
	{
		Button1 = 1,
		Button2 = 2,
		ButtonLeft = 16,
		ButtonRight = 32,
		ButtonUp = 64,
		ButtonDown = 128
	}

	public enum MouseButton : uint8
	{
		Left = 1,
		Right = 2,
		Middle = 4
	}

	public enum SystemFlags : uint8
	{
		PreserveFramebuffer = 1,
		HideGamepadOverlay = 2,
	}

	public enum BlitFlags : uint32
	{
		OneBPP = 0,
		TwoBPP = 1,
		FlipX = 2,
		FlipY = 4,
		Rotate = 8
	}

	public enum ToneChannel : uint32
	{
		Pulse1 = 0,
		Pulse2 = 1,
		Triangle = 2,
		Noise = 3,
	}

	public enum ToneMode : uint32
	{
		Mode1 = 0,
		Mode2 = 4,
		Mode3 = 8,
		Mode4 = 12,
	}

	public enum TonePan : uint32
	{
		PanLeft = 16,
		PanRight = 32,
	}

	public enum ToneFlags : uint32
	{
		NoteMode = 64,
	}

	public const int ScreenSize = 160;
	public const int FontSize = 8;

	public static readonly uint32* Palette = (uint32*)(void*)0x04;
	public static readonly uint16* DrawColors = (uint16*)(void*)0x14;
	public static readonly uint8* Gamepad1 = (uint8*)(void*)0x16;
	public static readonly uint8* Gamepad2 = (uint8*)(void*)0x17;
	public static readonly uint8* Gamepad3 = (uint8*)(void*)0x18;
	public static readonly uint8* Gamepad4 = (uint8*)(void*)0x19;
	public static readonly int16* MouseX = (int16*)(void*)0x1a;
	public static readonly int16* MouseY = (int16*)(void*)0x1c;
	public static readonly uint8* MouseButtons = (uint8*)(void*)0x1e;
	public static readonly uint8* SystemFlags = (uint8*)(void*)0x1f;
	public static readonly uint8* Netplay = (uint8*)(void*)0x20;
	public static readonly uint8* Framebuffer = (uint8*)(void*)0xa0;

	[LinkName("blit")]
	public static extern void Blit(uint8* data, int32 x, int32 y, uint32 width, uint32 height, BlitFlags flags);

	[LinkName("blitSub")]
	public static extern void BlitSub(uint8* data, int32 x, int32 y, uint32 width, uint32 height,
		uint32 srcX, uint32 srcY, uint32 stride, BlitFlags flags);

	[LinkName("line")]
	public static extern void Line(int32 x1, int32 y1, int32 x2, int32 y2);

	[LinkName("hline")]
	public static extern void HLine(int32 x, int32 y, uint32 len);

	[LinkName("vline")]
	public static extern void VLine(int32 x, int32 y, uint32 len);

	[LinkName("oval")]
	public static extern void Oval(int32 x, int32 y, uint32 width, uint32 height);

	[LinkName("rect")]
	public static extern void Rect(int32 x, int32 y, uint32 width, uint32 height);

	[LinkName("text")]
	public static extern void Text(char8* text, int32 x, int32 y);

	[LinkName("tone")]
	public static extern void Tone(uint32 frequency, uint32 duration, uint32 volume, uint32 flags);

	[LinkName("diskr")]
	public static extern uint32 DiskR(void* dest, uint32 size);

	[LinkName("diskw")]
	public static extern uint32 DiskW(void* src, uint32 size);

	[LinkName("trace")]
	public static extern void Trace(char8* str);

	public static void TraceView(StringView string) => Trace(string.ToScopeCStr!());

	public static void TextView(StringView text, int32 x, int32 y) => Text(text.ToScopeCStr!(), x, y);
}