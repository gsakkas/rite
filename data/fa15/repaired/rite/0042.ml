let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone (n - 1) n)


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone (n - 1) x)


(* -------------------------------------- *)

let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: (clone (n - 1)
                       __var_3__)


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: (clone (n - 1));;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans

(2,49)-(2,64)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
