
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
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 1 -> l | _ -> bigAdd ((mulByDigit i) - 1) l;;


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
      let (el1,el2) = x in
      let new_sum = (rem + el1) + el2 in
      let new_rem = if new_sum > 9 then 1 else 0 in
      let norm_sum = if new_sum > 9 then new_sum - 10 else new_sum in
      let larger = if (List.length l1) > (List.length l2) then l1 else l2 in
      if (List.length acc) = ((List.length larger) - 1)
      then
        (if rem = 1
         then (0, ([1; norm_sum] @ acc))
         else (0, (norm_sum :: acc)))
      else (new_rem, (norm_sum :: acc)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 1 -> l | _ -> bigAdd (mulByDigit (i - 1) l) l;;

*)

(* changed spans
(35,41)-(35,53)
(35,41)-(35,58)
(35,52)-(35,53)
*)

(* type error slice
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(2,59)-(2,64)
(4,4)-(9,48)
(4,13)-(9,45)
(4,16)-(9,45)
(5,3)-(9,45)
(5,15)-(5,26)
(5,15)-(5,29)
(5,27)-(5,29)
(6,3)-(9,45)
(6,15)-(6,26)
(6,15)-(6,29)
(6,27)-(6,29)
(7,3)-(9,45)
(8,9)-(8,11)
(8,9)-(8,44)
(8,15)-(8,20)
(8,15)-(8,37)
(8,15)-(8,44)
(8,21)-(8,22)
(8,24)-(8,37)
(8,40)-(8,41)
(8,42)-(8,44)
(12,3)-(12,75)
(12,51)-(12,61)
(12,51)-(12,63)
(12,62)-(12,63)
(14,4)-(32,37)
(14,12)-(32,33)
(14,15)-(32,33)
(15,3)-(32,33)
(15,12)-(31,52)
(16,5)-(31,52)
(16,11)-(28,38)
(16,13)-(28,38)
(17,7)-(28,38)
(17,23)-(17,24)
(18,7)-(28,38)
(18,23)-(18,24)
(19,7)-(28,38)
(20,7)-(28,38)
(21,7)-(28,38)
(22,7)-(28,38)
(22,24)-(22,35)
(22,24)-(22,38)
(22,36)-(22,38)
(22,43)-(22,54)
(22,43)-(22,57)
(22,55)-(22,57)
(23,7)-(28,38)
(23,11)-(23,22)
(23,11)-(23,26)
(23,23)-(23,26)
(25,10)-(27,35)
(26,16)-(26,17)
(26,16)-(26,39)
(26,20)-(26,33)
(26,20)-(26,39)
(26,21)-(26,22)
(26,34)-(26,35)
(26,36)-(26,39)
(29,5)-(31,52)
(29,17)-(29,18)
(29,17)-(29,22)
(29,20)-(29,22)
(30,5)-(31,52)
(30,16)-(30,24)
(30,16)-(30,44)
(30,26)-(30,38)
(30,26)-(30,44)
(30,39)-(30,41)
(30,42)-(30,44)
(31,5)-(31,52)
(31,19)-(31,33)
(31,19)-(31,45)
(31,34)-(31,35)
(31,36)-(31,40)
(31,41)-(31,45)
(31,49)-(31,52)
(32,3)-(32,13)
(32,3)-(32,33)
(32,15)-(32,18)
(32,15)-(32,33)
(32,20)-(32,27)
(32,20)-(32,33)
(32,28)-(32,30)
(32,31)-(32,33)
(34,4)-(35,63)
(34,20)-(35,61)
(34,22)-(35,61)
(35,3)-(35,61)
(35,9)-(35,10)
(35,23)-(35,24)
(35,32)-(35,38)
(35,32)-(35,61)
(35,41)-(35,51)
(35,41)-(35,53)
(35,41)-(35,58)
(35,52)-(35,53)
(35,60)-(35,61)
*)
