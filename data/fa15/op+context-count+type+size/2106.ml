
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
(7,19)-(7,58)
(7,23)-(7,58)
(7,29)-(7,30)
(7,44)-(7,46)
(7,57)-(7,58)
(9,15)-(10,68)
(10,57)-(10,68)
(10,58)-(10,65)
*)

(* type error slice
(7,3)-(7,60)
(7,19)-(7,58)
(7,23)-(7,58)
(7,23)-(7,58)
(7,23)-(7,58)
(7,57)-(7,58)
(10,2)-(10,68)
(10,2)-(10,68)
(10,31)-(10,35)
(10,46)-(10,56)
(10,46)-(10,68)
*)
