LamG (LetG NonRec (fromList [EmptyG]) EmptyG)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = fun n -> 0 in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun n ->
  (let f =
     fun a -> fun x -> x a in
   let base = n in
   List.fold_left f base fs)
fun b ->
  (let self = f b in
   match b with
   | self -> (self , false)
   | _ -> (self , true))
fun a ->
  (let (carry , num) = a in
   let (l1' , l2') = x in
   let addit =
     (l1' + l2') + carry in
   (if addit > 10
    then 1
    else 0 , (addit mod 10) :: num))
fun x ->
  (let xx = f b in
   (xx , xx = b))
fun x ->
  (let xx = f b in
   (xx , xx = b))
fun x ->
  (let xx = f b in
   (xx , xx = b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun x ->
  (let xx = f b in
   (xx , xx <> b))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun b' ->
  (let fb = f b' in
   (fb , fb = b'))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun x ->
  (let bb = f b in
   (bb , bb = b))
fun x ->
  (let bb = f x in
   (bb , bb = x))
fun (f , b) ->
  (let ans = f b in
   match ans with
   | (num , tf) -> if tf = true
                   then wwhile (f , num)
                   else num)
fun b ->
  (let ans = f b in
   if b = ans
   then (ans , false)
   else (ans , true))
fun x ->
  (let b = f x in (b , b <> x))
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun x ->
  (let xx = f x in
   (xx , x <> b))
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
fun b' ->
  (let fOfB = f' b' in
   (fOfB , fOfB = b'))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun x ->
  (let xx = h x in
   (xx , xx = h x))
fun num ->
  (let f =
     fun a -> fun x -> x a in
   let base = num in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun p ->
  (let f =
     fun a -> fun x -> x a in
   let base = p in
   List.fold_left f base fs)
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 100))
fun b ->
  (let b' = f b in
   (b' , f b <> b))
fun b ->
  (let b' = f b in
   (b' , f b <> b))
fun z ->
  (let b = f z in (b , b <> z))
fun x ->
  (let y = f x in (y , y <> x))
fun x ->
  (let y = f x in (y , y <> x))
fun x ->
  (let xx = f x in
   (xx , xx <> b))
fun (seed1 , seed2) ->
  (let seed =
     Array.of_list [seed1 ; seed2] in
   let s =
     Random.State.make seed in
   fun (x , y) ->
     x + Random.State.int s
                          (y - x))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun x ->
  (let xx = (x * x) * x in
   (xx , xx < 512))
fun (f , b) ->
  (let b' = f b in
   if b' = b
   then b'
   else helper (f , b'))
fun (f , b) ->
  (let b' = f b in
   if b' = b
   then b'
   else helper (f , b'))
fun (f , b) ->
  (let b' = f b in
   if b' = b
   then b'
   else helper (f , b'))
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
fun y ->
  (let f =
     fun a -> fun x -> x a in
   let base = y in
   List.fold_left f base fs)
