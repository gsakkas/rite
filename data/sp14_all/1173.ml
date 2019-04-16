
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

let palindrome w =
  let wList = explode w in
  let wReverse = listReverse (explode w) in if true then wList;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

let palindrome w =
  let wList = explode w in
  let wReverse = listReverse (explode w) in
  if wList = wReverse then true else false;;

*)

(* changed spans
(12,48)-(12,52)
wList = wReverse
BopG VarG VarG

(12,58)-(12,63)
true
LitG

(12,63)-(12,63)
false
LitG

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
(11,3)-(12,63)
(11,15)-(11,22)
(11,15)-(11,24)
(12,45)-(12,63)
(12,58)-(12,63)
(12,63)-(12,63)
*)
