
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
  let f' aa xx = List.append aa (mulByDigit xx l1) in
  let base' = [[]] in
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
(36,9)-(36,50)
(36,12)-(36,50)
(36,17)-(36,28)
(36,17)-(36,50)
(36,29)-(36,31)
(36,32)-(36,50)
(36,33)-(36,43)
(36,44)-(36,46)
(37,2)-(39,49)
(37,15)-(37,17)
*)

(* type error slice
(9,36)-(9,74)
(9,36)-(9,74)
(9,39)-(9,40)
(9,39)-(9,44)
(9,39)-(9,44)
(9,43)-(9,44)
(9,50)-(9,60)
(9,50)-(9,62)
(9,68)-(9,69)
(9,68)-(9,74)
(9,68)-(9,74)
(23,3)-(29,65)
(23,19)-(29,63)
(23,21)-(29,63)
(24,2)-(29,63)
(27,2)-(29,63)
(28,2)-(29,63)
(29,2)-(29,63)
(29,49)-(29,59)
(29,49)-(29,63)
(36,2)-(39,49)
(36,9)-(36,50)
(36,17)-(36,28)
(36,17)-(36,50)
(36,29)-(36,31)
(36,32)-(36,50)
(36,33)-(36,43)
(37,2)-(39,49)
(37,14)-(37,18)
(37,14)-(37,18)
(37,15)-(37,17)
(38,13)-(38,27)
(38,13)-(38,39)
(38,28)-(38,30)
(38,31)-(38,36)
*)
