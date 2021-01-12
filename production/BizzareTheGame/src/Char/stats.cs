using Godot;
using System;

public class stats : Node
{
    //Health
    public float MaxHealth = 1f;
    public float MaxSecondatyStat = 0f; //Armor as name for second stat 
    public float health = 1f;
    public float Health
    {
        set
        {
            if (value > MaxHealth)
            {
                health = MaxHealth;
            }
            else
            {
                health = value;
                if (health <= 0)
                {
                    EmitSignal(nameof(_OnEmpty), "health"); 
                }
            }
        }
        get
        {
            return health;
        }
    }
    public float SecondatyStat {set;get;}
    public float HealthRestore = 0f;
    public float SecondatyStatRestore = 0f;

    //Deffence
    public float DamageBlock = 0f;
    public float Evasion = 0f;

    //Attack
    public float Damage = 1f;
    public float CritChance = 0f;
    public float CritMultiplier = 1.75f;
    public float Lifesteal = 0f;
    public float Accuracy = 0;
    

    [Signal]
    public delegate void _OnEmpty(string Who);


    public override void _Ready()
    {
        Health = MaxHealth;
        SecondatyStat = MaxSecondatyStat;
    }

}
