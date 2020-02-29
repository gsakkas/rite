let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else digitsOfInt n)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else digitsOfInt (0 mod 0))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else digitsOfInt 0)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n < 0 then return else (digitsOfInt (-1) (n mod 10)) :: return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else (n mod 10) :: return;;

*)

(* changed spans

(4,29)-(4,58)
n mod 10
BopG VarG LitG

*)
