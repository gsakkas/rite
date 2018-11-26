
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
(11,5)-(11,28)
listReverse (explode w)
AppG (fromList [AppG (fromList [EmptyG])])

(11,18)-(11,25)
explode w
AppG (fromList [VarG])

*)
