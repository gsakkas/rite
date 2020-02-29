let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else (n / (n mod 10)) :: __var_3__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else (10 / (n mod 10)) :: __var_3__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else ((n / 10) / (n mod 10)) :: __var_3__


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0 then [n mod 10] else [digitsOfInt (n / 10); n mod 10];;

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

(6,44)-(6,76)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)
