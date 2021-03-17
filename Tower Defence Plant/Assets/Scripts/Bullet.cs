using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class Bullet : MonoBehaviour
{
    public float speed = 30f;
    public float bulletLife = 3f;

    private float bulletTimer;
    void Start()
    {
        bulletTimer = bulletLife;
    }

    
    void Update()
    {
        transform.position += transform.forward * speed * Time.deltaTime;

        bulletTimer -= Time.deltaTime;
        if(bulletTimer <= 0f)
        {
            Destroy(gameObject);
        }

        
    }


    private void OnCollisionEnter(Collision collision)
    {
        if (collision.transform.tag == "Enemy")
        {
           
            Debug.Log("Hit Enemy");
            collision.gameObject.GetComponent<Enemy>().TakeDamage(10);
            Destroy(gameObject);
        }

        if (collision.gameObject.layer == 8)
        {
            Destroy(gameObject);
            Debug.Log("bullet hit ground");
        }
    }
}
