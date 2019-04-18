
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads y = match y with | [] -> [] | h::t -> t;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,20)-(7,59)
fun x ->
  match explode x with
  | h :: t -> false
LamG VarPatG (CaseG (fromList [(ConsPatG EmptyPatG EmptyPatG,Nothing,EmptyG)]))

(10,58)-(10,69)
w
VarG

*)

(* type error slice
(7,4)-(7,61)
(7,20)-(7,59)
(7,24)-(7,59)
(7,58)-(7,59)
(10,3)-(10,69)
(10,32)-(10,36)
(10,47)-(10,57)
(10,47)-(10,69)
*)
