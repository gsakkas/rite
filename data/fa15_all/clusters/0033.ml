LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))
fun cin ->
  match l with
  | [] -> cin :: acc
  | h :: t -> (let sum =
                 (i * h) + cin in
               helper ((sum mod 10) :: acc)
                      (sum / 10))
fun cin ->
  match l with
  | [] -> cin :: acc
  | h :: t -> (let sum =
                 (i * h) + cin in
               helper ((sum mod 10) :: acc)
                      (sum / 10))
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun l ->
  match l with
  | [] -> []
  | x :: xs' -> listReverse xs' @ [x]
fun (x , y) ->
  match y with
  | [] -> x
  | h :: t -> (let z = h :: x in
               append (z , t))
fun (x , y) ->
  match y with
  | [] -> x
  | h :: t -> (let z = h :: x in
               append (z , t))
fun sl ->
  match sl with
  | [] -> ""
  | h :: t -> (let f =
                 fun a ->
                   fun x -> a ^ (sep ^ x) in
               let base = h in
               let l = t in
               List.fold_left f base l)
fun sl ->
  match sl with
  | [] -> ""
  | h :: t -> (let f =
                 fun a ->
                   fun x -> a ^ (sep ^ x) in
               let base = h in
               let l = t in
               List.fold_left f base l)
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun xs ->
  match xs with
  | [] -> 0
  | h :: t -> h + sumList t
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun h ->
  match l with
  | [] -> []
  | hd :: tl -> if hd = h
                then hd :: (filter tl h)
                else filter tl h
fun (f , b) ->
  match f b with
  | (b' , c') -> if c'
                 then wwhile (f , b')
                 else b'
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun l2 ->
  match l1 with
  | [] -> []
  | h :: t -> (h , l2) :: (helper t
                                  l2)
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match explode x with
  | h :: t -> false
fun x ->
  match explode x with
  | h :: t -> false
fun z ->
  match listReverse z with
  | [] -> []
  | h :: t -> t
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun x ->
  match x with
  | [] -> true
  | h :: t -> if getHead x = getHead (listReverse x)
              then matchHeads (getTail (listReverse t))
              else false
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun l ->
  match l with
  | [] -> []
  | h :: t -> listReverse t @ [h]
fun w ->
  match w with
  | [] -> true
  | h :: t -> if h = List.hd (listReverse w)
              then true
              else false
fun x ->
  match f x with
  | x -> (x , false)
  | y -> (y , true)
fun x ->
  match f x with
  | x -> (x , false)
  | y -> (y , true)
fun n ->
  match n with
  | 0 -> []
  | 1 -> [0]
  | x -> [0] @ listZeros (n - 1)
fun n ->
  match n with
  | 0 -> []
  | 1 -> [0]
  | x -> [0] @ listZeros (n - 1)
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun (t , u) ->
  match List.rev t with
  | [] -> []
  | h :: t -> match List.rev u with
              | [] -> []
              | h' :: t' -> if (h + h') > 10
                            then addHelper (t , t') @ [(1 + h') + h]
                            else addHelper (t , t') @ [h' + h]
fun lt2 ->
  match lt1 with
  | [] -> curList
  | h :: t -> helper ((h , List.hd lt2) :: curList)
                     t (List.tl lt2)
fun lt2 ->
  match lt1 with
  | [] -> curList
  | h :: t -> helper ((h , List.hd lt2) :: curList)
                     t (List.tl lt2)
fun lt2 ->
  match lt1 with
  | [] -> curList
  | h :: t -> helper ((h , List.hd lt2) :: curList)
                     t (List.tl lt2)
function
  | [] -> l
  | h :: t -> listReverseHelper (h :: l)
                                t
