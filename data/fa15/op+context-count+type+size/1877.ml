
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
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(17,11)-(27,21)
(18,2)-(27,21)
(19,4)-(26,60)
(20,6)-(23,66)
(21,6)-(23,66)
(22,6)-(23,66)
(22,18)-(22,20)
(23,6)-(23,66)
(23,26)-(23,28)
(23,33)-(23,53)
(23,35)-(23,36)
(23,35)-(23,40)
(23,39)-(23,40)
(23,44)-(23,52)
(23,55)-(23,65)
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
(22,6)-(23,66)
(22,6)-(23,66)
(23,14)-(23,28)
(23,26)-(23,28)
*)
