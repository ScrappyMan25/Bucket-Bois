using UnityEngine;
using System.Collections;

public class Gun : MonoBehaviour
{
    public float damage = 10f;
    public float TimeToReload = 2f;
    public float ammoCount = 25f;
    public float maxAmmo = 25f;
    private bool isReloading = false;

    public GameObject bulletPrefab;
    public Camera fpsCam;



    // Update is called once per frame
    void Update()
    {

        if(isReloading)
        {
            return;
        }
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

        if(ammoCount <= 0)
        {
            StartCoroutine(Reload());
            return;
        }
    }


    IEnumerator Reload ()
    {
        isReloading = true;
        Debug.Log("reloading");

        yield return new WaitForSeconds(TimeToReload);


        ammoCount = maxAmmo;
        isReloading = false;

    }


    
}
