let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: return
      else [n mod 10] :: return;
     digitsOfInt 0 @ return))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: return
      else [n mod 0] :: return;
     digitsOfInt 0 @ return))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n <= 0
      then [] :: return
      else [0 mod 10] :: return;
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
