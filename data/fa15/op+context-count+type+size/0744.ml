
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
(11,20)-(11,27)
(11,28)-(11,43)
(11,41)-(11,42)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(8,2)-(8,57)
(8,2)-(8,57)
(8,36)-(8,51)
(8,37)-(8,48)
(8,49)-(8,50)
(11,5)-(11,16)
(11,6)-(11,13)
(11,14)-(11,15)
(11,28)-(11,43)
(11,29)-(11,40)
(11,41)-(11,42)
*)
