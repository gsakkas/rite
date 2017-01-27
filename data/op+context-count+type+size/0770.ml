
let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | t -> t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let xx = (x1 + x2) + a1 in
      if xx > 9 then (1, ((xx - 10) :: a2)) else (0, (xx :: a2)) in
    let base = (0, []) in
    let args = (List.combine 0) :: ((List.rev l1) 0) :: (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | t -> t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let xx = (x1 + x2) + a1 in
      if xx > 9 then (1, ((xx - 10) :: a2)) else (0, (xx :: a2)) in
    let base = (0, []) in
    let args = List.combine (0 :: (List.rev l1)) (0 :: (List.rev l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(25,17)-(25,31)
(25,17)-(25,69)
(25,30)-(25,31)
(25,38)-(25,52)
(25,51)-(25,52)
*)

(* type error slice
(2,4)-(5,18)
(2,15)-(5,16)
(2,17)-(5,16)
(3,3)-(5,16)
(4,29)-(4,35)
(4,29)-(4,55)
(4,36)-(4,37)
(4,39)-(4,44)
(4,47)-(4,55)
(5,3)-(5,9)
(5,3)-(5,16)
(5,10)-(5,11)
(5,12)-(5,13)
(5,14)-(5,16)
(7,4)-(12,46)
(7,13)-(12,43)
(7,16)-(12,43)
(8,3)-(12,43)
(8,14)-(8,25)
(8,14)-(8,28)
(8,26)-(8,28)
(9,3)-(12,43)
(9,14)-(9,25)
(9,14)-(9,28)
(9,26)-(9,28)
(10,3)-(12,43)
(11,9)-(11,11)
(11,9)-(11,42)
(11,15)-(11,20)
(11,15)-(11,35)
(11,15)-(11,42)
(11,21)-(11,22)
(11,24)-(11,35)
(11,38)-(11,39)
(11,40)-(11,42)
(18,3)-(27,33)
(18,12)-(26,52)
(19,5)-(26,52)
(19,11)-(23,63)
(19,13)-(23,63)
(20,7)-(23,63)
(20,21)-(20,22)
(21,7)-(23,63)
(21,21)-(21,22)
(22,7)-(23,63)
(23,7)-(23,63)
(23,23)-(23,24)
(23,23)-(23,42)
(23,28)-(23,42)
(24,5)-(26,52)
(24,17)-(24,18)
(24,17)-(24,22)
(24,20)-(24,22)
(25,5)-(26,52)
(25,17)-(25,29)
(25,17)-(25,31)
(25,17)-(25,69)
(25,30)-(25,31)
(25,38)-(25,46)
(25,38)-(25,49)
(25,38)-(25,52)
(25,47)-(25,49)
(25,51)-(25,52)
(25,58)-(25,66)
(25,58)-(25,69)
(25,67)-(25,69)
(26,5)-(26,52)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
(26,41)-(26,45)
(26,49)-(26,52)
(27,15)-(27,18)
(27,15)-(27,33)
(27,20)-(27,27)
(27,20)-(27,33)
(27,28)-(27,30)
(27,31)-(27,33)
*)
