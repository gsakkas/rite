
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
      if x = []
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
      else
        (let (el1,el2) = x in
         let new_sum = (rem + el1) + el2 in
         let new_rem = if new_sum > 9 then 1 else 0 in
         let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
         (new_rem, (norm_sum :: acc))) in
    let base = (0, []) in
    let args = List.rev ([] @ (List.combine l1 l2)) in
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
        ((List.length acc) = (List.length l1)) ||
          ((List.length acc) = (List.length l2))
      then (if rem = 1 then (0, (1 :: acc)) else (0, acc))
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
(18,9)-(18,10)
(18,9)-(18,15)
(18,13)-(18,15)
(19,11)-(19,58)
(21,8)-(25,38)
(22,9)-(25,37)
(23,9)-(25,37)
(24,9)-(25,37)
(26,4)-(28,51)
(27,4)-(28,51)
(27,25)-(27,27)
(27,28)-(27,29)
(27,30)-(27,50)
(28,4)-(28,51)
(29,2)-(29,12)
(29,13)-(29,34)
(29,14)-(29,17)
(29,18)-(29,33)
(29,19)-(29,26)
(29,27)-(29,29)
(29,30)-(29,32)
*)

(* type error slice
(16,4)-(28,51)
(16,10)-(25,38)
(16,12)-(25,38)
(18,9)-(18,10)
(18,9)-(18,15)
(18,9)-(18,15)
(18,13)-(18,15)
(21,8)-(25,38)
(21,25)-(21,26)
(27,4)-(28,51)
(27,15)-(27,23)
(27,15)-(27,51)
(27,24)-(27,51)
(27,28)-(27,29)
(27,30)-(27,50)
(27,31)-(27,43)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
(28,40)-(28,44)
*)
