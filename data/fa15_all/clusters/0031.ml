LamG (LamG EmptyG)
fun acc ->
  fun cin ->
    match l with
    | [] -> cin :: acc
    | h :: t -> (let sum =
                   (i * h) + cin in
                 helper ((sum mod 10) :: acc)
                        (sum / 10))
fun acc ->
  fun cin ->
    match l with
    | [] -> cin :: acc
    | h :: t -> (let sum =
                   (i * h) + cin in
                 helper ((sum mod 10) :: acc)
                        (sum / 10))
fun r -> fun a -> fun x -> a x
fun a -> fun x -> a x
fun x -> fun a -> x a
fun x ->
  fun n -> cloneHelper x n
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun x ->
  fun n ->
    if n < 1
    then []
    else cloneHelper x n []
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun f ->
  fun b ->
    fun b ->
      (f b , if f b = b
             then true
             else false)
fun b ->
  fun b ->
    (f b , if f b = b
           then true
           else false)
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun a -> fun x -> x
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
fun a ->
  fun x -> a ^ (sep ^ x)
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
fun a ->
  fun x -> a ^ (sep ^ x)
fun i ->
  fun l ->
    if i > 0
    then bigAdd l
                (mulByDigit (i - 1) l)
    else []
fun l -> fun x -> List.map f l
fun l ->
  fun h ->
    match l with
    | [] -> []
    | hd :: tl -> if hd = h
                  then hd :: (filter tl h)
                  else filter tl h
fun h ->
  fun r ->
    fun seen ->
      if List.mem h r
      then seen
      else h :: seen
fun r ->
  fun seen ->
    if List.mem h r
    then seen
    else h :: seen
fun h ->
  fun r ->
    fun seen ->
      if List.mem h r
      then seen
      else h :: seen
fun r ->
  fun seen ->
    if List.mem h r
    then seen
    else h :: seen
fun (f , b) ->
  fun b -> (f b , f b = b)
fun (f , b) ->
  fun b -> (f b , f b = b)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun l1 ->
  fun l2 ->
    match l1 with
    | [] -> []
    | h :: t -> (h , l2) :: (helper t
                                    l2)
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x -> fun a -> x a
fun x ->
  fun l ->
    if x > 0
    then l @ []
    else appZero (x - 1) l
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + (x * x)
fun a -> fun x -> a + x
fun a -> fun x -> a + (x * x)
fun f -> fun x -> x
fun a -> fun x -> x
fun a -> fun x -> x a
fun a -> fun x -> x a
fun x -> fun a -> a
fun a ->
  fun x -> fun g -> f a x
fun x -> fun g -> f a x
fun a ->
  fun x -> fun g -> f a x
fun x -> fun g -> f a x
fun curList ->
  fun lt1 ->
    fun lt2 ->
      match lt1 with
      | [] -> curList
      | h :: t -> helper ((h , List.hd lt2) :: curList)
                         t (List.tl lt2)
fun lt1 ->
  fun lt2 ->
    match lt1 with
    | [] -> curList
    | h :: t -> helper ((h , List.hd lt2) :: curList)
                       t (List.tl lt2)
fun curList ->
  fun lt1 ->
    fun lt2 ->
      match lt1 with
      | [] -> curList
      | h :: t -> helper ((h , List.hd lt2) :: curList)
                         t (List.tl lt2)
fun lt1 ->
  fun lt2 ->
    match lt1 with
    | [] -> curList
    | h :: t -> helper ((h , List.hd lt2) :: curList)
                       t (List.tl lt2)
fun curList ->
  fun lt1 ->
    fun lt2 ->
      match lt1 with
      | [] -> curList
      | h :: t -> helper ((h , List.hd lt2) :: curList)
                         t (List.tl lt2)
fun lt1 ->
  fun lt2 ->
    match lt1 with
    | [] -> curList
    | h :: t -> helper ((h , List.hd lt2) :: curList)
                       t (List.tl lt2)
