let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: return
      else __var_1__ :: return;
     digitsOfInt 0 @ return))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: __var_1__
      else __var_1__ :: return;
     digitsOfInt 0 @ return))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: return
      else __var_1__ :: __var_1__;
     digitsOfInt 0 @ return))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then [] :: return else (n mod 10) :: return;
  (digitsOfInt 0) @ return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in
  if n <= 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans

(4,18)-(4,30)
return
VarG

*)
