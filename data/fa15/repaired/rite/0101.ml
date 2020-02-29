let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then [return]
     else return :: [])


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then [return]
     else return :: [return])


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then [return]
     else return :: [_list_])


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else return :: 1;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else 1 :: return;;

*)

(* changed spans

(3,48)-(3,54)
1
LitG

(3,58)-(3,59)
return
VarG

*)
