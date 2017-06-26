
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> let x = [h] in (listReverse t) @ x;;

let palindrome w =
  let x = listReverse (explode w) in if x = (explode w) then true;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> let x = [h] in (listReverse t) @ x;;

let palindrome w =
  let x = listReverse (explode w) in if x = (explode w) then true else false;;

*)

(* changed spans
(11,37)-(11,65)
*)

(* type error slice
(11,37)-(11,65)
(11,61)-(11,65)
*)

(* all spans
(2,12)-(5,6)
(3,2)-(5,6)
(3,13)-(4,66)
(4,4)-(4,66)
(4,7)-(4,29)
(4,7)-(4,8)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(4,35)-(4,37)
(4,43)-(4,66)
(4,43)-(4,50)
(4,44)-(4,49)
(4,44)-(4,45)
(4,47)-(4,48)
(4,54)-(4,66)
(4,55)-(4,57)
(4,58)-(4,65)
(4,59)-(4,60)
(4,63)-(4,64)
(5,2)-(5,6)
(5,2)-(5,4)
(5,5)-(5,6)
(7,20)-(8,70)
(8,2)-(8,70)
(8,8)-(8,9)
(8,23)-(8,25)
(8,36)-(8,70)
(8,44)-(8,47)
(8,45)-(8,46)
(8,51)-(8,70)
(8,67)-(8,68)
(8,51)-(8,66)
(8,52)-(8,63)
(8,64)-(8,65)
(8,69)-(8,70)
(10,15)-(11,65)
(11,2)-(11,65)
(11,10)-(11,33)
(11,10)-(11,21)
(11,22)-(11,33)
(11,23)-(11,30)
(11,31)-(11,32)
(11,37)-(11,65)
(11,40)-(11,55)
(11,40)-(11,41)
(11,44)-(11,55)
(11,45)-(11,52)
(11,53)-(11,54)
(11,61)-(11,65)
*)
