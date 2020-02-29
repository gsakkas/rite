let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then ((n mod 10) :: return;
     digitsOfInt 0)
     else return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then ((n mod 10) :: return;
     digitsOfInt (- 0))
     else return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n <> 0
     then ((n mod 10) :: return;
     digitsOfInt (0 + 0))
     else return)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n <> 0
  then ((n mod 10) :: return; (digitsOfInt 0) :: return)
  else return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then ((n mod 10) :: return; (digitsOfInt 0) @ return) else return;;

*)

(* changed spans

(5,31)-(5,56)
digitsOfInt 0 @ return
AppG [AppG [EmptyG],VarG]

*)
