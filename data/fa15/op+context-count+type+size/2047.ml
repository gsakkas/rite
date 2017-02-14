
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
(3,45)-(3,48)
(3,45)-(3,68)
(3,49)-(3,50)
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(20,7)-(20,66)
(23,2)-(28,34)
(24,4)-(27,51)
(24,16)-(24,63)
(24,41)-(24,63)
(24,42)-(24,49)
(24,43)-(24,44)
(24,47)-(24,48)
(24,52)-(24,53)
(24,56)-(24,57)
(24,60)-(24,61)
(24,62)-(24,63)
(25,4)-(27,51)
(25,15)-(25,23)
(26,4)-(27,51)
(26,15)-(26,22)
(27,4)-(27,51)
*)

(* type error slice
(7,3)-(15,43)
(7,12)-(15,41)
(7,15)-(15,41)
(8,2)-(15,41)
(9,2)-(15,41)
(10,2)-(15,41)
(11,7)-(11,15)
(24,41)-(24,59)
(24,41)-(24,63)
(24,60)-(24,61)
(26,4)-(27,51)
(26,15)-(26,22)
(26,15)-(26,28)
(27,18)-(27,32)
(27,18)-(27,44)
(27,40)-(27,44)
*)
