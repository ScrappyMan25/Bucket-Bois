using System.Collections;
using System.Collections.Generic;
using UnityEngine;

public class RandomSpawn : MonoBehaviour
{
    [SerializeField]
    public Transform enemies;
    private int xPos;
    private int zPos;
    public int spawnRange;
    public float timeBetweenWaves = 5f;
    private int waveNumber = 1;
    private int enemyCount = 7;
    public float countDown = 0f;
    private float calc;

    private void Update()
    {
        if(countDown <= 0f)
        {
            
            SpawnWave();
            countDown = timeBetweenWaves;
        }
        countDown -= Time.deltaTime;
    }

    void SpawnWave()
    {
        if (transform.childCount == 0)
        {
            
            for (int i = 0; i < enemyCount; i++)
            {
                StartCoroutine(SpawnAnEnemy());
            }
            calc = 1.2f * enemyCount;
            enemyCount = (int)Mathf.Round(calc);
            waveNumber++;
        }
    }

    IEnumerator SpawnAnEnemy()
    {
        do
        {
            xPos = Random.Range(-spawnRange, spawnRange);
            zPos = Random.Range(-spawnRange, spawnRange);
        }
        while (!((xPos > (spawnRange - 50) || xPos < -(spawnRange - 50)) || (zPos > (spawnRange - 50) || zPos < -(spawnRange - 50))));
        Vector3 spawnRadius = new Vector3(xPos, 4, zPos);
        Instantiate(enemies, spawnRadius, Quaternion.identity, transform);
        yield return new WaitForSeconds(0.1f);
    }

    private void OnDrawGizmos()
    {
        Gizmos.color = Color.red;
        Gizmos.DrawWireSphere(GameObject.FindGameObjectWithTag("Mother").transform.position, spawnRange);
    }
}
