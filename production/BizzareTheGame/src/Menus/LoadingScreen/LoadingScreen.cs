using Godot;
using System;
using System.Diagnostics;

public class LoadingScreen : Control
{
    private const int SIMULATEDDELAYSEC = 1;
    private TextureProgress progress;
    private Thread thread;

    public override void _Ready()
    {
        progress = (TextureProgress)GetNode("Panel/TextureProgress");
    }

    private void _ThreadLoad(NodePath Path)
    {
        ResourceInteractiveLoader? rli = ResourceLoader.LoadInteractive(Path);
        //Assert(rli);        
        int total = rli.GetStageCount();
        GD.Print(rli.GetStageCount());
        //progress.CallDeferred("SetMax",total);
        progress.MaxValue = total;
        PackedScene res = null;
        Error err = (Error)0;
        while (err == (Error)0)
        {
            progress.Value = rli.GetStage();
            OS.DelayMsec((SIMULATEDDELAYSEC * 100));
            err = rli.Poll();
        }
        if(err != 0)
        {
            if (err == (Error)18)
            {
                res = (PackedScene)rli.GetResource();
                //GD.Print(rli.GetResource());
               // GD.Print(res);
            }
            else
            {
                GD.Print("There was an error loading");
            }
        }
        CallDeferred("_ThreadDone", res);
    }

    private void _ThreadDone(PackedScene resource)
    {
        GD.Print(resource);
        //Assert resource
        thread.WaitToFinish();
        progress.Hide();
        //GD.Print(resource.Instance());
        Node NewScene = resource.Instance();
        GetTree().CurrentScene.Free();
        GetTree().CurrentScene = null;
        GetTree().Root.AddChild(NewScene);
        GetTree().CurrentScene = NewScene;
        Visible = false;
    }

    public void LoadScene(NodePath path)
    {
        thread = new Thread();
        thread.Start(this, "_ThreadLoad" , path);
        Raise();
        progress.Visible = true;
    }

}
