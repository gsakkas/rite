
let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else recCounter ((sumList (digitsOfInt n)) (count + 1)) in
  recCounter n 0;;


(* fix

let rec digitsOfInt n =
  if n <= 0 then [] else (digitsOfInt (n / 10)) @ [n mod 10];;

let rec sumList xs = match xs with | [] -> 0 | h::t -> h + (sumList t);;

let rec additivePersistence n =
  let rec recCounter n count =
    if n < 10
    then count
    else (recCounter (sumList (digitsOfInt n)) count) + 1 in
  recCounter n 0;;

*)

(* changed spans
(11,9)-(11,19)
recCounter (sumList (digitsOfInt n))
           count
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(11,9)-(11,59)
recCounter (sumList (digitsOfInt n))
           count + 1
BopG (AppG (fromList [EmptyG])) LitG

*)
