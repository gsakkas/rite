LetG NonRec (fromList [(VarPatG,BopG EmptyG EmptyG)]) (CaseG (fromList [(LitPatG,Nothing,EmptyG)]))
let depth = depth - 1 in
match rand (0 , 4) with
| 0 -> buildSine (build (rand , depth))
| 1 -> buildCosine (build (rand , depth))
| 2 -> buildAverage (build (rand , depth) , build (rand , depth))
| 3 -> buildTimes (build (rand , depth) , build (rand , depth))
| 4 -> buildThresh (build (rand , depth) , build (rand , depth) , build (rand , depth) , build (rand , depth))
