
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
(28,19)-(29,72)
(32,2)-(36,75)
(33,4)-(34,60)
(34,16)-(34,59)
(34,17)-(34,22)
(34,25)-(34,58)
(34,46)-(34,57)
(34,47)-(34,49)
(34,50)-(34,52)
(34,53)-(34,56)
(35,2)-(36,75)
(35,13)-(35,20)
(35,14)-(35,15)
(35,17)-(35,19)
(36,2)-(36,75)
(36,13)-(36,21)
(36,22)-(36,24)
(36,28)-(36,75)
(36,42)-(36,56)
(36,42)-(36,68)
(36,57)-(36,58)
(36,59)-(36,63)
(36,64)-(36,68)
(36,72)-(36,75)
*)

(* type error slice
(4,3)-(12,19)
(4,12)-(12,17)
(4,15)-(12,17)
(11,14)-(11,50)
(11,45)-(11,46)
(11,47)-(11,49)
(17,3)-(26,36)
(17,11)-(26,34)
(17,14)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,30)-(26,32)
(29,41)-(29,47)
(29,41)-(29,72)
(29,50)-(29,72)
(29,51)-(29,61)
(32,2)-(36,75)
(32,8)-(34,60)
(33,4)-(34,60)
(33,22)-(33,23)
(34,16)-(34,59)
(34,17)-(34,22)
(34,25)-(34,58)
(34,26)-(34,43)
(34,27)-(34,37)
(34,46)-(34,57)
(34,47)-(34,49)
(34,50)-(34,52)
(35,2)-(36,75)
(35,13)-(35,20)
(35,17)-(35,19)
(36,42)-(36,56)
(36,42)-(36,68)
(36,57)-(36,58)
(36,59)-(36,63)
*)
