
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
(7,23)-(7,24)
(9,15)-(9,73)
(9,48)-(9,50)
(9,61)-(9,71)
(9,72)-(9,73)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,3)-(7,26)
(7,19)-(7,24)
(7,23)-(7,24)
(9,19)-(9,73)
(9,19)-(9,73)
(9,25)-(9,32)
(9,25)-(9,34)
(9,33)-(9,34)
(9,48)-(9,50)
(9,61)-(9,71)
(9,61)-(9,73)
(9,72)-(9,73)
*)
