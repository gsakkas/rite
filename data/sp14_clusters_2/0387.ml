
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse explode w) == w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w = (listReverse (explode w)) == (explode w);;

*)

(* changed spans
(10,19)-(10,42)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(10,32)-(10,39)
explode w
AppG (fromList [VarG])

(10,46)-(10,47)
explode
VarG

(10,46)-(10,47)
explode w
AppG (fromList [VarG])

*)
