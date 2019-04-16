
let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), (total + ((mulByDigit x l2) * (10 ** pow)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n < 1 then [] else [x] @ (clone x (n - 1));;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  if length1 < length2
  then (((clone 0 (length2 - length1)) @ l1), l2)
  else
    if length2 < length1
    then (l1, ((clone 0 (length1 - length2)) @ l2))
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else [h] @ t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (j,k) = x in
      let (carry,rest) = a in
      ((((j + k) + carry) / 10), ([((j + k) + carry) mod 10] @ rest)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (car,res) = List.fold_left f base args in [car] @ res in
  removeZero (add (padZero l1 l2));;

let rec listZeros n =
  match n with | 0 -> [] | 1 -> [0] | x -> [0] @ (listZeros (n - 1));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (pow,total) = a in
    ((pow + 1), ((bigAdd total (mulByDigit x l2)) @ (listZeros pow))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(34,17)-(34,60)
bigAdd total (mulByDigit x
                         l2) @ listZeros pow
AppG (fromList [AppG (fromList [EmptyG])])

*)

(* type error slice
(4,4)-(12,20)
(4,13)-(12,18)
(4,16)-(12,18)
(11,15)-(11,51)
(11,46)-(11,47)
(11,48)-(11,50)
(17,4)-(26,37)
(17,12)-(26,35)
(17,15)-(26,35)
(26,19)-(26,34)
(26,20)-(26,27)
(26,31)-(26,33)
(29,42)-(29,48)
(29,42)-(29,73)
(29,51)-(29,73)
(29,52)-(29,62)
(32,3)-(36,76)
(32,9)-(34,61)
(33,5)-(34,61)
(33,23)-(33,24)
(34,17)-(34,60)
(34,18)-(34,23)
(34,26)-(34,59)
(34,27)-(34,44)
(34,28)-(34,38)
(34,47)-(34,58)
(34,48)-(34,50)
(34,51)-(34,53)
(35,3)-(36,76)
(35,14)-(35,21)
(35,18)-(35,20)
(36,43)-(36,57)
(36,43)-(36,69)
(36,58)-(36,59)
(36,60)-(36,64)
*)
