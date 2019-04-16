
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> [] | h::t -> w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,49)-(7,51)
true
LitG

(7,62)-(7,63)
matchHeads w
AppG (fromList [VarG])

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(7,20)-(7,63)
(7,26)-(7,33)
(7,26)-(7,35)
(7,34)-(7,35)
(7,49)-(7,51)
(7,62)-(7,63)
*)
