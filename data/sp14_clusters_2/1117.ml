
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
(14,19)-(14,42)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(14,32)-(14,39)
explode w
AppG (fromList [VarG])

*)
