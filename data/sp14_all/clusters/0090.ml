IteG (BopG EmptyG EmptyG) (LamG VarPatG EmptyG) (LamG VarPatG EmptyG)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
