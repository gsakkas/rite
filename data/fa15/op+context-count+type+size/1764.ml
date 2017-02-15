
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(10,49)-(10,50)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(8,2)-(8,63)
(8,2)-(8,63)
(8,39)-(8,57)
(8,40)-(8,51)
(8,52)-(8,56)
(10,22)-(10,33)
(10,23)-(10,30)
(10,31)-(10,32)
(10,36)-(10,51)
(10,37)-(10,48)
(10,49)-(10,50)
*)
