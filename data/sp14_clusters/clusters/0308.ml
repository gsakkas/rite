CaseG (TupleG [EmptyG,EmptyG]) [(Nothing,IteG EmptyG EmptyG EmptyG),(Nothing,LetG NonRec [EmptyG] EmptyG)]
match (rand , depth) with
| (r , 0) -> if r (0 , 1) = 0
             then buildX ()
             else buildY ()
| (r , depth) -> (let r =
                    rand (0 , 7) in
                  match r with
                  | 0 -> buildX ()
                  | 1 -> buildY ()
                  | 2 -> buildSine (build (rand , depth - 1))
                  | 3 -> buildCosine (build (rand , depth - 1))
                  | 4 -> buildAverage (build (rand , depth - 1) , build (rand , depth - 1))
                  | 5 -> buildTimes (build (rand , depth - 1) , build (rand , depth - 1))
                  | _ -> buildThresh (build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1) , build (rand , depth - 1)))
