using Godot;
using System;
using System.Collections;

public class SettingsMenu : Control
{
    public Pause pause;
    public PackedScene AudioSettings = ResourceLoader.Load("res://src/Menus/AudioSetting/AudioSettings.tscn") as PackedScene;
    public VBoxContainer Vbox ;
    public Button General;
    public Button Controls;
    public Button Audio;
    public Button Graphics;    
    public Button Back;
     
    public override void _Ready()
    {
        Vbox = (VBoxContainer)GetNode("VBoxContainer");
        General = (Button)Vbox.GetNode("General");
        General.Connect("pressed", this, "OnGeneralPressed");
        Controls = (Button)Vbox.GetNode("Controls");
        Controls.Connect("pressed", this, "OnControlsPressed");
        Audio = (Button)Vbox.GetNode("Audio");
        Audio.Connect("pressed", this, "OnAudioPressed");
        Graphics = (Button)Vbox.GetNode("Graphics");
        Graphics.Connect("pressed", this, "OnGraphicsPressed");
        Back = (Button)GetNode("Back");
        Back.Connect("pressed", this, "OnBackPressed");
        
        pause = (Pause)GetNode("/root/Pause");

        
    }

    void OnGeneralPressed()
    {
        GD.Print("General");
    }
    void OnControlsPressed()
    {
        QueueFree();
        //InputMapSettings._Show()
    }
    void OnAudioPressed()
    {
        _Visible();
        Control newAudioSettings = (Control)AudioSettings.Instance();
        AddChild(newAudioSettings);
    }
    void OnGraphicsPressed()
    {
         GD.Print("Graphics");
    }
    void OnBackPressed()
    {
        if(GetTree().CurrentScene.Name == "TestLevel")
        {
            pause.IsSettingsShown = false;
            pause.SetVisible(true);
        }
        QueueFree();
    }

    private void _Visible()
    {
        GetNode<Panel>("Panel").Visible = !GetNode<Panel>("Panel").Visible; //OSUZHDAYU STATIC TYPING V 2021;
        GetNode<Button>("Back").Visible = !GetNode<Button>("Back").Visible;
        GetNode<VBoxContainer>("VBoxContainer").Visible = !GetNode<VBoxContainer>("VBoxContainer").Visible;
       /*foreach(Godot.Object node in GetChildren())
        {
            node.Visible = false;
            GD.Print(node);
        }*/
    }
}
