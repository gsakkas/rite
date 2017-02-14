
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

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      ([v / 10], ([v / 10] @ (a2 @ [(v mod 10) + s]))) in
    let base = ([0], [5]) in
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
(15,12)-(27,21)
(16,3)-(27,21)
(17,5)-(26,60)
(18,7)-(23,52)
(19,7)-(23,52)
(20,7)-(23,52)
(20,19)-(20,21)
(21,7)-(23,52)
(21,19)-(21,21)
(22,7)-(23,52)
(22,27)-(22,29)
(23,8)-(23,16)
(23,31)-(23,33)
(23,38)-(23,51)
(23,50)-(23,51)
(24,5)-(26,60)
(24,17)-(24,20)
(24,17)-(24,25)
(24,23)-(24,24)
(25,5)-(26,60)
(25,16)-(25,34)
(26,5)-(26,60)
(26,52)-(26,55)
(26,52)-(26,60)
(27,3)-(27,6)
(27,8)-(27,15)
(27,8)-(27,21)
(27,16)-(27,18)
(27,19)-(27,21)
*)

(* type error slice
(20,7)-(23,52)
(20,7)-(23,52)
(22,16)-(22,29)
(22,27)-(22,29)
*)
