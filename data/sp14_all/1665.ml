
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> let x = [h] in (listReverse t) @ x;;

let palindrome w =
  let x = listReverse (explode w) in if x = (explode w) then true;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> let x = [h] in (listReverse t) @ x;;

let palindrome w =
  let x = listReverse (explode w) in if x = (explode w) then true else false;;

*)

(* changed spans
(11,37)-(11,65)
false
LitG

*)
