LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (CaseG EmptyG (fromList [(LitPatG,Nothing,EmptyG)]))
let rdm = rand (0 , 7) in
match rdm with
| 0 -> buildY ()
| 1 -> buildX ()
| 2 -> Cosine (build (rand , depth - 1))
| 3 -> Sine (build (rand , depth - 1))
| 4 -> Average (build (rand , depth - 1) , build (rand , depth - 1))
| 5 -> Times (build (rand , depth - 1) , build (rand , depth - 1))
| 6 -> Thresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
