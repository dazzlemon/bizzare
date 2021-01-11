using Godot;
using System;

public class Player : Char
{	
	public Player() : base()
	{
		__Controller = new PlayerController(this);
	}
}
