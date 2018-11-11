CaseG (AppG [EmptyG]) [(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG]),(Nothing,AppG [EmptyG])]
match rand (1 , 13) with
| 1 -> buildSine (build (rand , depth - 1))
| 2 -> buildCosine (build (rand , depth - 1))
| 3 -> buildSine (build (rand , depth - 1))
| 4 -> buildCosine (build (rand , depth - 1))
| 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> buildSine (build (rand , depth - 1))
| 7 -> buildCosine (build (rand , depth - 1))
| 8 -> buildSine (build (rand , depth - 1))
| 9 -> buildCosine (build (rand , depth - 1))
| 10 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| 11 -> buildX ()
| 12 -> buildY ()
