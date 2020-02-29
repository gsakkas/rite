let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else digitsOfInt n


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else digitsOfInt (0 mod 0)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> if (n / 10) = 0
               then [n mod 10]
               else digitsOfInt (0 / 0)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      if (n / 10) = 0
      then [n mod 10]
      else [digitsOfInt (n / 10)] :: (n mod 10);;

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

(8,12)-(8,48)
digitsOfInt (n / 10) @ [n mod 10]
AppG [AppG [EmptyG],ListG [EmptyG]]

*)
