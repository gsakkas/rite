let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n = 0
      then return
      else (n mod 10) :: return;
     0 :: return))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n = 0
      then return
      else (n mod 10) :: return;
     n :: (digitsOfInt 0)))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     (if n = 0
      then return
      else (n mod 10) :: return;
     return :: (digitsOfInt 0)))


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) :: return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in
  if n == 0 then return else (n mod 10) :: return; (digitsOfInt 0) @ return;;

*)

(* changed spans

(4,52)-(4,77)
digitsOfInt 0 @ return
AppG [AppG [EmptyG],VarG]

*)
