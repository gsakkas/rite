TupleG (fromList [VarG,LetG NonRec (fromList [EmptyG]) EmptyG])
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
(let d =
   fun x ->
     (let xx = f b in
      (xx , xx = b)) in
 d , b)
(let func =
   fun b ->
     (let ans = f b in
      if b = ans
      then (ans , false)
      else (ans , true)) in
 func , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let g =
   fun x ->
     (let xx = f x in
      (xx , xx <> b)) in
 g , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
(let helper =
   fun x -> (f x , f x = f b) in
 helper , b)
