
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  match w with
  | [] -> true
  | h::t ->
      let separated = explode w in
      let reversed = listReverse separated in
      if separated == reversed then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  match l with | [] -> [] | h::t -> (listReverse t) @ [h];;

let palindrome w =
  let separated = explode w in
  let reversed = listReverse separated in
  if separated == reversed then true else false;;

*)

(* changed spans
(11,2)-(16,51)
(11,8)-(11,9)
(12,10)-(12,14)
*)

(* type error slice
(2,3)-(5,8)
(2,12)-(5,6)
(4,12)-(4,29)
(4,13)-(4,26)
(4,27)-(4,28)
(11,2)-(16,51)
(11,8)-(11,9)
(14,22)-(14,29)
(14,22)-(14,31)
(14,30)-(14,31)
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
(7,20)-(8,57)
(8,2)-(8,57)
(8,8)-(8,9)
(8,23)-(8,25)
(8,36)-(8,57)
(8,52)-(8,53)
(8,36)-(8,51)
(8,37)-(8,48)
(8,49)-(8,50)
(8,54)-(8,57)
(8,55)-(8,56)
(10,15)-(16,51)
(11,2)-(16,51)
(11,8)-(11,9)
(12,10)-(12,14)
(14,6)-(16,51)
(14,22)-(14,31)
(14,22)-(14,29)
(14,30)-(14,31)
(15,6)-(16,51)
(15,21)-(15,42)
(15,21)-(15,32)
(15,33)-(15,42)
(16,6)-(16,51)
(16,9)-(16,30)
(16,9)-(16,18)
(16,22)-(16,30)
(16,36)-(16,40)
(16,46)-(16,51)
*)
