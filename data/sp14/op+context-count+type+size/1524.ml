
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
(12,44)-(12,62)
(12,47)-(12,51)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(3,2)-(5,6)
(4,43)-(4,66)
(4,54)-(4,66)
(4,55)-(4,57)
(5,2)-(5,4)
(5,2)-(5,6)
(11,2)-(12,62)
(11,14)-(11,21)
(11,14)-(11,23)
(12,44)-(12,62)
(12,44)-(12,62)
(12,44)-(12,62)
(12,57)-(12,62)
*)
