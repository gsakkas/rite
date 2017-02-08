
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
        (List.length acc) =
          ((List.length (List.combine (padZero l1 l2))) - 1)
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
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = (List.length larger)
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
(18,7)-(27,36)
(19,10)-(20,60)
(19,22)-(19,25)
(20,13)-(20,60)
(20,26)-(20,38)
(20,26)-(20,53)
(20,40)-(20,47)
(20,40)-(20,53)
(20,59)-(20,60)
(21,16)-(21,19)
(23,10)-(27,36)
(24,10)-(27,36)
(25,10)-(27,36)
(26,10)-(27,36)
(28,5)-(30,52)
(29,5)-(30,52)
(30,5)-(30,52)
(31,20)-(31,27)
(31,28)-(31,30)
(31,31)-(31,33)
*)

(* type error slice
(4,4)-(9,48)
(4,13)-(9,45)
(4,16)-(9,45)
(5,3)-(9,45)
(6,3)-(9,45)
(7,3)-(9,45)
(8,9)-(8,44)
(20,26)-(20,38)
(20,26)-(20,53)
(20,40)-(20,47)
(20,40)-(20,53)
*)
