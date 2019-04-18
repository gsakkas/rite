
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = explode l listReverse "nikhil";;


(* fix

let rec listReverse l = match l with | [] -> [];;

*)

(* changed spans
(7,25)-(7,55)
match l with
| [] -> []
CaseG (fromList [(ConPatG Nothing,Nothing,ListG (fromList []))])

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,44)-(4,67)
(4,55)-(4,67)
(4,56)-(4,58)
(5,3)-(5,5)
(5,3)-(5,7)
(7,25)-(7,32)
(7,25)-(7,55)
*)
