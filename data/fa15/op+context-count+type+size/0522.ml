
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
  then 0
  else (let total = bigAdd l l in bigAdd total (mulByDigit (i - 1) l));;


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
  then []
  else (let total = bigAdd l l in bigAdd total (mulByDigit (i - 1) l));;

*)

(* changed spans
(30,7)-(30,8)
*)

(* type error slice
(4,3)-(12,19)
(4,12)-(12,17)
(4,15)-(12,17)
(11,14)-(11,50)
(11,45)-(11,46)
(11,47)-(11,49)
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
(26,30)-(26,32)
(28,3)-(31,72)
(28,19)-(31,70)
(28,21)-(31,70)
(29,2)-(31,70)
(29,2)-(31,70)
(30,7)-(30,8)
(31,7)-(31,70)
(31,34)-(31,40)
(31,34)-(31,69)
(31,47)-(31,69)
(31,48)-(31,58)
*)
