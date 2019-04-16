CaseG (TupleG (fromList [EmptyG])) (fromList [(TuplePatG (fromList [VarPatG,LitPatG]),Nothing,IteG EmptyG EmptyG EmptyG),(TuplePatG (fromList [LitPatG,WildPatG]),Nothing,AppG (fromList [EmptyG]))])
match (rand (2 , 8) , depth) with
| (c , 0) -> if c > 3
             then buildX ()
             else buildY ()
| (2 , _) -> buildSine (build (rand , depth - 1))
| (3 , _) -> buildCosine (build (rand , depth - 1))
| (4 , _) -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
| (5 , _) -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
| (6 , _) -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
| (7 , _) -> buildMirana (build (rand , depth - 1))
| (8 , _) -> buildDarius (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1))
