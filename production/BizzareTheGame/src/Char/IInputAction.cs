using Godot;
using System;

public interface IInputAction
{
	
}

class ActionMove : IInputAction
{
	public ActionMove(Vector2 where_)
	{
		Where = where_;
	}
	
	public Vector2 Where;
}

class ActionSpell1 : IInputAction
{
	
}

class ActionNull : IInputAction
{
	
}
