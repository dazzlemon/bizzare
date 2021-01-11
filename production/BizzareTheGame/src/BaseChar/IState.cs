using Godot;
using System;

interface IState
{
	void Exit();
	void Enter();
	IState? Handle(IInputAction Input_);
}
