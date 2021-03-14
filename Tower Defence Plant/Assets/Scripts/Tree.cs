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
        print("Trigger");
        print(other.ToString());
    }
    private void OnTriggerExit(Collider other)
    {
        print("Trigger");
        print(other.ToString());
    }
}
