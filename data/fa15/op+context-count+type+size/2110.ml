
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = match explode w with | [] -> [] | h::t -> w @ [];;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads x = match explode x with | h::t -> false;;

let palindrome w = match explode w with | [] -> true | h::t -> matchHeads w;;

*)

(* changed spans
(7,15)-(7,67)
(7,48)-(7,50)
(7,61)-(7,62)
(7,61)-(7,67)
(7,63)-(7,64)
(7,65)-(7,67)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,25)-(7,32)
(7,25)-(7,34)
(7,33)-(7,34)
(7,61)-(7,62)
(7,61)-(7,67)
(7,63)-(7,64)
*)
