CaseG (AppG [EmptyG]) [(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(WildPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG]),(LitPatG,Nothing,AppG [EmptyG])]
EMPTY
match rand (0 , 7) with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildX ()
