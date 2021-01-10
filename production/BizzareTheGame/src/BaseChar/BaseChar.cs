using Godot;
using System;
using System.Collections;

public class BaseChar : KinematicBody2D
{
    public BaseControl Control;
    public float ACCEL = 2000;
    public float DECEL = 300;
    public float MAX_SPEED = 2000;
    public Vector2 velocity = Vector2.Zero;
    /*  public object state = States.FRICTION;
      enum States{
          FRICTION,
          NO_FRICTION,
      }


      private Vector2 accelerate(float delta, Vector2 speed, Vector2 input_vector){
          return speed.MoveToward(input_vector * MAX_SPEED, ACCEL * delta);
      }

      private Vector2 decelerate(float delta, Vector2 speed){
          return speed.MoveToward(Vector2.Zero, DECEL * delta);
      }

      private void friction(float delta, Vector2 input_vector){
          if (input_vector == Vector2.Zero){
              velocity = MoveAndSlide(decelerate(delta,velocity));
          }
          else{
              velocity = MoveAndSlide(accelerate(delta,velocity,input_vector));
          }
      }

      private void no_fricition(float delta, Vector2 input_vector){
          velocity = Vector2.Zero;
          MoveAndSlide(input_vector * MAX_SPEED);
      }
      public override void _PhysicsProcess(float delta)
      {
          Vector2 input_vector = Control.GetInputVector();

          //base._PhysicsProcess(delta);
      }
      */

    public override void _PhysicsProcess(float delta)
    {
        Vector2 input_vector = Vector2.Zero;
        input_vector.x = Input.GetActionStrength("ui_right") - Input.GetActionStrength("ui_left");
        input_vector.y = Input.GetActionStrength("ui_down") - Input.GetActionStrength("ui_up");
        input_vector = input_vector.Normalized();

        velocity = input_vector != Vector2.Zero ? velocity.MoveToward(input_vector * MAX_SPEED, ACCEL * delta) : velocity.MoveToward(Vector2.Zero, DECEL * delta);

        MoveAndSlide(velocity * delta); 

    }
}
