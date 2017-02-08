
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
(13,48)-(13,49)
*)

(* type error slice
(3,3)-(3,58)
(3,3)-(3,58)
(3,42)-(3,54)
(3,42)-(3,58)
(3,55)-(3,56)
(5,4)-(8,9)
(5,13)-(8,7)
(7,14)-(7,27)
(7,14)-(7,29)
(7,28)-(7,29)
(11,37)-(11,49)
(11,37)-(11,69)
(11,51)-(11,62)
(11,51)-(11,64)
(13,21)-(13,32)
(13,21)-(13,43)
(13,21)-(13,49)
(13,21)-(13,49)
(13,34)-(13,41)
(13,34)-(13,43)
(13,42)-(13,43)
(13,48)-(13,49)
*)
