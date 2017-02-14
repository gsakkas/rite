
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = if w = (listReverse (explode w)) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(10,23)-(10,24)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(8,38)-(8,49)
(8,38)-(8,51)
(8,38)-(8,58)
(8,53)-(8,54)
(10,23)-(10,24)
(10,23)-(10,50)
(10,23)-(10,50)
(10,28)-(10,39)
(10,28)-(10,50)
(10,41)-(10,48)
(10,41)-(10,50)
(10,49)-(10,50)
*)
