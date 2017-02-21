
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
(7,15)-(7,62)
(7,19)-(7,62)
(7,25)-(7,34)
(7,33)-(7,34)
(7,48)-(7,50)
(7,61)-(7,62)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(7,19)-(7,62)
(7,19)-(7,62)
(7,25)-(7,32)
(7,25)-(7,34)
(7,33)-(7,34)
(7,48)-(7,50)
(7,61)-(7,62)
*)

(* all spans
(2,12)-(5,6)
(3,2)-(5,6)
(3,13)-(4,66)
(4,4)-(4,66)
(4,7)-(4,29)
(4,7)-(4,8)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(4,35)-(4,37)
(4,43)-(4,66)
(4,43)-(4,50)
(4,44)-(4,49)
(4,44)-(4,45)
(4,47)-(4,48)
(4,54)-(4,66)
(4,55)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,6)
(5,2)-(5,4)
(5,5)-(5,6)
(7,15)-(7,62)
(7,19)-(7,62)
(7,25)-(7,34)
(7,25)-(7,32)
(7,33)-(7,34)
(7,48)-(7,50)
(7,61)-(7,62)
*)