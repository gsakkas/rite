
let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

let palindrome w = (listReverse (explode w)) = w;;


(* fix

let rec helperAppend l n =
  match l with | [] -> n | h::t -> h :: (helperAppend t n);;

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> helperAppend (listReverse t) [h];;

let palindrome w = (listReverse (explode w)) = (explode w);;

*)

(* changed spans
(13,47)-(13,48)
*)

(* type error slice
(3,2)-(3,58)
(3,2)-(3,58)
(3,40)-(3,58)
(3,41)-(3,53)
(3,54)-(3,55)
(5,3)-(8,8)
(5,12)-(8,6)
(7,12)-(7,29)
(7,13)-(7,26)
(7,27)-(7,28)
(11,36)-(11,48)
(11,36)-(11,68)
(11,49)-(11,64)
(11,50)-(11,61)
(13,19)-(13,44)
(13,19)-(13,48)
(13,19)-(13,48)
(13,20)-(13,31)
(13,32)-(13,43)
(13,33)-(13,40)
(13,41)-(13,42)
(13,47)-(13,48)
*)
