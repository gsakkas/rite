CaseG (TupleG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG]),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG])),(TuplePatG (fromList [VarPatG,LitPatG]),Just (BopG EmptyG EmptyG),AppG (fromList [EmptyG]))])
match (rand (243 , 98723) , depth) with
| (x , 0) when (x mod 2) = 0 -> buildY ()
| (x , 0) when (x mod 2) = 1 -> buildX ()
| (x , n) when (n > 0) && ((x mod 5) = 0) -> buildSine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 1) -> buildCosine (build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 2) -> buildAverage (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 3) -> buildTimes (build (rand , n - 1) , build (rand , n - 1))
| (x , n) when (n > 0) && ((x mod 5) = 4) -> buildThresh (build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1) , build (rand , n - 1))
