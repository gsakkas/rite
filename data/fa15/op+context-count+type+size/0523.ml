
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
  if i = 0 then [] else bigAdd l mulByDigit ((i - 1) l);;


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
  if i = 0 then [] else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(29,25)-(29,55)
(29,34)-(29,44)
(29,47)-(29,55)
*)

(* type error slice
(15,37)-(15,76)
(15,37)-(15,76)
(15,51)-(15,61)
(15,51)-(15,63)
(15,69)-(15,76)
(15,73)-(15,74)
(17,4)-(26,37)
(17,12)-(26,33)
(17,15)-(26,33)
(18,3)-(26,33)
(26,3)-(26,13)
(26,3)-(26,33)
(29,25)-(29,31)
(29,25)-(29,55)
(29,47)-(29,52)
(29,47)-(29,55)
*)
