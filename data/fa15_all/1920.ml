
let rec endChar l =
  match l with | [] -> [] | h::[] -> [h] | h::t -> endChar t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec removeLast l =
  match l with | [] -> [] | h::[] -> [] | h::t -> h :: (removeLast t);;

let palindrome w =
  let rec palin ls =
    match ls with
    | [] -> true
    | h::[] -> true
    | h::t -> if h = (endChar t) then palin (removeLast t) else false in
  palin (explode w);;


(* fix

let rec endChar l =
  match l with | [] -> [] | h::[] -> [h] | h::t -> endChar t;;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec removeLast l =
  match l with | [] -> [] | h::[] -> [] | h::t -> h :: (removeLast t);;

let palindrome w =
  let rec palin ls =
    match ls with
    | [] -> true
    | h::[] -> true
    | h::t -> if [h] = (endChar t) then palin (removeLast t) else false in
  palin (explode w);;

*)

(* changed spans
(18,18)-(18,19)
[h]
ListG (fromList [VarG])

*)

(* type error slice
(3,3)-(3,61)
(3,38)-(3,41)
(3,39)-(3,40)
(3,52)-(3,59)
(3,52)-(3,61)
(3,60)-(3,61)
(15,5)-(18,70)
(18,18)-(18,19)
(18,18)-(18,33)
(18,22)-(18,33)
(18,23)-(18,30)
(18,31)-(18,32)
*)
