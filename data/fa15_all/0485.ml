
let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append digitsOfInt n2 [n2]);;


(* fix

let rec append xs ys = match xs with | [] -> ys | h::t -> h :: (append t ys);;

let rec digitsOfInt n =
  if n <= 0 then [] else (let n2 = n / 10 in append (digitsOfInt n2) [n2]);;

*)

(* changed spans
(5,45)-(5,71)
append (digitsOfInt n2) [n2]
AppG (fromList [AppG (fromList [EmptyG]),ListG EmptyG Nothing])

(5,52)-(5,63)
digitsOfInt n2
AppG (fromList [VarG])

*)
