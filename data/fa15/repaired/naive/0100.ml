let rec digitsOfInt =
  fun n ->
    if n < 0
    then []
    else __var_1__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    if n < 0
    then []
    else digitsOfInt 0


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    if n < 0
    then []
    else digitsOfInt n


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n = if n < 0 then [];;

*)

(* student fix

let rec digitsOfInt n = if n < 0 then [] else [1];;

*)

(* changed spans

(2,41)-(2,41)
[1]
ListG [LitG]

*)
