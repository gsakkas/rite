let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (n - 1) :: return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (1 - n) :: return)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else (1 - 1) :: return)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt - 1;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n < 0 then return else digitsOfInt 1;;

*)

(* changed spans

(3,48)-(3,63)
digitsOfInt 1
AppG [LitG]

*)
