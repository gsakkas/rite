
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w = if (explode w) = (listReverse w) then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l = List.rev l;;

let palindrome w =
  let explosion = explode w in
  if explosion = (listReverse explosion) then true else false;;

*)

(* changed spans
(9,22)-(9,51)
let explosion = explode w in
if explosion = listReverse explosion
then true
else false
LetG NonRec (fromList [AppG (fromList [EmptyG])]) (IteG EmptyG EmptyG EmptyG)

(9,36)-(9,51)
explosion
VarG

(9,36)-(9,51)
explosion = listReverse explosion
BopG VarG (AppG (fromList [EmptyG]))

(9,36)-(9,51)
if explosion = listReverse explosion
then true
else false
IteG (BopG EmptyG EmptyG) LitG LitG

(9,49)-(9,50)
explosion
VarG

*)
