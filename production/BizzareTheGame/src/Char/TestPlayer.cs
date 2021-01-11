using Godot;
using System;

public class TestPlayer : Player
{
	public TestPlayer() : base()
	{
		State = new Idle(this);
		Velocity = Vector2.Zero;
		MaxVelocity = 1000;
		Decel = 1000;
	}
}
