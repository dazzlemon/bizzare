using Godot;
using System;

public class BaseHitscan : SpellCDDuration
{
    private CollisionShape2D Hitbox;
    private stats? Stats;

    public override void _Ready()
    {
        DURATION = 0.25f;
        INTERVAL = 0.15f;
        Hitbox = (CollisionShape2D)GetNode("Position2D/hitbox/CollisionShape2D");
        base._Ready();
    }

    private float GetDamage()
    {
        return Stats.Damage;
    }

}
