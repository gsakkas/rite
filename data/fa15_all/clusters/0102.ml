TupleG (fromList [VarG,LamG EmptyG])
(fun xx ->
   (xx , f xx = xx) , b)
(fun x ->
   (f x , not (f x = x)) , b)
(fun x ->
   (f x , not (f x = x)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
(fun x ->
   (let b = f x in
    (b , b <> x)) , b)
(fun b -> (f b , f b = b) , b)
(fun b -> (f b , f b = b) , b)
(fun b -> (f b , f b = b) , b)
(fun b ->
   (f b , b <> f b) , b)
(fun b ->
   (f b , b <> f b) , b)
(fun a ->
   (f a , f a <> a) , b)
