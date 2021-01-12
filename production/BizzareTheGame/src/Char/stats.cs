using Godot;
using System;

public class stats : Node
{
    //Health
    private float MaxHealth = 1f;
    private float MaxSecondatyStat = 0f; //Armor as name for second stat 
    private float health = 1f;
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
    private float SecondatyStat {set;get;}
    private float HealthRestore = 0f;
    private float SecondatyStatRestore = 0f;

    //Deffence
    private float DamageBlock = 0f;
    private float Evasion = 0f;

    //Attack
    private float Damage = 1f;
    private float CritChance = 0f;
    private float CritMultiplier = 1.75f;
    private float Lifesteal = 0f;
    private float Accuracy = 0;
    

    [Signal]
    public delegate void _OnEmpty(string Who);


    public override void _Ready()
    {
        Health = MaxHealth;
        SecondatyStat = MaxSecondatyStat;
    }

}
