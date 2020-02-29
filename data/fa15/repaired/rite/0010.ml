let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let numZeros =
         List.length l1 - List.length l2 in
       let listZeros =
         clone (0 , abs numZeros) in
       if numZeros > 0
       then [(l1 , l2)]
       else [(listZeros :: l1 , l2)])


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let numZeros =
         List.length l1 - List.length l2 in
       let listZeros =
         clone (0 , abs numZeros) in
       if numZeros > 0
       then [(l1 , l2)]
       else [([listZeros] , l2)])


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let numZeros =
         List.length l1 - List.length l2 in
       let listZeros =
         clone (0 , abs numZeros) in
       if numZeros > 0
       then [(l1 , l2)]
       else [(listZeros :: l2 , l2)])


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let listZeros = clone (0, (abs numZeros)) in
  if numZeros > 0 then [(l1, l2)] else [((listZeros @ l1), l2)];;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let numZeros = (List.length l1) - (List.length l2) in
  let absNumZeros = abs numZeros in
  if numZeros = 0
  then (l1, l2)
  else
    (let listZeros = clone 0 absNumZeros in
     if numZeros > 0 then (l1, (listZeros @ l2)) else ((listZeros @ l1), l2));;

*)

(* changed spans

(6,3)-(7,64)
let absNumZeros =
  abs numZeros in
if numZeros = 0
then (l1 , l2)
else (let listZeros =
        clone 0 absNumZeros in
      if numZeros > 0
      then (l1 , listZeros @ l2)
      else (listZeros @ l1 , l2))
LetG NonRec [(VarPatG,AppG [EmptyG])] (IteG EmptyG EmptyG EmptyG)

*)
