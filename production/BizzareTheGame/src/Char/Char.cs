using Godot;
using System;
using System.Collections;

public class Char : KinematicBody2D
{
	public Vector2 Velocity = Vector2.Zero;
	public float MaxVelocity = 1000;
	public float Decel = 1000;
	public IState State;//may be private in future
	IController __Controller;
	
	public Char()
	{
		State = new Idle(this);
		__Controller = new PlayerController();
	}
	
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
