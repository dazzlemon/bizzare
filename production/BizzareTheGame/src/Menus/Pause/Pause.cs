using Godot;
using System;

public class Pause : CanvasLayer
{
    public LoadingScreen loadingScreen;
    public PackedScene SettingsMenu = ResourceLoader.Load("res://src/Menus/Settings/SettingsMenu.tscn") as PackedScene;
    public Control control;
    public VBoxContainer Vbox ;
    public Button Continue;
    public Button Restart;
    public Button Settings;
    public Button Exit;
    public bool IsSettingsShown = false;
    //public bool IsConsoleShown = false;

    public override void _Ready()
    {
        control = (Control)GetNode("Control");
        Vbox = (VBoxContainer)control.GetNode("VBoxContainer");
        Continue = (Button)Vbox.GetNode("Continue");
        Continue.Connect("pressed", this, "OnContinuePressed");
        Restart = (Button)Vbox.GetNode("Restart");
        Restart.Connect("pressed", this, "OnRestartPressed");
        Settings = (Button)Vbox.GetNode("Settings");
        Settings.Connect("pressed", this, "OnSettingsPressed");
        Exit = (Button)Vbox.GetNode("Exit");
        Exit.Connect("pressed", this, "OnExitPressed");

        SetVisible(false);

        loadingScreen = (LoadingScreen)GetNode("/root/LoadingScreen");
    }

    public void SetVisible(bool IsVisible)
    { 
        control.Visible = IsVisible;
    }

    public override void _Input(InputEvent inputEvent)
    {
        if(inputEvent.IsActionPressed("ui_cancel") && !IsSettingsShown) //&& CurrentScene() != "TestLevel")//  && !IsConsoleShown{}
        {
            PauseToggle();
        }
    }
    public string CurrentScene(){
        return GetTree().CurrentScene.Name;   
    }
        
    
    public void PauseToggle()
    {
        GetTree().Paused = !GetTree().Paused;
        //GD.Print(GetTree().Paused);
        SetVisible(GetTree().Paused);
        MouseModeToggle();
    }

    public int Map(int x,int in_min,int in_max, int out_min, int out_max)
    {
        return (x - in_min) * (out_max - out_min) / (in_max-in_min) + out_min;
    }
   private void MouseModeToggle()
   {
        GD.Print((int)Input.GetMouseMode());
       //Input.SetMouseMode(Map((int)Input.GetMouseMode(),0,1,1,0));
   }

    void OnContinuePressed()
    {
        PauseToggle();
    }

   
    void OnRestartPressed()
    {
        PauseToggle();
        GetTree().Root.GetNode("Game/TestLevel").QueueFree();
        loadingScreen.LoadScene("res://src/Game.tscn");
        //loadingScreen.LoadScene("res://src/TestLevel.tscn");
        GD.Print(GetTree().Root.GetChildren());
        
        
        loadingScreen.Visible = true;
        SetVisible(false);

    }
    void OnSettingsPressed()
    {
        Control newSettings = (Control)SettingsMenu.Instance();
        AddChild(newSettings);
        //CallDeferred("AddChild",newSettings);
        IsSettingsShown = true;
        control.Visible = false;
    }
    void OnExitPressed()
    {
        GetTree().Quit();
    }
}
