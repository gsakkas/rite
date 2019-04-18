AppG (fromList [IteG EmptyG EmptyG EmptyG])
buildSine (if depth = 0
           then buildX ()
           else build (rand , depth - 1))
buildCosine (if depth = 0
             then buildY ()
             else build (rand , depth - 1))
