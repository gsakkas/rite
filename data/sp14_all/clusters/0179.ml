TupleG (fromList [VarG,IteG EmptyG EmptyG EmptyG])
(if f b = b
 then (fun b'' ->
         (f b , false))
 else (fun b'' ->
         (f b , true)) , b)
