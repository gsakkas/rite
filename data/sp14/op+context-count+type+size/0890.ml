
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        ((List.length acc) = ((List.length l1) - 1)) ||
          ((List.length acc) = ((List.length l2) - 1))
      then (if rem = 1 then (0, ([1; 0] :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let lenl1 = List.length l1 in
  let lenl2 = List.length l2 in
  if lenl1 > lenl2
  then (l1, ((clone 0 (lenl1 - lenl2)) @ l2))
  else (((clone 0 (lenl2 - lenl1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (rem,acc) = a in
      if
        ((List.length acc) = ((List.length l1) - 1)) ||
          ((List.length acc) = ((List.length l2) - 1))
      then (if rem = 1 then (0, ([1; 0] @ acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,32)-(21,47)
(21,33)-(21,39)
*)

(* type error slice
(12,2)-(12,74)
(12,2)-(12,74)
(12,39)-(12,40)
(12,39)-(12,44)
(12,39)-(12,44)
(12,43)-(12,44)
(12,50)-(12,60)
(12,50)-(12,62)
(12,61)-(12,62)
(15,2)-(31,34)
(15,11)-(30,51)
(16,4)-(30,51)
(16,4)-(30,51)
(16,10)-(27,38)
(17,6)-(27,38)
(17,22)-(17,23)
(21,32)-(21,47)
(21,32)-(21,47)
(21,33)-(21,39)
(21,43)-(21,46)
(26,9)-(27,37)
(26,24)-(26,69)
(26,44)-(26,56)
(27,19)-(27,36)
(27,19)-(27,36)
(27,20)-(27,28)
(27,32)-(27,35)
(28,4)-(30,51)
(29,4)-(30,51)
(30,4)-(30,51)
(30,4)-(30,51)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,48)-(30,51)
(31,2)-(31,12)
(31,2)-(31,34)
(31,13)-(31,34)
(31,14)-(31,17)
*)
