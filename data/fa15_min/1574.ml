
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
(10,20)-(10,43)
if explode w = listReverse (explode w)
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(8,40)-(8,58)
(8,40)-(8,64)
(8,41)-(8,52)
(8,59)-(8,60)
(10,20)-(10,27)
(10,20)-(10,43)
(10,28)-(10,43)
(10,29)-(10,40)
*)
