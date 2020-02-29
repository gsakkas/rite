let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (n mod 10) :: (digitsOfInt (n / 10)))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (n mod 10) :: (digitsOfInt (n + 10)))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (n mod 10) :: (digitsOfInt (n / n)))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (n mod 10) :: ((return digitsOfInt n) / 10);;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans

(4,29)-(4,72)
digitsOfInt 1
AppG [LitG]

*)
