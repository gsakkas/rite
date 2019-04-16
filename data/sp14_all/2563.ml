
let rec listReverse l = match l with | [] -> 0 | x::xl -> [listReverse xl];;


(* fix

let x = 123;;

let rec digitsOfInt n =
  if n < 0
  then []
  else
    (let x = n / 10
     and y = n mod 10 in
     if (x = 0) && (y = 0) then [] else (digitsOfInt x) @ [y]);;

let rec sumList xs = match xs with | [] -> 0 | x::xs' -> x + (sumList xs');;

let x = sumList (digitsOfInt 30);;

let rec listReverse l =
  match l with
  | [] -> []
  | x::[] -> [x]
  | head::tail -> (listReverse tail) @ [head];;

*)

(* changed spans
(2,25)-(2,75)
match l with
| [] -> []
| x :: [] -> [x]
| head :: tail -> listReverse tail @ [head]
CaseG VarG (fromList [(ConsPatG VarPatG VarPatG,Nothing,AppG (fromList [EmptyG])),(ConsPatG VarPatG (ConPatG Nothing),Nothing,ListG (fromList [EmptyG])),(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,25)-(2,75)
(2,46)-(2,47)
(2,59)-(2,75)
*)
