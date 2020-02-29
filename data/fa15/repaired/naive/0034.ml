let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then __var_1__
               else __var_1__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> digitsOfInt n


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> digitsOfInt (0 mod 0)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0 then n mod 10 else (digitsOfInt (n / 10)) :: (n mod 10);;

*)

(* student fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else (digitsOfInt (n / 10)) @ [n mod 10];;

let _ = digitsOfInt 3124;;

*)

(* changed spans

(6,28)-(6,36)
[n mod 10]
ListG [BopG EmptyG EmptyG]

(6,42)-(6,78)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)
