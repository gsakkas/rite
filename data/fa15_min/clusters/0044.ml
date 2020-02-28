TupleG [LamG EmptyPatG EmptyG,VarG]
(fun x -> (x , f x = x) , b)
(fun x -> (b , f b = b) , b)
EMPTY
(fun b ->
   (f b , f b <> b) , b)
(fun x -> (f b , 3 < 4) , b)
(fun x ->
   (f b , not (b = f b)) , b)
(fun x ->
   (f x , x <> f x) , b)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
