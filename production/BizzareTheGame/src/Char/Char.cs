using Godot;
using System;

public class Char : KinematicBody2D
{
	public Vector2 Velocity;
	public float MaxVelocity;
	public float Decel;
	public IState State;//may be private in future
	protected IController __Controller;
	
	public override void _Process(float delta)
	{
		var newState = State.Handle(__Controller.Input_);
		if (newState != null)
		{
			State.Exit();
			State = newState;
			State.Enter();
		}
		State.Process(delta);
	}
}
