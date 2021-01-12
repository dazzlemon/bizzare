using Godot;
using System;

public class SpellCDDuration : SpellCD
{
    public float DURATION;
    public Timer duration;
    public override void _Ready()
    {
        duration = (Timer)GetNode("duration");
        base._Ready();
        duration.Connect("timeout",this,"OnTimeout");
    } 
    void OnTimeout()
    {
        Stop();
    }
    public override void TimersStart(){
       cd.Start(INTERVAL + DURATION);
       duration.Start(DURATION);
    }

    public virtual void Stop()
    {
        GD.Print("Stop");
    }

}
