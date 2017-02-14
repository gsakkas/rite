
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (explode w) = (explode (listReverse w)) then true else false;;


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
(11,21)-(11,28)
(11,30)-(11,43)
(11,42)-(11,43)
*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,14)-(4,27)
(4,14)-(4,29)
(4,28)-(4,29)
(8,3)-(8,58)
(8,3)-(8,58)
(8,38)-(8,49)
(8,38)-(8,51)
(8,50)-(8,51)
(11,7)-(11,14)
(11,7)-(11,16)
(11,15)-(11,16)
(11,30)-(11,41)
(11,30)-(11,43)
(11,42)-(11,43)
*)
