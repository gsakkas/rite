let rec digitsOfInt =
  fun n ->
    (let __var_1__ =
       fun __var_2__ -> __var_2__ in
     (n , n mod 10))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let __var_1__ =
       fun __var_2__ -> __var_2__ in
     ([] , n <> 0))


(* -------------------------------------- *)

let rec digitsOfInt =
  fun n ->
    (let __var_1__ =
       fun __var_2__ -> __var_2__ in
     ([] , n mod 10))


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
