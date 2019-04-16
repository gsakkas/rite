
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let palindrome w = if String.length = 0 then true else explode w;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | x::xs' -> (listReverse xs') @ [x];;

let palindrome w =
  let wList = explode w in
  let revList = listReverse wList in match revList with | wList -> true;;

*)

(* changed spans
(7,20)-(7,65)
let wList = explode w in
let revList =
  listReverse wList in
match revList with
| wList -> true
LetG NonRec (fromList [(VarPatG,AppG (fromList [EmptyG]))]) (LetG NonRec (fromList [(VarPatG,EmptyG)]) EmptyG)

*)

(* type error slice
(2,4)-(5,9)
(2,13)-(5,7)
(3,3)-(5,7)
(4,44)-(4,67)
(4,55)-(4,67)
(4,56)-(4,58)
(5,3)-(5,5)
(5,3)-(5,7)
(7,20)-(7,65)
(7,23)-(7,36)
(7,23)-(7,40)
(7,39)-(7,40)
(7,46)-(7,50)
(7,56)-(7,63)
(7,56)-(7,65)
*)
