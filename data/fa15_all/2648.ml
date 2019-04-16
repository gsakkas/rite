
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
  if i < 2
  then l
  else (let total = bigAdd l l in bigAdd total ((mulByDigit i) - (1 l)));;


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

let rec mulByDigit i l =
  if i < 2
  then l
  else (let total = bigAdd l l in bigAdd total (mulByDigit (i - 1) l));;

*)

(* changed spans
(31,48)-(31,72)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

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
(28,4)-(31,75)
(28,20)-(31,73)
(28,22)-(31,73)
(31,35)-(31,41)
(31,35)-(31,72)
(31,48)-(31,72)
(31,49)-(31,63)
(31,50)-(31,60)
(31,66)-(31,71)
(31,67)-(31,68)
*)
