
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec revexp (x,y) = match x with | [] -> y | h::t -> revexp (t, (h ^ y));;

let palindrome w = if w = (revexp ((explode w), "")) then true else false;;



let rec reverse (x,y) =
  match x with | [] -> y | h::t -> reverse (t, (h :: y));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = match l with | [] -> [] | h::t -> reverse (l, []);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;


(* changed spans
(7,9)-(7,21)
(7,30)-(7,31)
(7,45)-(7,46)
(7,57)-(7,63)
(7,65)-(7,66)
(7,68)-(7,75)
(9,28)-(9,36)
(9,47)-(9,51)
(9,52)-(9,53)
*)

(* type error slice
(7,57)-(7,74)
(9,28)-(9,51)
*)
