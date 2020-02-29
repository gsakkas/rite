let rec clone =
  fun x ->
    fun n ->
      if __var_1__
      then []
      else x @ clone x (n - 1)


(* -------------------------------------- *)


(* bad

let rec clone x n = if x <= 0 then [] else x @ (clone x (n - 1));;

*)

(* student fix

let rec clone x n = if x <= 0 then [] else x :: (clone x (n - 1));;

*)

(* changed spans

(2,44)-(2,65)
x :: (clone x (n - 1))
AppG [VarG,AppG [EmptyG,EmptyG]]

*)
