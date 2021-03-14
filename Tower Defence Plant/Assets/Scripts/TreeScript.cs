using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class TreeScript : MonoBehaviour
{
    public int Health = 0;
    public int rate_Of_Decay = 0;
    public float AOE = 10f;
    public SphereCollider Range;

    private void OnEnable()
    {
        print("Started");
        Range.radius = AOE;
    }

    private void OnTriggerEnter(Collider other)
    {
        if(other.tag == "Player")
        {
            //GameObject Player = other.gameObject;
            Material temp = other.GetComponentInChildren<MeshRenderer>().material;
            temp.color = Color.green;
        }

    }
    private void OnTriggerExit(Collider other)
    {
        if (other.tag == "Player")
        {
            GameObject Player = other.gameObject;
            Material temp = Player.GetComponentInChildren<MeshRenderer>().material;
            temp.color = Color.red;
        }
    }
}
