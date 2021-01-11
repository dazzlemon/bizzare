using Godot;
using System;
using System.Collections;

public class Char : KinematicBody2D
{
	IState __State;
	IController __Controller;
	
	public override void _Process(float delta)
	{
		var newState = __State.Handle(__Controller.Input_);
		if (newState)
		{
			__State.exit();
			__State = newState;
			__State.enter();
		}
	}
}
