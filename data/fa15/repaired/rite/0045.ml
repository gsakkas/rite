let rec clone =
  fun x ->
    fun n ->
      (let rec helper =
         fun acc ->
           fun n' ->
             if n <= 0
             then []
             else (n' - n') :: (1 :: acc) in
       helper [x] (n - 1))


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      (let rec helper =
         fun acc ->
           fun n' ->
             if n <= 0
             then []
             else (n' - n') :: (1 :: x) in
       helper [x] (n - 1))


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      (let rec helper =
         fun acc ->
           fun n' ->
             if n <= 0
             then []
             else (n' - n') :: (1 :: __var_3__) in
       helper [x] (n - 1))


(* -------------------------------------- *)


(* bad

let rec clone x n =
  let rec helper acc n' =
    if n <= 0 then [] else helper ((x :: acc), (n' - 1)) in
  helper [x] (n - 1);;

*)

(* student fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans

(4,28)-(4,57)
helper (x :: acc) (n' - 1)
AppG [AppG [EmptyG,EmptyG],BopG EmptyG EmptyG]

*)
