let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let remainder =
                  n mod 10 in
                if n = 0
                then [remainder]
                else digitsOfInt n @ [remainder])


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let remainder =
                  n mod 10 in
                if n = 0
                then [remainder]
                else digitsOfInt 0 @ [remainder])


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let remainder =
                  n mod 10 in
                if n = 0
                then [remainder]
                else digitsOfInt __lit__ @ [remainder])


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else ((digitsOfInt n) / 10) @ [remainder];;

*)

(* student fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let remainder = n mod 10 in
      if n = 0 then [remainder] else (digitsOfInt (n / 10)) @ [remainder];;

*)

(* changed spans

(7,38)-(7,60)
digitsOfInt (n / 10)
AppG [BopG EmptyG EmptyG]

*)
