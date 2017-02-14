
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
      let (a1,a2) = a in
      ([((x1 + x2) + a1) / 10], [a :: (((x1 + x2) + a1) mod 10)]) in
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
(23,6)-(25,65)
(24,6)-(25,65)
(24,20)-(24,21)
(25,9)-(25,18)
(25,21)-(25,23)
(25,33)-(25,34)
(25,33)-(25,63)
(25,40)-(25,49)
(25,52)-(25,54)
(26,4)-(28,51)
(27,4)-(28,51)
(28,4)-(28,51)
*)

(* type error slice
(22,4)-(28,51)
(22,10)-(25,65)
(22,12)-(25,65)
(23,6)-(25,65)
(24,6)-(25,65)
(25,6)-(25,65)
(25,32)-(25,64)
(25,32)-(25,64)
(25,33)-(25,34)
(25,33)-(25,63)
(25,33)-(25,63)
(25,33)-(25,63)
(25,38)-(25,63)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)
