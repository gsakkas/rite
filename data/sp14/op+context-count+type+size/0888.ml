
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
(18,6)-(27,42)
(18,9)-(18,10)
(18,9)-(18,15)
(18,13)-(18,15)
(20,8)-(27,42)
(23,11)-(27,41)
(23,28)-(23,29)
(24,12)-(27,40)
(25,12)-(27,40)
(26,12)-(27,40)
(29,25)-(29,27)
(29,28)-(29,29)
(29,30)-(29,50)
(31,2)-(31,12)
(31,13)-(31,34)
(31,14)-(31,17)
(31,18)-(31,33)
(31,19)-(31,26)
(31,27)-(31,29)
(31,30)-(31,32)
*)

(* type error slice
(16,4)-(30,51)
(16,10)-(27,42)
(16,12)-(27,42)
(18,6)-(27,42)
(18,6)-(27,42)
(18,6)-(27,42)
(18,9)-(18,10)
(18,9)-(18,15)
(18,9)-(18,15)
(18,13)-(18,15)
(20,8)-(27,42)
(21,14)-(21,29)
(23,11)-(27,41)
(23,28)-(23,29)
(29,4)-(30,51)
(29,15)-(29,23)
(29,15)-(29,51)
(29,24)-(29,51)
(29,28)-(29,29)
(29,30)-(29,50)
(29,31)-(29,43)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,40)-(30,44)
*)
