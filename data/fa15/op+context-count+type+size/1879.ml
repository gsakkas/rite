
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
(15,11)-(27,21)
(16,2)-(27,21)
(17,4)-(26,60)
(18,6)-(23,54)
(19,6)-(23,54)
(20,6)-(23,54)
(20,18)-(20,20)
(21,6)-(23,54)
(21,18)-(21,20)
(22,6)-(23,54)
(22,26)-(22,28)
(23,7)-(23,15)
(23,30)-(23,32)
(23,36)-(23,50)
(23,49)-(23,50)
(24,4)-(26,60)
(24,15)-(24,25)
(24,16)-(24,19)
(24,22)-(24,23)
(25,4)-(26,60)
(25,15)-(25,33)
(26,4)-(26,60)
(26,50)-(26,60)
(26,51)-(26,54)
(27,2)-(27,5)
(27,6)-(27,21)
(27,7)-(27,14)
(27,15)-(27,17)
(27,18)-(27,20)
*)

(* type error slice
(20,6)-(23,54)
(20,6)-(23,54)
(22,14)-(22,28)
(22,26)-(22,28)
*)
