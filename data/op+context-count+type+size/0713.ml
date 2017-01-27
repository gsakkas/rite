
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  helper i l accum;;

let bigMul l1 l2 =
  let f a x = let (q,w) = a in mulByDigit x q in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  helper i l accum;;

let bigMul l1 l2 =
  let f a x = let (q,w) = a in ((mulByDigit x q), []) in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(38,32)-(38,46)
(39,3)-(40,76)
*)

(* type error slice
(2,4)-(6,19)
(2,15)-(6,17)
(2,17)-(6,17)
(3,3)-(6,17)
(3,15)-(3,17)
(4,3)-(6,17)
(5,30)-(5,36)
(5,30)-(5,56)
(5,38)-(5,48)
(5,51)-(5,56)
(6,3)-(6,9)
(6,3)-(6,17)
(6,10)-(6,15)
(6,16)-(6,17)
(8,4)-(12,78)
(8,13)-(12,75)
(8,16)-(12,75)
(9,3)-(12,75)
(9,17)-(9,28)
(9,17)-(9,31)
(9,29)-(9,31)
(9,35)-(9,46)
(9,35)-(9,49)
(9,47)-(9,49)
(10,3)-(12,75)
(11,10)-(11,21)
(11,10)-(11,42)
(11,10)-(11,47)
(11,23)-(11,28)
(11,23)-(11,37)
(11,29)-(11,30)
(11,32)-(11,37)
(11,40)-(11,42)
(11,45)-(11,47)
(15,3)-(15,70)
(15,51)-(15,61)
(15,51)-(15,63)
(15,62)-(15,63)
(17,4)-(29,37)
(17,12)-(29,33)
(17,15)-(29,33)
(18,3)-(29,33)
(18,12)-(28,78)
(19,5)-(28,78)
(19,11)-(26,29)
(19,13)-(26,29)
(20,7)-(26,29)
(20,22)-(20,23)
(21,7)-(26,29)
(21,11)-(21,12)
(21,11)-(21,16)
(23,10)-(25,73)
(24,16)-(24,18)
(24,16)-(24,45)
(24,21)-(24,45)
(27,5)-(28,78)
(27,18)-(27,26)
(27,18)-(27,29)
(27,18)-(27,34)
(27,27)-(27,29)
(27,32)-(27,34)
(28,5)-(28,78)
(28,16)-(28,24)
(28,16)-(28,27)
(28,25)-(28,27)
(28,31)-(28,78)
(28,45)-(28,59)
(28,45)-(28,71)
(28,60)-(28,61)
(28,62)-(28,66)
(28,67)-(28,71)
(28,75)-(28,78)
(29,3)-(29,13)
(29,3)-(29,33)
(29,15)-(29,18)
(29,15)-(29,33)
(29,20)-(29,27)
(29,20)-(29,33)
(29,28)-(29,30)
(29,31)-(29,33)
(31,4)-(35,21)
(31,20)-(35,19)
(31,22)-(35,19)
(32,3)-(35,19)
(32,15)-(32,17)
(33,3)-(35,19)
(34,20)-(34,26)
(34,20)-(34,52)
(34,28)-(34,33)
(34,35)-(34,36)
(34,38)-(34,44)
(34,38)-(34,52)
(34,45)-(34,46)
(34,47)-(34,52)
(35,3)-(35,9)
(35,3)-(35,19)
(35,10)-(35,11)
(35,12)-(35,13)
(35,14)-(35,19)
(38,3)-(40,76)
(38,9)-(38,46)
(38,11)-(38,46)
(38,15)-(38,46)
(38,27)-(38,28)
(38,32)-(38,42)
(38,32)-(38,46)
(38,43)-(38,44)
(38,45)-(38,46)
(39,3)-(40,76)
(39,15)-(39,17)
(39,15)-(39,21)
(39,19)-(39,21)
(40,3)-(40,76)
(40,14)-(40,22)
(40,14)-(40,25)
(40,23)-(40,25)
(40,43)-(40,57)
(40,43)-(40,69)
(40,58)-(40,59)
(40,60)-(40,64)
(40,65)-(40,69)
*)
