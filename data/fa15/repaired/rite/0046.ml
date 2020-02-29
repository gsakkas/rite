let rec clone =
  fun x ->
    fun n ->
      (let rec helper =
         fun acc ->
           fun n' ->
             if n <= 0
             then []
             else x :: acc in
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
             else (n' + 0) :: (acc (n' - 1)) in
       helper x (n - 1))


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      (let rec helper =
         fun acc ->
           fun n' ->
             if n <= 0
             then []
             else (n + 0) :: (acc (n' - 1)) in
       helper x (n - 1))


(* -------------------------------------- *)


(* bad

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else (helper x) :: (acc (n' - 1)) in
  helper [x] (n - 1);;

*)

(* student fix

let rec clone x n =
  let rec helper acc n' = if n <= 0 then [] else helper (x :: acc) (n' - 1) in
  helper [x] (n - 1);;

*)

(* changed spans

(3,50)-(3,78)
helper (x :: acc) (n' - 1)
AppG [AppG [EmptyG,EmptyG],BopG EmptyG EmptyG]

*)
