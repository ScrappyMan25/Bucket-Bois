using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeScript : MonoBehaviour
{
    //Red Not in Range. 
    //Green - AOE Range
    //Blue Water Range

    public float Health = 100;
    public float Max_Health = 100;
    public float rate_Of_Decay = 1f;
    public float AOE_Radius = 5;
    public float water_Radius = 3;

    public GameObject Player;
    public GameObject aoe_range;
    public GameObject water_range;


    private void Start()
    {
        aoe_range.GetComponent<SphereCollider>().radius = AOE_Radius;
        water_range.GetComponent<BoxCollider>().size = new Vector3(water_Radius, water_Radius, water_Radius);
        InvokeRepeating("Decay", 1f, 1f); // Calls Decay every Second
    }
    private void Decay()
    {
        Health -= rate_Of_Decay;
        if (Health <= 0)
        {
            Player.GetComponentInChildren<MeshRenderer>().material.color = Color.red;
            Destroy(gameObject);
        }
    }

    private void Update()
    {
        if (water_range.GetComponent<Tree_WaterRange>().in_Range)
        {
            if(Health < Max_Health)
            {
                Health++;
            }
        }
    }

}
