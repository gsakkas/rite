
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
      let (c,a2) = a in let v = (x1 + x2) + c in ((c + 1), (a2 @ [c + 1])) in
    let base = (0, [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
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
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(24,7)-(24,73)
(24,25)-(24,73)
(24,52)-(24,53)
(24,52)-(24,57)
(24,56)-(24,57)
(24,61)-(24,63)
(24,61)-(24,73)
(24,67)-(24,68)
(24,67)-(24,72)
(24,71)-(24,72)
(25,5)-(27,60)
(25,17)-(25,23)
(25,21)-(25,22)
(26,5)-(27,60)
(26,16)-(26,34)
(27,5)-(27,60)
(27,52)-(27,55)
(27,52)-(27,60)
(28,15)-(28,18)
(28,20)-(28,27)
(28,20)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
*)

(* type error slice
(18,9)-(18,66)
(18,9)-(18,66)
(18,45)-(18,55)
(18,45)-(18,57)
(18,56)-(18,57)
(21,3)-(28,33)
(21,12)-(27,60)
(22,5)-(27,60)
(25,5)-(27,60)
(26,5)-(27,60)
(27,5)-(27,60)
(27,52)-(27,60)
(28,3)-(28,13)
(28,3)-(28,33)
(28,15)-(28,18)
(28,15)-(28,33)
*)
