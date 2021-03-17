using UnityEngine;

public class Enemy : MonoBehaviour
{
    public float speed = 10f;
    private Transform target;
    private GameObject turret;
    public int health;

    void Awake()
    {
        target = GameObject.Find("Cube").transform;
    }

    void Update()
    {
        try
        {
            Vector3 targetDir = target.position - transform.position; //Finds the direction
            transform.Translate(targetDir.normalized * speed * Time.deltaTime, Space.World); //Move toward the object
        }
        catch
        {
            target = GameObject.Find("Cube").transform;
        }
    }

    public GameObject FindClosestTurret()
    {
        GameObject[] gos;
        gos = GameObject.FindGameObjectsWithTag("Mother");
        GameObject closest = null;
        float distance = Mathf.Infinity;
        Vector3 position = transform.position;
        foreach(GameObject go in gos)
        {
            Vector3 diff = go.transform.position - position;
            float curDistance = diff.sqrMagnitude;
            if(curDistance < distance)
            {
                closest = go;
                distance = curDistance;
            }
        }
        return closest;
    }

    private void OnTriggerStay(Collider other)
    {
        target = other.transform;
    }

    private void OnTriggerExit(Collider other)
    {
        target = GameObject.Find("Cube").transform;
    }
}
