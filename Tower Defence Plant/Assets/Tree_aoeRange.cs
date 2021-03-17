using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Tree_aoeRange : MonoBehaviour
{
   private void OnTriggerEnter(Collider other)
    {
        if (other.tag == "Player")
        {
            other.GetComponentInChildren<MeshRenderer>().material.color = Color.green;
        }

    }
    private void OnTriggerExit(Collider other)
    {
        if (other.tag == "Player")
        {
            other.GetComponentInChildren<MeshRenderer>().material.color = Color.red;
        }
    }
}
