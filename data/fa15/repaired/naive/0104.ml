let rec digitsOfInt =
  fun n ->
    (let return = [] in
     if n < 0
     then return
     else digitsOfInt 0)


(* -------------------------------------- *)

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
     else digitsOfInt __lit__)


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
