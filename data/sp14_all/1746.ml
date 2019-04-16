
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
explode w
AppG (fromList [VarG])

*)

(* type error slice
(3,3)-(3,59)
(3,41)-(3,59)
(3,42)-(3,54)
(3,55)-(3,56)
(5,4)-(8,9)
(5,13)-(8,7)
(7,13)-(7,30)
(7,14)-(7,27)
(7,28)-(7,29)
(11,37)-(11,49)
(11,37)-(11,69)
(11,50)-(11,65)
(11,51)-(11,62)
(13,20)-(13,45)
(13,20)-(13,49)
(13,21)-(13,32)
(13,33)-(13,44)
(13,34)-(13,41)
(13,42)-(13,43)
(13,48)-(13,49)
*)
