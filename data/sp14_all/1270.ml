
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (explode (listReverse w)) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | head::tail -> (listReverse tail) @ [head];;

let palindrome w =
  if (explode w) = (listReverse (explode w)) then true else false;;

*)

(* changed spans
(11,41)-(11,42)
explode
VarG

(11,41)-(11,42)
explode w
AppG (fromList [VarG])

*)
