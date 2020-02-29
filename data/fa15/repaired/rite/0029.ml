let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let quotient =
                  n / 10 in
                if quotient = 0
                then [n mod 10]
                else quotient :: (digitsOfInt quotient))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let quotient =
                  n / 10 in
                if quotient = 0
                then [n mod n]
                else quotient :: (digitsOfInt quotient))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    match n < 0 with
    | true -> []
    | false -> (let quotient =
                  n / 10 in
                if quotient = 0
                then [n mod 0]
                else quotient :: (digitsOfInt quotient))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let quotient = n / 10 in
      if quotient = 0 then n mod 10 else quotient :: (digitsOfInt quotient);;

*)

(* student fix

let rec digitsOfInt n =
  match n < 0 with
  | true  -> []
  | false  ->
      let quotient = n / 10 in
      if quotient = 0 then [n mod 10] else quotient :: (digitsOfInt quotient);;

let _ = digitsOfInt 3124;;

*)

(* changed spans

(7,28)-(7,36)
[n mod 10]
ListG [BopG EmptyG EmptyG]

*)
