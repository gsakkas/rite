LamG (LamG EmptyG)
fun g ->
  fun b ->
    fun y ->
      fun n ->
        match n with
        | [] -> n
        | _ -> y b
fun b ->
  fun y ->
    fun n ->
      match n with
      | [] -> n
      | _ -> y b
fun y ->
  fun n ->
    match n with
    | [] -> n
    | _ -> y b
fun sep ->
  fun sl ->
    match sl with
    | [] -> ""
    | h :: t -> (let f =
                   fun a ->
                     fun x -> a ^ (sep ^ x) in
                 let base = h in
                 let l = t in
                 List.fold_left f base l)
fun x ->
  fun y ->
    match y with
    | [] -> [x]
    | h :: t -> h :: (append x t)
fun a ->
  fun b ->
    if a > b then a else b
fun a ->
  fun b ->
    if a < b then b else a
fun a ->
  fun b ->
    if a < b then b else a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun n ->
  fun digitList ->
    if n = 0
    then digitList
    else digits (n / 10)
                ((n mod 10) :: digitList)
fun n ->
  fun digitList ->
    if n = 0
    then digitList
    else digits (n / 10)
                ((n mod 10) :: digitList)
fun n ->
  fun digitList ->
    if n = 0
    then digitList
    else digits (n / 10)
                ((n mod 10) :: digitList)
fun x -> fun a -> a
fun x -> fun a -> a
fun a -> fun x -> a x
fun a ->
  fun b ->
    if a = 0
    then b
    else integers (a / 10)
                  ((a mod 10) :: b)
fun a ->
  fun b ->
    if a = 0
    then b
    else integers (a / 10)
                  ((a mod 10) :: b)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun l ->
  fun acc ->
    match i with
    | 0 -> [0]
    | 1 -> l
    | _ -> helper (i - 1) l
                  (bigAdd acc l)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun l ->
  fun acc ->
    match i with
    | 0 -> [0]
    | 1 -> l
    | _ -> helper (i - 1) l
                  (bigAdd acc l)
fun i ->
  fun l ->
    fun acc ->
      match i with
      | 0 -> [0]
      | 1 -> l
      | _ -> helper (i - 1) l
                    (bigAdd acc l)
fun l ->
  fun acc ->
    match i with
    | 0 -> [0]
    | 1 -> l
    | _ -> helper (i - 1) l
                  (bigAdd acc l)
fun x ->
  fun f -> fun a -> f a x
fun f -> fun a -> f a x
fun f ->
  fun x ->
    fun f -> fun a -> f a x
fun f -> fun a -> f a x
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
fun l ->
  fun acc ->
    match x with
    | [] -> l
    | h :: t -> helper t l
                       (h :: acc)
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
fun l ->
  fun acc ->
    match x with
    | [] -> l
    | h :: t -> helper t l
                       (h :: acc)
fun x ->
  fun l ->
    fun acc ->
      match x with
      | [] -> l
      | h :: t -> helper t l
                         (h :: acc)
fun l ->
  fun acc ->
    match x with
    | [] -> l
    | h :: t -> helper t l
                       (h :: acc)
fun a ->
  fun b ->
    match b with
    | [] -> [a]
    | hd :: tl -> [a + hd]
fun a ->
  fun b ->
    match b with
    | [] -> [a]
    | hd :: tl -> [a + hd]
fun a ->
  fun b ->
    match b with
    | [] -> [a]
    | hd :: tl -> [a + hd]
fun f' ->
  fun b' ->
    (let fOfB = f' b' in
     (fOfB , fOfB = b'))
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
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun h ->
  fun x ->
    (let xx = h x in
     (xx , xx = h x))
fun l ->
  fun n ->
    match l with
    | [] -> [n]
    | h :: t -> h :: (myAppend t
                               n)
fun x ->
  fun n ->
    if n < 1
    then accum
    else x :: accum
fun x ->
  fun n ->
    if n < 1
    then accum
    else x :: accum
fun a ->
  fun b ->
    if (10 * a) > b
    then a
    else helpFac (10 * a) b
fun n ->
  fun a ->
    if n = 0
    then a
    else loop (n / 10)
              ((n mod 10) :: a)
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
fun a -> fun x -> x
fun a -> fun x -> x
fun a -> fun x -> x
fun x -> fun a -> x a
fun list ->
  fun digInt -> n mod 10
fun list ->
  fun digInt -> n mod 10
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun x -> fun x -> (0 , true)
fun i ->
  fun acc ->
    fun l ->
      if i > 0
      then helper i (bigAdd acc l) l
      else acc
fun acc ->
  fun l ->
    if i > 0
    then helper i (bigAdd acc l) l
    else acc
fun i ->
  fun acc ->
    fun l ->
      if i > 0
      then helper i (bigAdd acc l) l
      else acc
fun acc ->
  fun l ->
    if i > 0
    then helper i (bigAdd acc l) l
    else acc
