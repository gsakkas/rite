
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

let palindrome w =
  let wList = explode w in
  let wReverse = listReverse (explode w) in if true then wList;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | a::b -> (listReverse b) @ [a];;

let palindrome w =
  let wList = explode w in
  let wReverse = listReverse (explode w) in
  if wList = wReverse then true else false;;

*)

(* changed spans
(12,44)-(12,62)
wReverse
VarG

(12,47)-(12,51)
wList = wReverse
BopG VarG VarG

*)
