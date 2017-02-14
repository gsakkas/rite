
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), (s @ [v mod 10])) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;


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
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(17,12)-(28,21)
(18,3)-(28,21)
(19,5)-(27,60)
(20,7)-(24,71)
(21,7)-(24,71)
(22,7)-(24,71)
(22,24)-(22,26)
(23,7)-(24,71)
(23,19)-(23,21)
(24,7)-(24,71)
(24,27)-(24,29)
(24,35)-(24,53)
(24,36)-(24,37)
(24,36)-(24,41)
(24,40)-(24,41)
(24,45)-(24,53)
(24,57)-(24,58)
(25,5)-(27,60)
(25,17)-(25,23)
(25,17)-(25,28)
(25,21)-(25,22)
(25,26)-(25,27)
(26,5)-(27,60)
(26,16)-(26,34)
(27,5)-(27,60)
(27,52)-(27,55)
(27,52)-(27,60)
(28,3)-(28,6)
(28,8)-(28,15)
(28,8)-(28,21)
(28,16)-(28,18)
(28,19)-(28,21)
*)

(* type error slice
(19,5)-(27,60)
(19,11)-(24,71)
(19,13)-(24,71)
(20,7)-(24,71)
(21,7)-(24,71)
(21,7)-(24,71)
(21,21)-(21,22)
(22,7)-(24,71)
(23,7)-(24,71)
(23,7)-(24,71)
(23,7)-(24,71)
(23,19)-(23,21)
(24,7)-(24,71)
(24,35)-(24,71)
(24,57)-(24,58)
(24,57)-(24,71)
(24,59)-(24,60)
(27,21)-(27,35)
(27,21)-(27,47)
(27,36)-(27,37)
*)
