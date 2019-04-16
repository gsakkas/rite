
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = (explode w) = w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (explode w) = (listReverse (explode w));;

*)

(* changed spans
(7,34)-(7,35)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(4,44)-(4,67)
(4,55)-(4,67)
(4,56)-(4,58)
(5,3)-(5,5)
(5,3)-(5,7)
(7,20)-(7,31)
(7,20)-(7,35)
(7,21)-(7,28)
(7,29)-(7,30)
(7,34)-(7,35)
*)
