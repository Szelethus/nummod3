# Nummód 3 Maple segédlet

## Maple használata .txt fájl + terminál használatával

1. Adjuk hozzá a maple-t a PATH-hoz. Igazán a `cmaple.exe` fájlra van szükség. Ez nálam itt van: `c:\Program Files (x86)\Maple 2018\bin.win\`

2. Teszteljük le hogy ez sikeres volt-e: (windows gomb)+R, írjuk be hogy cmd, majd futtasuk a maple command line-os felületét a `cmaple` parancs kiadásával. Kilépni a `quit;` paranccsal lehet, én kicsapnám az egész command promtot mert szopás benne navigálni.

3. Hozzunk létre a script fájlt, melyet futtatni akarunk. Én az `.mm` kiterjesztést adtam (mint "manageable maple", szemben a GUIs verzióval), de nem számít egyáltalán. Tegyünk egy rövid maple programot a fájlba (nálam ez egy egysoros `print("Hello World!");` volt).

4. Shift+jobb klikk a mappa belsejében ahol a fájl van, "Open command prompt window here", majd adjuk ki a következő parancsot: `maple <fájlnév>`

Ha valami eddig nem működött, kapjunk kezünkhoz egy digitális bibliát (értsd: google) és imádkozzunk (értsd: reménykedve debuggoljunk).