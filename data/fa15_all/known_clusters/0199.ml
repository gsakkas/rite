CaseG VarG (fromList [(Nothing,AppG (fromList [EmptyG])),(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG)])
match depth with
| 0 -> buildX ()
| 1 -> buildY ()
| _ -> (let r =
          rand (1 , 6) in
        match r with
        | 1 -> buildSine (build (rand , depth - 1))
        | 2 -> buildCosine (build (rand , depth - 1))
        | 3 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
        | 4 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
        | 5 -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
