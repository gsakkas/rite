
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
      let c::c' = a1 in
      let v = (x1 + x2) + c' in (([c + 1] @ [v / 10]), [v mod 10]) in
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
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(17,12)-(27,21)
(18,3)-(27,21)
(19,5)-(26,60)
(20,7)-(23,66)
(21,7)-(23,66)
(22,7)-(23,66)
(22,19)-(22,21)
(23,7)-(23,66)
(23,27)-(23,29)
(23,35)-(23,53)
(23,36)-(23,37)
(23,36)-(23,41)
(23,40)-(23,41)
(23,45)-(23,53)
(23,56)-(23,66)
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
(22,7)-(23,66)
(22,7)-(23,66)
(23,16)-(23,29)
(23,27)-(23,29)
*)
