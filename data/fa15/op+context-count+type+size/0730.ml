
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
  let args = List.map (mulByDigit l1) in
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
(35,2)-(37,49)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(37,49)
(36,13)-(36,21)
(36,13)-(36,37)
(36,22)-(36,37)
(36,23)-(36,33)
(37,2)-(37,49)
(37,16)-(37,42)
*)

(* type error slice
(36,2)-(37,49)
(36,13)-(36,21)
(36,13)-(36,37)
(37,16)-(37,30)
(37,16)-(37,42)
(37,38)-(37,42)
*)
