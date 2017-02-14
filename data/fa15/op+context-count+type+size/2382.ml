
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match explode w with | [] -> true | h::t -> listReverse (explode w);;


(* fix

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec matchHeads w =
  match w with
  | [] -> true
  | h::t -> if h = (List.hd (listReverse w)) then true else false;;

let palindrome w =
  match explode w with | [] -> true | h::t -> matchHeads (explode w);;

*)

(* changed spans
(2,13)-(5,7)
(3,3)-(5,7)
(7,21)-(8,58)
(8,3)-(8,58)
(8,9)-(8,10)
(8,24)-(8,26)
(8,38)-(8,49)
(8,38)-(8,51)
(8,38)-(8,58)
(8,50)-(8,51)
(8,53)-(8,54)
(8,55)-(8,58)
(8,56)-(8,57)
(11,9)-(11,16)
(11,9)-(11,18)
(11,47)-(11,58)
(11,47)-(11,69)
(11,60)-(11,67)
*)

(* type error slice
(8,38)-(8,49)
(8,38)-(8,51)
(8,38)-(8,58)
(8,53)-(8,54)
(11,3)-(11,69)
(11,3)-(11,69)
(11,32)-(11,36)
(11,47)-(11,58)
(11,47)-(11,69)
*)
