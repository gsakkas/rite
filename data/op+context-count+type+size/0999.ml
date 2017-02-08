
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
      then
        (if rem = 1
         then (0, (1 :: acc))
         else
           (let (el1,el2) = x in
            let new_sum = (rem + el1) + el2 in
            let new_rem = if new_sum > 9 then 1 else 0 in
            let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
            (new_rem, (norm_sum :: acc)))) in
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
(18,7)-(27,39)
(18,10)-(18,11)
(18,10)-(18,16)
(18,14)-(18,16)
(20,10)-(27,39)
(23,13)-(27,39)
(23,29)-(23,30)
(24,13)-(27,39)
(25,13)-(27,39)
(26,13)-(27,39)
(29,26)-(29,28)
(29,29)-(29,30)
(29,32)-(29,50)
(31,3)-(31,13)
(31,15)-(31,18)
(31,15)-(31,33)
(31,20)-(31,27)
(31,20)-(31,33)
(31,28)-(31,30)
(31,31)-(31,33)
*)

(* type error slice
(16,5)-(30,52)
(16,11)-(27,39)
(16,13)-(27,39)
(18,7)-(27,39)
(18,7)-(27,39)
(18,7)-(27,39)
(18,10)-(18,11)
(18,10)-(18,16)
(18,10)-(18,16)
(18,14)-(18,16)
(20,10)-(27,39)
(21,16)-(21,28)
(23,13)-(27,39)
(23,29)-(23,30)
(29,5)-(30,52)
(29,16)-(29,24)
(29,16)-(29,50)
(29,26)-(29,50)
(29,29)-(29,30)
(29,32)-(29,44)
(29,32)-(29,50)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,41)-(30,45)
*)
