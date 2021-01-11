using Godot;
using System;

public interface IState
{
	Char Parent
	{
		get;
	}
	void Exit();
	void Enter();
	IState? Handle(IInputAction input);
	void Process(float delta);
}

class Run : IState
{
	public Run(Char parent)
	{
		__parent = parent;
	}
	
	Char __parent;
	public Char Parent
	{
		get {return __parent;}
	}
	public void Enter() {}
	public void Exit() {}
	
	public IState? Handle(IInputAction input)
	{
		if (input is ActionMove)
		{
			Parent.Velocity = Vector2.Right * Parent.MaxVelocity;//input.Where * Parent.MaxVelocity;
		}
		if (input is ActionSpell1)
		{
			GD.Print("Can't cast spell");
		}
		return null;
	}
	
	public void Process(float delta)
	{
		Parent.Velocity = Parent.Velocity.MoveToward(Vector2.Zero, Parent.Decel * delta);
		Parent.MoveAndSlide(Parent.Velocity * delta); 
		if (Parent.Velocity == Vector2.Zero)
		{
			Parent.State = new Idle(Parent);
		}
	}
}

class Idle : IState
{
	public Idle(Char parent)
	{
		__parent = parent;
	}
	
	Char __parent;
	public Char Parent
	{
		get {return __parent;}
	}
	public void Enter()
	{
		Parent.Velocity = Vector2.Zero;
	}
	public void Exit() {}
	public IState? Handle(IInputAction input)
	{
		if (input is ActionMove)
		{
			Parent.Velocity = Vector2.Right * Parent.MaxVelocity;//input.Where * Parent.MaxVelocity;
			return new Run(Parent);
		}
		if (input is ActionSpell1)
		{
			GD.Print("Casted a spell");
			return new Busy(Parent);
		}
		return null;
	}
	
	public void Process(float _delta) {}
}

class Busy : IState
{
	public Busy(Char parent)
	{
		__parent = parent;
	}
	
	Char __parent;
	public Char Parent
	{
		get {return __parent;}
	}
	public void Enter() {}
	public void Exit() {}
	public IState? Handle(IInputAction input)
	{
		if (input is ActionMove)
		{
			GD.Print("Can't move");
		}
		if (input is ActionSpell1)
		{
			GD.Print("Can't cast spell");
		}
		return null;
	}
	
	float __PseudoTimer = 3;
	
	public void Process(float delta)
	{
		__PseudoTimer -= delta;
		if (__PseudoTimer <= 0)
		{
			Parent.State = new Idle(Parent);
		}
	}
}
