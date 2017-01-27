
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
(5,4)-(8,9)
(5,13)-(8,7)
(6,3)-(8,7)
(7,14)-(7,27)
(7,14)-(7,29)
(7,28)-(7,29)
(7,56)-(7,58)
(7,56)-(7,65)
(7,60)-(7,65)
(8,3)-(8,5)
(8,3)-(8,7)
(8,6)-(8,7)
(11,3)-(11,69)
(11,51)-(11,62)
(11,51)-(11,64)
(11,63)-(11,64)
(13,21)-(13,32)
(13,21)-(13,43)
(13,21)-(13,49)
(13,34)-(13,41)
(13,34)-(13,43)
(13,42)-(13,43)
(13,48)-(13,49)
*)
