
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
(10,22)-(10,23)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(8,36)-(8,51)
(8,36)-(8,57)
(8,37)-(8,48)
(8,52)-(8,53)
(10,22)-(10,23)
(10,22)-(10,51)
(10,22)-(10,51)
(10,26)-(10,51)
(10,27)-(10,38)
(10,39)-(10,50)
(10,40)-(10,47)
(10,48)-(10,49)
*)
