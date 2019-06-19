CaseG (AppG [EmptyG]) [(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG])]
match x with
| 0 -> buildSine (build (rand , depth - 1))
| 1 -> buildCosine (build (rand , depth - 1))
| 2 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 3 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 4 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
match rand (0 , 1) with
| 0 -> buildX ()
| 1 -> buildY ()
