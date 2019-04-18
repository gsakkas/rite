
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = x;;

let palindrome w = match explode w with | [] -> [] | h::t -> matchHeads w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,24)-(7,25)
match explode x with
| h :: t -> false
CaseG (fromList [(ConsPatG VarPatG VarPatG,Nothing,LitG)])

(9,49)-(9,51)
true
LitG

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(7,4)-(7,27)
(7,20)-(7,25)
(7,24)-(7,25)
(9,20)-(9,74)
(9,26)-(9,33)
(9,26)-(9,35)
(9,34)-(9,35)
(9,49)-(9,51)
(9,62)-(9,72)
(9,62)-(9,74)
(9,73)-(9,74)
*)
