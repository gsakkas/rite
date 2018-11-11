LetG NonRec [AppG [EmptyG]] (CaseG EmptyG [(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG),(Nothing,EmptyG)])
let r = rand (0 , 7) in
match r with
| 0 -> buildX ()
| 1 -> buildY ()
| 2 -> buildSine (build (rand , depth - 1))
| 3 -> buildCosine (build (rand , depth - 1))
| 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
