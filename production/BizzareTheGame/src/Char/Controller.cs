using Godot;
using System;

public class Controller : Node
{
	[Signal]
	public delegate void Action(IInputAction input);
}

public class PlayerController : Controller
{
	public void _Process()
	{
			if (Input.IsActionPressed("ui_left") ||
				Input.IsActionPressed("ui_right") ||
				Input.IsActionPressed("ui_up") ||
				Input.IsActionPressed("ui_down"))
				EmitSignal(
					nameof(Action),
					new ActionMove(new Vector2(
						Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left"),
						Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up")
					))
				);
			if (Input.IsActionPressed("spell1"))
				EmitSignal(
					nameof(Action),
					new ActionSpell1()
				);
	}
}
