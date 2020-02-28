TupleG [IteG EmptyG EmptyG EmptyG,VarG]
(if f b = b
 then (fun b'' ->
         (f b , false))
 else (fun b'' ->
         (f b , true)) , b)
