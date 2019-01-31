TupleG (fromList [VarG,LamG EmptyG])
(fun x -> (f x , b = f b) , b)
(fun x -> (f b , 3 < 4) , b)
(fun x -> (f b , 3 < 4) , b)
(fun x -> (f b , 3 < 4) , b)
(fun x ->
   (f x , x <> f x) , b)
(fun input ->
   (let b = f input in
    (b , b <> input)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
