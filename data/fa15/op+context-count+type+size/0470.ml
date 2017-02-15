
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
  else (let total = bigAdd l l in (total + (mulByDigit i)) - (1 l));;


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
(31,34)-(31,58)
(31,34)-(31,66)
(31,35)-(31,40)
(31,43)-(31,57)
(31,55)-(31,56)
(31,61)-(31,66)
*)

(* type error slice
(4,3)-(12,19)
(4,12)-(12,17)
(8,8)-(8,44)
(8,39)-(8,40)
(8,41)-(8,43)
(15,36)-(15,75)
(15,36)-(15,75)
(15,50)-(15,60)
(15,50)-(15,62)
(15,68)-(15,75)
(15,72)-(15,73)
(17,3)-(26,36)
(17,11)-(26,34)
(17,14)-(26,34)
(18,2)-(26,34)
(26,2)-(26,12)
(26,2)-(26,34)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(28,3)-(31,69)
(28,19)-(31,67)
(28,21)-(31,67)
(29,2)-(31,67)
(29,2)-(31,67)
(30,7)-(30,8)
(31,7)-(31,67)
(31,7)-(31,67)
(31,20)-(31,26)
(31,20)-(31,30)
(31,27)-(31,28)
(31,34)-(31,58)
(31,34)-(31,58)
(31,34)-(31,66)
(31,35)-(31,40)
(31,43)-(31,57)
(31,44)-(31,54)
(31,61)-(31,66)
(31,62)-(31,63)
*)
