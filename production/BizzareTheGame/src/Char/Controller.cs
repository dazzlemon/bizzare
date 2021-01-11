using Godot;
using System;

public abstract class Controller
{
	public abstract void Process();
	
	public Controller(Char parent)
	{
		Parent = parent;
	}
	
	protected Char Parent;
}

public class PlayerController : Controller
{
	public PlayerController(Char parent) : base(parent) {}
	
	public override void Process()
	{
		if (Input.IsActionPressed("ui_left") ||
			Input.IsActionPressed("ui_right") ||
			Input.IsActionPressed("ui_up") ||
			Input.IsActionPressed("ui_down"))
			Parent.ActionHandler(
				new ActionMove(
					new Vector2(
						Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left"),
						Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up")
					)
				)
			);
		if (Input.IsActionPressed("spell1"))
			Parent.ActionHandler(
				new ActionSpell1()
			);
	}
}
