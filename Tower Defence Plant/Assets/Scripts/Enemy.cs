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
        turret = FindClosestTurret();
        float TargetDistance = Vector3.Distance(target.position, transform.position);       
        float TurretDistance = Vector3.Distance(turret.transform.position, transform.position);
        if (TargetDistance > TurretDistance)
        {
            Vector3 turretDir = turret.transform.position - transform.position;
            transform.Translate(turretDir.normalized * speed * Time.deltaTime, Space.World);
        }
        else
        {
            Vector3 targetDir = target.position - transform.position;
            transform.Translate(targetDir.normalized * speed * Time.deltaTime, Space.World);
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

    private void OnCollisionEnter(Collision collision)
    {
        if(collision.gameObject.name == "Bullet")
        {
            health -= 10;
        }
        if(health<=0)
        {
            Destroy(gameObject);
        }
    }
}
