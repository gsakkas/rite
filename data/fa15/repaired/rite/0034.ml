let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod (n mod 10)]
               else __var_1__ <+> __lit__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [10 mod (n mod 10)]
               else __var_1__ <+> __lit__


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else __fun_1__ (__fun_2__ __var_1__)


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
