
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> true | h::t -> explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,64)-(7,73)
matchHeads w
AppG [VarG]

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
(7,20)-(7,73)
(7,49)-(7,53)
(7,64)-(7,71)
(7,64)-(7,73)
*)
