using Godot;
using System;

public abstract class Char : KinematicBody2D
{
	
	public Vector2 Velocity;
	public float MaxVelocity;
	public float Decel;
	public IState State;//may be private in future
	protected Controller __Controller;
	
	public void ActionHandler(IInputAction input)
	{
		var newState = State.Handle(input);
		if (newState != null)
		{
			State.Exit();
			State = newState;
			State.Enter();
		}
	}
	
	public override void _Process(float delta)
	{
		State.Process(delta);
		__Controller.Process();
	}
}
