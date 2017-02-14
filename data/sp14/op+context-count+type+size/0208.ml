
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;


(* fix

let rec reverse (x,y) =
  match x with | [] -> y | h::t -> reverse (t, (h :: y));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = match l with | [] -> [] | h::t -> reverse (l, []);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(2,12)-(5,6)
(3,2)-(5,6)
(7,16)-(7,75)
(7,29)-(7,30)
(7,44)-(7,45)
(7,56)-(7,62)
(7,56)-(7,75)
(7,64)-(7,65)
(7,67)-(7,74)
(7,68)-(7,69)
(7,70)-(7,71)
(7,72)-(7,73)
(9,15)-(9,73)
(9,22)-(9,23)
(9,27)-(9,33)
(9,34)-(9,51)
(9,35)-(9,46)
(9,48)-(9,50)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(3,2)-(5,6)
(4,43)-(4,50)
(4,43)-(4,66)
(4,43)-(4,66)
(4,44)-(4,49)
(4,54)-(4,66)
(4,55)-(4,57)
(5,2)-(5,4)
(5,2)-(5,6)
(7,23)-(7,75)
(7,23)-(7,75)
(7,56)-(7,62)
(7,56)-(7,75)
(7,63)-(7,75)
(7,64)-(7,65)
(7,67)-(7,74)
(7,68)-(7,69)
(7,70)-(7,71)
(9,26)-(9,52)
(9,27)-(9,33)
(9,34)-(9,51)
(9,35)-(9,46)
(9,36)-(9,43)
*)
