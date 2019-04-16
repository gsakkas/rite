
let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> appendLists ((listReverse t), [h]);;

let palindrome w =
  if (explode w) = (listReverse explode w) then true else false;;


(* fix

let rec appendLists (l1,l2) =
  match l1 with | [] -> l2 | h::t -> h :: (appendLists (t, l2));;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> appendLists ((listReverse t), [h]);;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(14,20)-(14,43)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(5,4)-(8,9)
(5,13)-(8,7)
(11,3)-(11,71)
(11,50)-(11,65)
(11,51)-(11,62)
(11,63)-(11,64)
(14,20)-(14,43)
(14,21)-(14,32)
(14,33)-(14,40)
*)
