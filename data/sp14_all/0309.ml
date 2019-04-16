
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (listReverse explode w) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(11,6)-(11,29)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(8,37)-(8,52)
(8,37)-(8,58)
(8,38)-(8,49)
(8,53)-(8,54)
(11,6)-(11,29)
(11,7)-(11,18)
*)
