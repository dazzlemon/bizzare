using Godot;
using System;
using System.Collections;

public class BaseChar : KinematicBody2D
{
	public BaseControl Controller;
	public float 	   Accel	= 2000;
	public float 	   Decel	= 300;
	public float 	   MaxSpeed = 2000;
	public Vector2	   Velocity = Vector2.Zero;
	
	public override void _PhysicsProcess(float delta)
	{
		Vector2 inputVector = new Vector2(
			Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left"),
			Input.GetActionStrength("ui_down")  - Input.GetActionStrength("ui_up")
		).Normalized();
		Velocity = inputVector != Vector2.Zero ? velocity.MoveToward(input_vector * MAX_SPEED, ACCEL * delta)
											   : velocity.MoveToward(			 Vector2.Zero, DECEL * delta);
		MoveAndSlide(velocity * delta); 
	}
}
