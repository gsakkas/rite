let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone x (n - 1))

let padZero =
  fun l1 ->
    fun l2 ->
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , ll2 :: l2 @ l2)
       else (clone __var_1__
                   ll1 @ l1 , l2))


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
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , ll2 :: l2 @ l2)
       else (clone __var_1__
                   ll2 @ l1 , l2))


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
      (let ll1 = List.length l1
       and ll2 = List.length l2 in
       if ll1 > ll2
       then (l1 , ll2 :: l2 @ l2)
       else (clone __var_1__
                   __var_1__ @ l1 , l2))


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone (0, (ll1 - ll2))) @ l2))
  else (((clone (0, (ll2 - ll1))) @ l1), l2);;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let ll1 = List.length l1
  and ll2 = List.length l2 in
  if ll1 > ll2
  then (l1, ((clone 0 (ll1 - ll2)) @ l2))
  else (((clone 0 (ll2 - ll1)) @ l1), l2);;

*)

(* changed spans

(8,14)-(8,38)
clone 0 (ll1 - ll2)
AppG [LitG,BopG EmptyG EmptyG]

(9,10)-(9,34)
clone 0 (ll2 - ll1)
AppG [LitG,BopG EmptyG EmptyG]

*)
