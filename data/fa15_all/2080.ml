
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match w with
  | [] -> true
  | h::t ->
      let separated = explode w in
      let reversed = listReverse separated in
      if w == reversed then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  let separated = explode w in
  let reversed = listReverse separated in
  if separated == reversed then true else false;;

*)

(* changed spans
(11,3)-(16,44)
let separated = explode w in
let reversed =
  listReverse separated in
if separated = reversed
then true
else false
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(4,13)-(4,30)
(4,14)-(4,27)
(4,28)-(4,29)
(8,37)-(8,52)
(8,37)-(8,58)
(8,38)-(8,49)
(8,53)-(8,54)
(11,3)-(16,44)
(11,9)-(11,10)
(14,23)-(14,30)
(14,23)-(14,32)
(14,31)-(14,32)
(15,7)-(16,44)
(15,22)-(15,33)
(15,22)-(15,43)
(16,10)-(16,11)
(16,10)-(16,23)
(16,15)-(16,23)
*)
