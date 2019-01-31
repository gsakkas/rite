CaseG VarG (fromList [(Nothing,LetG NonRec (fromList [EmptyG]) EmptyG),(Nothing,CaseG EmptyG (fromList [(Nothing,EmptyG)]))])
match depth with
| 0 -> match rand (1 , 2) with
       | 1 -> VarX
       | 2 -> VarY
| _ -> (let next =
          build (rand , depth - 1) in
        match rand (1 , 7) with
        | 1 -> buildSine next
        | 2 -> buildCosine next
        | 3 -> buildAverage (next , next)
        | 4 -> buildTimes (next , next)
        | 5 -> buildThresh (next , next , next , next)
        | 6 -> buildSqrt next
        | 7 -> buildGauss (next , next , next))
