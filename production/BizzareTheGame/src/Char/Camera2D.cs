using Godot;
using System;

public class Camera2D : Godot.Camera2D
{
    private Godot.KinematicBody2D parent;
    private float distance;
    private Vector2 direction;

    const int DeadZone = 18;
    const float sensivity = 0.3f;

    public override void _Ready()
    {
        parent = (KinematicBody2D)GetParent();
        GD.Print(parent);
    }
    public override void _Process(float delta){
        //parent = GetParent();
        Vector2 MousePosition = GetGlobalMousePosition();
        direction = (MousePosition - parent.GlobalPosition).Normalized();
        distance = GlobalPosition.DistanceTo(MousePosition);

        GlobalPosition = distance > DeadZone ? parent.GlobalPosition + direction * (distance - DeadZone) * sensivity :
                                               GlobalPosition.LinearInterpolate(parent.GlobalPosition, 0.01f);
    }
}



