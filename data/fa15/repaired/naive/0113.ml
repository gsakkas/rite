let rec digitsOfInt =
  fun n ->
    digitsOfInt (digitsOfInt 0)


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n -> digitsOfInt (0 :: [])


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n -> digitsOfInt (0 <> 0)


(* -------------------------------------- *)


(* bad

let rec digitsOfInt n =
  let return = [] in
  if n <> 0 then (n mod 10) :: (return digitsOfInt 0) else return;;

*)

(* student fix

let rec digitsOfInt n =
  let return = [] in if n <> 0 then (n mod 10) :: return else return;;

*)

(* changed spans

(4,32)-(4,54)
return
VarG

*)
