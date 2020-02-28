CaseG (AppG [EmptyG]) [(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG])]
match r with
| 3 -> buildAverage (build (rand , d - 1) , build (rand , d - 1))
| 4 -> buildTimes (build (rand , d - 1) , build (rand , d - 1))
| 5 -> buildThresh (build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1) , build (rand , d - 1))
EMPTY
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
match r with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , buildY ())
| 3 -> buildTimes (build (rand , depth - 1) , buildX ())
| 4 -> buildThresh (build (rand , depth - 1) , buildX () , buildY () , buildX ())
| 5 -> buildSinCos (build (rand , depth - 1))
