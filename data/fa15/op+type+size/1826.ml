
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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
      let (x1,x2) = x in let (a1,a2) = a in ((a1 @ [x1 + x2]), (a2 @ [x1])) in
    let base = [([], [])] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,6)-(23,75)
(23,25)-(23,75)
(23,39)-(23,40)
(23,45)-(23,61)
(23,46)-(23,48)
(23,49)-(23,50)
(23,63)-(23,74)
(23,64)-(23,66)
(23,67)-(23,68)
(23,70)-(23,72)
(24,4)-(26,51)
(24,15)-(24,25)
(24,16)-(24,24)
(25,4)-(26,51)
(26,4)-(26,51)
*)

(* type error slice
(22,4)-(26,51)
(22,10)-(23,75)
(23,25)-(23,75)
(23,39)-(23,40)
(24,4)-(26,51)
(24,15)-(24,25)
(26,18)-(26,32)
(26,18)-(26,44)
(26,33)-(26,34)
(26,35)-(26,39)
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
(5,12)-(13,41)
(5,15)-(13,41)
(6,2)-(13,41)
(6,11)-(6,25)
(6,11)-(6,22)
(6,23)-(6,25)
(7,2)-(13,41)
(7,11)-(7,25)
(7,11)-(7,22)
(7,23)-(7,25)
(8,2)-(13,41)
(8,5)-(8,12)
(8,5)-(8,7)
(8,10)-(8,12)
(9,7)-(9,15)
(9,8)-(9,10)
(9,12)-(9,14)
(11,4)-(13,41)
(11,7)-(11,14)
(11,7)-(11,9)
(11,12)-(11,14)
(12,9)-(12,41)
(12,10)-(12,12)
(12,14)-(12,40)
(12,35)-(12,36)
(12,15)-(12,34)
(12,16)-(12,21)
(12,22)-(12,23)
(12,24)-(12,33)
(12,25)-(12,27)
(12,30)-(12,32)
(12,37)-(12,39)
(13,9)-(13,41)
(13,10)-(13,36)
(13,31)-(13,32)
(13,11)-(13,30)
(13,12)-(13,17)
(13,18)-(13,19)
(13,20)-(13,29)
(13,21)-(13,23)
(13,26)-(13,28)
(13,33)-(13,35)
(13,38)-(13,40)
(15,19)-(18,66)
(16,2)-(18,66)
(16,5)-(16,11)
(16,5)-(16,6)
(16,9)-(16,11)
(17,7)-(17,9)
(18,7)-(18,66)
(18,19)-(18,20)
(18,24)-(18,65)
(18,30)-(18,31)
(18,44)-(18,56)
(18,44)-(18,54)
(18,55)-(18,56)
(18,64)-(18,65)
(20,11)-(27,34)
(20,14)-(27,34)
(21,2)-(27,34)
(21,11)-(26,51)
(22,4)-(26,51)
(22,10)-(23,75)
(22,12)-(23,75)
(23,6)-(23,75)
(23,20)-(23,21)
(23,25)-(23,75)
(23,39)-(23,40)
(23,44)-(23,75)
(23,45)-(23,61)
(23,49)-(23,50)
(23,46)-(23,48)
(23,51)-(23,60)
(23,52)-(23,59)
(23,52)-(23,54)
(23,57)-(23,59)
(23,63)-(23,74)
(23,67)-(23,68)
(23,64)-(23,66)
(23,69)-(23,73)
(23,70)-(23,72)
(24,4)-(26,51)
(24,15)-(24,25)
(24,16)-(24,24)
(24,17)-(24,19)
(24,21)-(24,23)
(25,4)-(26,51)
(25,15)-(25,33)
(25,15)-(25,27)
(25,28)-(25,30)
(25,31)-(25,33)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)
