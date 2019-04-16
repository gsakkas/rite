LamG VarPatG (LamG VarPatG EmptyG)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
fun x ->
  fun a ->
    (let (carry , num) = a in
     let (l1' , l2') = x in
     let addit =
       (l1' + l2') + carry in
     (if addit > 10
      then 1
      else 0 , (addit mod 10) :: num))
fun x -> fun a -> a
fun x -> fun a -> x a
fun a -> fun x -> a x
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun f -> fun a -> f a x
fun absNum ->
  fun persCount ->
    if absNum < 10
    then (persCount , absNum)
    else (let xs =
            digits absNum in
          let theSum = sumList xs in
          additivePersAndRoot theSum
                              (persCount + 1))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun f ->
  fun l ->
    match l with
    | [] -> "[]"
    | x :: xs -> (let g =
                    fun a ->
                      fun x -> a ^ ("; " ^ f x) in
                  let base = "[" ^ f x in
                  List.fold_left g base
                                 xs ^ "]")
fun a -> fun x -> x
