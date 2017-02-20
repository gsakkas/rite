
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ([(x1 + x2) / 10; 0], ((x1 + x2) mod 10))
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if (List.length a1) = 0
      then ([(x1 + x2) / 10; 0], [(x1 + x2) mod 10])
      else
        (let c::c' = a1 in
         ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10]))) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(28,33)-(28,51)
*)

(* type error slice
(24,4)-(34,51)
(24,10)-(31,74)
(24,12)-(31,74)
(25,6)-(31,74)
(26,6)-(31,74)
(26,6)-(31,74)
(26,20)-(26,21)
(27,6)-(31,74)
(27,6)-(31,74)
(28,11)-(28,52)
(28,33)-(28,51)
(30,8)-(31,74)
(31,9)-(31,73)
(31,41)-(31,72)
(31,42)-(31,44)
(31,45)-(31,46)
(34,18)-(34,32)
(34,18)-(34,44)
(34,33)-(34,34)
*)

(* all spans
(2,14)-(3,68)
(2,16)-(3,68)
(3,2)-(3,68)
(3,5)-(3,10)
(3,5)-(3,6)
(3,9)-(3,10)
(3,16)-(3,18)
(3,24)-(3,68)
(3,31)-(3,32)
(3,45)-(3,67)
(3,45)-(3,46)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(3,59)-(3,66)
(3,60)-(3,61)
(3,64)-(3,65)
(5,6)-(5,11)
(5,10)-(5,11)
(7,12)-(15,41)
(7,15)-(15,41)
(8,2)-(15,41)
(8,11)-(8,25)
(8,11)-(8,22)
(8,23)-(8,25)
(9,2)-(15,41)
(9,11)-(9,25)
(9,11)-(9,22)
(9,23)-(9,25)
(10,2)-(15,41)
(10,5)-(10,12)
(10,5)-(10,7)
(10,10)-(10,12)
(11,7)-(11,15)
(11,8)-(11,10)
(11,12)-(11,14)
(13,4)-(15,41)
(13,7)-(13,14)
(13,7)-(13,9)
(13,12)-(13,14)
(14,9)-(14,41)
(14,10)-(14,12)
(14,14)-(14,40)
(14,35)-(14,36)
(14,15)-(14,34)
(14,16)-(14,21)
(14,22)-(14,23)
(14,24)-(14,33)
(14,25)-(14,27)
(14,30)-(14,32)
(14,37)-(14,39)
(15,9)-(15,41)
(15,10)-(15,36)
(15,31)-(15,32)
(15,11)-(15,30)
(15,12)-(15,17)
(15,18)-(15,19)
(15,20)-(15,29)
(15,21)-(15,23)
(15,26)-(15,28)
(15,33)-(15,35)
(15,38)-(15,40)
(17,19)-(20,66)
(18,2)-(20,66)
(18,5)-(18,11)
(18,5)-(18,6)
(18,9)-(18,11)
(19,7)-(19,9)
(20,7)-(20,66)
(20,19)-(20,20)
(20,24)-(20,65)
(20,30)-(20,31)
(20,44)-(20,56)
(20,44)-(20,54)
(20,55)-(20,56)
(20,64)-(20,65)
(22,11)-(35,34)
(22,14)-(35,34)
(23,2)-(35,34)
(23,11)-(34,51)
(24,4)-(34,51)
(24,10)-(31,74)
(24,12)-(31,74)
(25,6)-(31,74)
(25,20)-(25,21)
(26,6)-(31,74)
(26,20)-(26,21)
(27,6)-(31,74)
(27,9)-(27,29)
(27,9)-(27,25)
(27,10)-(27,21)
(27,22)-(27,24)
(27,28)-(27,29)
(28,11)-(28,52)
(28,12)-(28,31)
(28,13)-(28,27)
(28,13)-(28,22)
(28,14)-(28,16)
(28,19)-(28,21)
(28,25)-(28,27)
(28,29)-(28,30)
(28,33)-(28,51)
(28,34)-(28,43)
(28,35)-(28,37)
(28,40)-(28,42)
(28,48)-(28,50)
(30,8)-(31,74)
(30,21)-(30,23)
(31,9)-(31,73)
(31,10)-(31,39)
(31,14)-(31,15)
(31,11)-(31,13)
(31,16)-(31,38)
(31,17)-(31,37)
(31,17)-(31,32)
(31,18)-(31,27)
(31,19)-(31,21)
(31,24)-(31,26)
(31,30)-(31,31)
(31,35)-(31,37)
(31,41)-(31,72)
(31,45)-(31,46)
(31,42)-(31,44)
(31,47)-(31,71)
(31,48)-(31,70)
(31,48)-(31,63)
(31,49)-(31,58)
(31,50)-(31,52)
(31,55)-(31,57)
(31,61)-(31,62)
(31,68)-(31,70)
(32,4)-(34,51)
(32,15)-(32,23)
(32,16)-(32,18)
(32,20)-(32,22)
(33,4)-(34,51)
(33,15)-(33,33)
(33,15)-(33,27)
(33,28)-(33,30)
(33,31)-(33,33)
(34,4)-(34,51)
(34,18)-(34,44)
(34,18)-(34,32)
(34,33)-(34,34)
(34,35)-(34,39)
(34,40)-(34,44)
(34,48)-(34,51)
(35,2)-(35,34)
(35,2)-(35,12)
(35,13)-(35,34)
(35,14)-(35,17)
(35,18)-(35,33)
(35,19)-(35,26)
(35,27)-(35,29)
(35,30)-(35,32)
*)
