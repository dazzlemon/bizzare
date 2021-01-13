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

    private void _ThreadLoad(string Path)
    {
        var rli = ResourceLoader.LoadInteractive(Path);
        //Debug.Assert(rli);        
        var total = rli.GetStageCount();
        progress.CallDeferred("SetMax",total);
        Resource res = null;
        Error err = 0;
        while (err == 0)
        {
            progress.CallDeferred("SetValue", rli.GetStage());
            OS.DelayMsec((SIMULATEDDELAYSEC * 100));
            err = rli.Poll();
        }
        if(err != 0)
        {
            if (err == (Error)18)
            {
                res = rli.GetResource();
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
        //Assert resource
        thread.WaitToFinish();
        progress.Hide();
        Node NewScene = (Node)resource.Instance();
        GetTree().CurrentScene.Free();
        GetTree().CurrentScene = null;
        GetTree().Root.AddChild(NewScene);
        GetTree().CurrentScene = NewScene;
        Visible = false;
    }

    public void LoadScene(string path)
    {
        thread = new Thread();
        thread.Start(this, "_ThreadLoad" , path);
        Raise();
        progress.Visible = true;
    }

}
