
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
(24,6)-(24,74)
(24,24)-(24,74)
(24,50)-(24,57)
(24,51)-(24,52)
(24,55)-(24,56)
(24,59)-(24,73)
(24,60)-(24,62)
(24,66)-(24,67)
(24,66)-(24,71)
(24,70)-(24,71)
(25,4)-(27,60)
(25,15)-(25,23)
(25,20)-(25,21)
(26,4)-(27,60)
(26,15)-(26,33)
(27,4)-(27,60)
(27,50)-(27,60)
(27,51)-(27,54)
(28,14)-(28,17)
(28,18)-(28,33)
(28,19)-(28,26)
(28,27)-(28,29)
(28,30)-(28,32)
*)

(* type error slice
(18,7)-(18,66)
(18,7)-(18,66)
(18,44)-(18,54)
(18,44)-(18,56)
(18,55)-(18,56)
(21,2)-(28,34)
(21,11)-(27,60)
(22,4)-(27,60)
(25,4)-(27,60)
(26,4)-(27,60)
(27,4)-(27,60)
(27,50)-(27,60)
(28,2)-(28,12)
(28,2)-(28,34)
(28,13)-(28,34)
(28,14)-(28,17)
*)
