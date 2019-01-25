LamG (LetG NonRec (fromList [EmptyG]) EmptyG)
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
fun b ->
  (let result = f b in
   if result = b
   then (result , false)
   else (result , true))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun x ->
  (let ff = f b in
   (ff , b = ff))
fun b ->
  (let f =
     fun a -> fun x -> x a in
   let base = b in
   List.fold_left f base fs)
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun x -> (f x - x) < 0 in
   (x , isFPoint x))
fun x ->
  (let isFPoint =
     fun s -> (f s - s) < 0 in
   (f x , isFPoint x))
fun (l1 , l2) ->
  (let f =
     fun a ->
       fun x ->
         (let (carry , acc) = a in
          let (x1 , x2) = x in
          let sum = (x1 + x2) + carry in
          (sum / 10 , (sum mod 10) :: acc)) in
   let base = (0 , []) in
   let args =
     List.combine l1 l2 in
   let (_ , res) =
     List.fold_left f base args in
   res)
fun b' ->
  (let x = f b' in
   (x , b' <> x))
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
fun x ->
  (let (a1 , a2) = a in
   let val1 = (x * i) + a1 in
   if val1 > 9
   then (val1 / 10 , (val1 mod 10) :: a2)
   else (0 , val1 :: a2))
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun z ->
  (let f =
     fun a -> fun x -> x a in
   let base = z in
   List.fold_left f base fs)
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun b ->
  (let x = f b in (x , x <> b))
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun b ->
  (let x = f b in (x , x <> b))
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun b ->
  (let x = f b in (x , x <> b))
fun (f , b) ->
  (let f =
     fun b ->
       (let x = f b in
        (x , x <> b)) in
   f)
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun b ->
  (let x = f b in (x , x <> b))
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun b ->
  (let t = f b in
   if b = t
   then (b , false)
   else (t , true))
fun x ->
  (let b' = f b in
   (b' , b' = b))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun x ->
  (let y = f x in
   if y = x
   then (y , false)
   else (y , true))
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
fun b ->
  (let xx = f b in
   if b = xx
   then (xx , false)
   else (xx , true))
fun func ->
  (let result = f b in
   (result , result = b))
fun b' ->
  (let result = f b' in
   (result , result = b'))
fun x ->
  (let calcfx = f x in
   (calcfx , calcfx = x))
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
fun fs ->
  (let f =
     fun a ->
       fun x -> fun g -> f a x in
   let base = fun f -> f in
   List.fold_left f base fs)
fun x ->
  (let b = f x in (b , b <> x))
fun fixb ->
  (let b = f b in
   (b , fixb <> b))
