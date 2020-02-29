let rec clone =
  fun x ->
    fun n ->
      if n <= 0
      then []
      else x :: __var_1__


(* -------------------------------------- *)

let rec clone = __var_1__


(* -------------------------------------- *)


(* bad

let rec clone x n = if n <= 0 then [] else x :: ((clone x n) - 1);;

*)

(* student fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans

(2,49)-(2,66)
clone x (n - 1)
AppG [VarG,BopG EmptyG EmptyG]

*)
