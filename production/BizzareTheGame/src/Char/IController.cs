using Godot;
using System;

public interface IController
{
	IInputAction Input_
	{
		get;
	}
}

public class PlayerController : IController
{
	public IInputAction Input_
	{
		get
		{
			if (Input.IsActionPressed("ui_left") ||
				Input.IsActionPressed("ui_right") ||
				Input.IsActionPressed("ui_up") ||
				Input.IsActionPressed("ui_down"))
				return new ActionMove(new Vector2(
					Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left"),
					Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up")
				));
			if (Input.IsActionPressed("spell1"))
				return new ActionSpell1();
			return new ActionNull();
		}
	}
}
