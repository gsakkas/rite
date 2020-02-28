IteG (BopG EmptyG EmptyG) (LamG EmptyPatG EmptyG) (LamG EmptyPatG EmptyG)
if f b = b
then (fun b'' ->
        (f b , false))
else (fun b'' -> (f b , true))
