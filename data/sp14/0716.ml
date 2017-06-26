
let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  if l = [] then [] else (let h::t = l in (listReverse t) @ [h]);;

let palindrome w =
  let wEx = explode w in
  let rec palHelper lst =
    if (List.length lst) < 2
    then []
    else
      if (List.tl lst) == (List.hd lst)
      then
        (let b::rest = lst in
         let b2::rest2 = listReverse rest in palHelper rest2)
      else [1] in
  if (List.length (palHelper wEx)) = 0 then true else false;;


(* fix

let explode s =
  let rec go i =
    if i >= (String.length s) then [] else (s.[i]) :: (go (i + 1)) in
  go 0;;

let rec listReverse l =
  if l = [] then [] else (let h::t = l in (listReverse t) @ [h]);;

let palindrome w =
  let wEx = explode w in
  let rec palHelper lst =
    if (List.length lst) < 2
    then []
    else
      if (List.tl lst) = lst
      then
        (let b::rest = lst in
         let b2::rest2 = listReverse rest in palHelper rest2)
      else [1] in
  if (List.length (palHelper wEx)) = 0 then true else false;;

*)

(* changed spans
(16,26)-(16,39)
(16,27)-(16,34)
*)

(* type error slice
(16,9)-(16,22)
(16,9)-(16,39)
(16,10)-(16,17)
(16,18)-(16,21)
(16,26)-(16,39)
(16,27)-(16,34)
(16,35)-(16,38)
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
(7,20)-(8,64)
(8,2)-(8,64)
(8,5)-(8,11)
(8,5)-(8,6)
(8,9)-(8,11)
(8,17)-(8,19)
(8,25)-(8,64)
(8,37)-(8,38)
(8,42)-(8,63)
(8,58)-(8,59)
(8,42)-(8,57)
(8,43)-(8,54)
(8,55)-(8,56)
(8,60)-(8,63)
(8,61)-(8,62)
(10,15)-(21,59)
(11,2)-(21,59)
(11,12)-(11,21)
(11,12)-(11,19)
(11,20)-(11,21)
(12,2)-(21,59)
(12,20)-(20,14)
(13,4)-(20,14)
(13,7)-(13,28)
(13,7)-(13,24)
(13,8)-(13,19)
(13,20)-(13,23)
(13,27)-(13,28)
(14,9)-(14,11)
(16,6)-(20,14)
(16,9)-(16,39)
(16,9)-(16,22)
(16,10)-(16,17)
(16,18)-(16,21)
(16,26)-(16,39)
(16,27)-(16,34)
(16,35)-(16,38)
(18,8)-(19,61)
(18,23)-(18,26)
(19,9)-(19,60)
(19,25)-(19,41)
(19,25)-(19,36)
(19,37)-(19,41)
(19,45)-(19,60)
(19,45)-(19,54)
(19,55)-(19,60)
(20,11)-(20,14)
(20,12)-(20,13)
(21,2)-(21,59)
(21,5)-(21,38)
(21,5)-(21,34)
(21,6)-(21,17)
(21,18)-(21,33)
(21,19)-(21,28)
(21,29)-(21,32)
(21,37)-(21,38)
(21,44)-(21,48)
(21,54)-(21,59)
*)
