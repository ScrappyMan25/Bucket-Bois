using UnityEngine;

public class Gun : MonoBehaviour
{
    public float damage = 10f;
    public float range = 100f;
    public float ammoCount = 50f;

    public GameObject bulletPrefab;
    public Camera fpsCam;



    // Update is called once per frame
    void Update()
    {
        if(Input.GetButtonDown("Fire1"))
        {
            if (ammoCount > 0)
            {
                GameObject bulletObject = Instantiate(bulletPrefab);
                bulletObject.transform.position = transform.position + transform.forward;
                bulletObject.transform.forward = fpsCam.transform.forward;
                ammoCount -= 1;
            }
        }
    }


    
}
