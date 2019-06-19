TupleG [IteG EmptyG EmptyG EmptyG,IteG EmptyG EmptyG EmptyG]
(if depth = 0
 then buildX ()
 else build (rand , depth - 1) , if depth = 0
                                 then buildY ()
                                 else build (rand , depth - 1))
