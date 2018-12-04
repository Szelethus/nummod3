# Nummód 3 Maple segédlet

## Maple használata .txt fájl + terminál használatával

Ha utálod hogy a GUI-val többet kell küzdeni mint az érdemi feladattal, akkor ez a megoldás neked való.

1. Adjuk hozzá a maple-t a PATH-hoz. Igazán a `cmaple.exe` fájlra van szükség. Ez nálam itt van: `c:\Program Files (x86)\Maple 2018\bin.win\`

2. Teszteljük le hogy ez sikeres volt-e: (windows gomb)+R, írjuk be hogy cmd, majd futtasuk a maple command line-os felületét a `cmaple` parancs kiadásával. Kilépni a `quit;` paranccsal lehet, én kicsapnám az egész command promtot mert szopás benne navigálni.

3. Hozzunk létre a script fájlt, melyet futtatni akarunk. Én az `.mm` kiterjesztést adtam (mint "manageable maple", szemben a GUIs verzióval), de nem számít egyáltalán. Tegyünk egy rövid maple programot a fájlba (nálam ez egy egysoros `print("Hello World!");` volt).

4. Shift+jobb klikk a mappa belsejében ahol a fájl van, "Open command prompt window here", majd adjuk ki a következő parancsot: `maple <fájlnév>`

Ha valami eddig nem működött, kapjunk kezünkhoz egy digitális bibliát (értsd: google) és imádkozzunk (értsd: reménykedve debuggoljunk).

Ha eddig különösebb gond nem volt, örüljünk hogy kaptunk egy kezelhető (különösképpen _verziókezelhető_) maplet.

## Plotok használata

Ha kipróbáljuk a plot parancsot pl. a követekző rövid programmal, egészen ötletes reprezentációt kapunk, azonban itt valóban nem ártana valami grafikus felület:

```matlab
f:=x->x^2;
plot(f,0..1);
```

Erre a megoldás az, hogy maga a függvény megjelenítést másik eszközzel jelentjük meg. A különböző eszközök listája itt érhető el:
https://www.maplesoft.com/support/help/maple/view.aspx?path=plot%2fdevice

Én úgy találtam, hogy a `maplet` formátum elég gyors és jól kezelhető, így a teljes script így néz ki:

```matlab
plotsetup(maplet);
f:=x->x^2;
plot(f,0..1);
```

Több `plot` utasítás esetén azonban minden sornál megnyílik a maplet ablak, amit be kell zárni, és utána folyatódik csak a script. Erre a megoldás az, hogyha a plotok megjelenítését a script végére hagyjuk.

```matlab
# A kettőspont nem szükséges, de ha ott van, nem ad az előtte
# levő parancs semmilyen outputot, pl. itt lényegtelen hogy
# milyen függvényeket importálunk be.
with(plots):;
plotsetup(maplet);

f:=x->x^2;

A := Array(1..2):;

A[1] := plot(f,0..1):;
A[2] := plot(f,0..2):;

display(A);
```
