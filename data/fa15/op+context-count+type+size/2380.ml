
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
(2,12)-(5,6)
(3,2)-(5,6)
(7,20)-(8,57)
(8,2)-(8,57)
(8,8)-(8,9)
(8,23)-(8,25)
(8,36)-(8,51)
(8,36)-(8,57)
(8,37)-(8,48)
(8,49)-(8,50)
(8,52)-(8,53)
(8,54)-(8,57)
(8,55)-(8,56)
(11,8)-(11,15)
(11,8)-(11,17)
(11,46)-(11,57)
(11,46)-(11,69)
(11,59)-(11,66)
*)

(* type error slice
(8,36)-(8,51)
(8,36)-(8,57)
(8,37)-(8,48)
(8,52)-(8,53)
(11,2)-(11,69)
(11,2)-(11,69)
(11,31)-(11,35)
(11,46)-(11,57)
(11,46)-(11,69)
*)
