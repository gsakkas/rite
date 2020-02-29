let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> [n / 0]


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> [n / __lit__]


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (n / n) :: (digitsOfInt (n / 10))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with | true  -> [] | false  -> [[digitsOfInt (n / 10)]];;

*)

(* student fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  -> (n mod 10) :: (digitsOfInt (n / 10));;

let _ = digitsOfInt 3124;;

*)

(* changed spans

(3,46)-(3,70)
(n mod 10) :: (digitsOfInt (n / 10))
AppG [BopG EmptyG EmptyG,AppG [EmptyG]]

*)
