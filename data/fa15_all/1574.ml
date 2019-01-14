
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::tail -> (listReverse tail) @ [h];;

let palindrome w = explode (listReverse w);;


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
(10,19)-(10,42)
explode w = listReverse (explode w)
BopG (AppG (fromList [EmptyG])) (AppG (fromList [EmptyG]))

(10,19)-(10,42)
if explode w = listReverse (explode w)
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

(10,27)-(10,42)
w
VarG

(10,40)-(10,41)
explode
VarG

(10,40)-(10,41)
explode w
AppG (fromList [VarG])

*)
