
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
    let f a x =
      let (x1,x2) = x in
      let a1::a2 = a in
      let (c,ax) = a1 in ([((x1 + x2) + c) / 10], [((x1 + x2) + c) mod 10]) in
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
    let f a x = let (x1,x2) = x in ([(x1 + x2) / 10], [(x1 + x2) mod 10]) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,7)-(25,75)
(24,7)-(25,75)
(24,20)-(24,21)
(25,7)-(25,75)
(25,20)-(25,22)
(25,30)-(25,37)
(25,41)-(25,42)
(25,54)-(25,61)
(25,65)-(25,66)
(26,5)-(28,52)
(27,5)-(28,52)
(28,5)-(28,52)
*)

(* type error slice
(22,5)-(28,52)
(22,11)-(25,75)
(22,13)-(25,75)
(23,7)-(25,75)
(24,7)-(25,75)
(24,7)-(25,75)
(24,7)-(25,75)
(24,20)-(24,21)
(25,7)-(25,75)
(25,27)-(25,75)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
*)
