
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs = function | [] -> xs | hd::tl -> helper (hd :: xs) tl in
  helper [];;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let listReverse l =
  let rec helper xs l =
    match l with | [] -> [] | hd::tl -> helper (hd :: xs) l in
  helper [] l;;

let palindrome w =
  if (listReverse (explode w)) = (explode w) then true else false;;

*)

(* changed spans
(8,22)-(8,74)
fun l ->
  match l with
  | [] -> []
  | hd :: tl -> helper (hd :: xs)
                       l
LamG (CaseG EmptyG (fromList [(Nothing,EmptyG)]))

(8,39)-(8,41)
l
VarG

(8,54)-(8,74)
[]
ListG EmptyG Nothing

(9,2)-(9,8)
helper [] l
AppG (fromList [VarG,ListG EmptyG Nothing])

(9,2)-(9,11)
l
VarG

(11,15)-(12,65)
l
VarG

*)
