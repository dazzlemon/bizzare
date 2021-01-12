using Godot;
using System;

public class Pause : CanvasLayer
{
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
        Vbox = (VBoxContainer)GetNode("Control/VBoxContainer");
        Continue = (Button)Vbox.GetNode("Continue");
        Continue.Connect("pressed", this, "OnContinuePressed");
        Restart = (Button)Vbox.GetNode("Restart");
        Restart.Connect("pressed", this, "OnRestartPressed");
        Settings = (Button)Vbox.GetNode("Settings");
        Settings.Connect("pressed", this, "OnSettingsPressed");
        Exit = (Button)Vbox.GetNode("Exit");
        Exit.Connect("pressed", this, "OnExitPressed");

        SetVisible(false);

    }

    public void SetVisible(bool IsVisible)
    { 
        control.Visible = IsVisible;
    }

    public override void _Input(InputEvent inputEvent)
    {
        if(inputEvent.IsActionPressed("ui_cancel")) //&& CurrenScene() != "TitleScreen" && !IsSettingsShown && !IsConsoleShown{}
        {
            PauseToggle();
        }
    }
 /* public string current scene():
        return GetTree().GetCurrentScene().GetName();
    */
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
        SetVisible(false);

    }
     void OnSettingsPressed()
    {
        IsSettingsShown = true;
        GD.Print("Settings");
        control.Visible = false;
    }
    void OnExitPressed()
    {
        GetTree().Quit();
    }
}
