let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then digitsOfInt 0
     else return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then digitsOfInt (- 0)
     else return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then digitsOfInt n
     else return)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) digitsOfInt 0 else return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans

(3,37)-(3,61)
(n mod 10) :: return
AppG [BopG EmptyG EmptyG,VarG]

*)
