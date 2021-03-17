using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tree_WaterRange : MonoBehaviour
{
    // Start is called before the first frame update
    public bool in_Range = false;

    // Update is called once per frame
    private void OnTriggerEnter(Collider other)
    {
        print("Enter Water");
        if (other.tag == "Player")
        {
           other.GetComponentInChildren<MeshRenderer>().material.color = Color.blue;
            in_Range = true;
        }

    }
    private void OnTriggerExit(Collider other)
    {
        print("Exit Water");
        if (other.tag == "Player")
        {
            other.GetComponentInChildren<MeshRenderer>().material.color = Color.green;
            in_Range = false;
        }
    }
}
