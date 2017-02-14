
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> [x] @ (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (b::b',c::c') = x in ((b + c), (b + c)) @ a in
    let base = ([], []) in
    let args = padZero l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = let (x1,x2) = x in ([x1 + x2], [x2]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(3,46)-(3,49)
(3,46)-(3,67)
(3,50)-(3,51)
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(20,9)-(20,66)
(23,3)-(28,33)
(24,5)-(27,52)
(24,17)-(24,64)
(24,44)-(24,45)
(24,44)-(24,49)
(24,44)-(24,64)
(24,48)-(24,49)
(24,53)-(24,54)
(24,57)-(24,58)
(24,61)-(24,62)
(24,63)-(24,64)
(25,5)-(27,52)
(25,17)-(25,23)
(26,5)-(27,52)
(26,16)-(26,23)
(27,5)-(27,52)
*)

(* type error slice
(7,4)-(15,44)
(7,13)-(15,41)
(7,16)-(15,41)
(8,3)-(15,41)
(9,3)-(15,41)
(10,3)-(15,41)
(11,9)-(11,15)
(24,44)-(24,58)
(24,44)-(24,64)
(24,61)-(24,62)
(26,5)-(27,52)
(26,16)-(26,23)
(26,16)-(26,29)
(27,19)-(27,33)
(27,19)-(27,45)
(27,41)-(27,45)
*)
