
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
    let f a x = let (x1,x2) = x in (x1, x2) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
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
(22,36)-(22,38)
(23,4)-(25,51)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
*)

(* type error slice
(3,45)-(3,46)
(3,45)-(3,67)
(3,45)-(3,67)
(3,50)-(3,67)
(3,51)-(3,56)
(3,57)-(3,58)
(5,3)-(13,43)
(5,12)-(13,41)
(5,15)-(13,41)
(6,2)-(13,41)
(7,2)-(13,41)
(8,2)-(13,41)
(9,7)-(9,15)
(9,12)-(9,14)
(12,14)-(12,40)
(12,15)-(12,34)
(12,16)-(12,21)
(12,22)-(12,23)
(12,35)-(12,36)
(12,37)-(12,39)
(21,2)-(26,34)
(21,11)-(25,51)
(22,4)-(25,51)
(22,10)-(22,43)
(22,12)-(22,43)
(22,16)-(22,43)
(22,16)-(22,43)
(22,30)-(22,31)
(22,35)-(22,43)
(22,40)-(22,42)
(23,4)-(25,51)
(23,15)-(23,23)
(23,20)-(23,22)
(24,4)-(25,51)
(24,15)-(24,27)
(24,15)-(24,33)
(24,31)-(24,33)
(25,18)-(25,32)
(25,18)-(25,44)
(25,33)-(25,34)
(25,35)-(25,39)
(25,40)-(25,44)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
*)
