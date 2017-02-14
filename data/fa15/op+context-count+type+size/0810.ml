
let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (bit,l) = a in
    let movedList = List.append l [0] in ((bit + 1), (bigAdd movedList x)) in
  let base = (0, []) in
  let f' a x = List.append a (mulByDigit x l1) in
  let base' = [] in
  let args = List.fold_left f' base' l2 in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n > 0 then (l1, ((clone 0 n) @ l2)) else (((clone 0 (0 - n)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accList) = a in
      let (x1,x2) = x in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: accList)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in
    if carry = 1 then 1 :: res else res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let (carry,accList) = a in
    (((carry + (x * i)) / 10), (((carry + (x * i)) mod 10) :: accList)) in
  let base = (0, []) in
  let newlist = List.rev (0 :: l) in
  let (_,res) = List.fold_left f base newlist in removeZero res;;

let bigMul l1 l2 =
  let f a x =
    let (ll,accumulate) = a in
    let multed = mulByDigit x l1 in
    let accumulate = List.append accumulate [0] in
    (l1, (bigAdd accumulate multed)) in
  let base = (l1, [0]) in
  let args = l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(33,4)-(34,74)
(34,4)-(34,74)
(34,20)-(34,31)
(34,32)-(34,33)
(34,42)-(34,51)
(34,43)-(34,46)
(34,49)-(34,50)
(34,61)-(34,70)
(34,71)-(34,72)
(35,2)-(39,49)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(39,49)
(36,9)-(36,46)
(36,11)-(36,46)
(36,15)-(36,26)
(36,15)-(36,46)
(36,27)-(36,28)
(36,29)-(36,46)
(36,30)-(36,40)
(36,41)-(36,42)
(37,2)-(39,49)
(37,14)-(37,16)
(38,2)-(39,49)
(38,13)-(38,39)
(39,2)-(39,49)
*)

(* type error slice
(4,3)-(6,78)
(4,12)-(6,76)
(4,15)-(6,76)
(6,21)-(6,39)
(6,34)-(6,35)
(6,36)-(6,38)
(11,3)-(21,36)
(11,11)-(21,34)
(11,14)-(21,34)
(12,2)-(21,34)
(21,2)-(21,12)
(21,2)-(21,34)
(21,18)-(21,33)
(21,19)-(21,26)
(21,30)-(21,32)
(23,3)-(29,65)
(23,19)-(29,63)
(23,21)-(29,63)
(24,2)-(29,63)
(27,2)-(29,63)
(28,2)-(29,63)
(29,2)-(29,63)
(29,49)-(29,59)
(29,49)-(29,63)
(32,2)-(39,49)
(32,8)-(34,74)
(32,10)-(34,74)
(33,4)-(34,74)
(33,4)-(34,74)
(33,18)-(33,19)
(34,4)-(34,74)
(34,20)-(34,31)
(34,20)-(34,37)
(34,32)-(34,33)
(34,34)-(34,37)
(34,34)-(34,37)
(34,35)-(34,36)
(34,41)-(34,74)
(34,53)-(34,73)
(34,54)-(34,60)
(34,71)-(34,72)
(36,2)-(39,49)
(36,9)-(36,46)
(36,15)-(36,26)
(36,15)-(36,46)
(36,27)-(36,28)
(36,29)-(36,46)
(36,30)-(36,40)
(38,2)-(39,49)
(38,13)-(38,27)
(38,13)-(38,39)
(38,28)-(38,30)
(39,16)-(39,30)
(39,16)-(39,42)
(39,31)-(39,32)
(39,38)-(39,42)
*)
