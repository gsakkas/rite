
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
(18,17)-(18,18)
[h]
ListG VarG Nothing

*)
