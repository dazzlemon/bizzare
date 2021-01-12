using Godot;
using System;

public class SpellCD : Node2D
{
    public float INTERVAL;
    public Timer cd;

    public override void _Ready()
    {
        cd = (Timer)GetNode("cd");
    } 

    public virtual void start()
    {
        GD.Print("start");
    }

    private void TryUse()
    {
        if(IsAbleToUse())
        {
            TimersStart();
            start();
        }
    }

    public virtual void TimersStart()
    {
        cd.Start(INTERVAL);
    }

    private bool IsAbleToUse()
    {
        return cd.TimeLeft == 0;
    }
}
