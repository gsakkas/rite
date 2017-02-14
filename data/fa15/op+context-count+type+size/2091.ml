
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
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(17,11)-(28,21)
(18,2)-(28,21)
(19,4)-(27,60)
(20,6)-(24,72)
(21,6)-(24,72)
(22,6)-(24,72)
(22,23)-(22,25)
(23,6)-(24,72)
(23,18)-(23,20)
(24,6)-(24,72)
(24,26)-(24,28)
(24,33)-(24,53)
(24,35)-(24,36)
(24,35)-(24,40)
(24,39)-(24,40)
(24,44)-(24,52)
(24,56)-(24,57)
(25,4)-(27,60)
(25,15)-(25,28)
(25,16)-(25,22)
(25,20)-(25,21)
(25,25)-(25,26)
(26,4)-(27,60)
(26,15)-(26,33)
(27,4)-(27,60)
(27,50)-(27,60)
(27,51)-(27,54)
(28,2)-(28,5)
(28,6)-(28,21)
(28,7)-(28,14)
(28,15)-(28,17)
(28,18)-(28,20)
*)

(* type error slice
(19,4)-(27,60)
(19,10)-(24,72)
(19,12)-(24,72)
(20,6)-(24,72)
(21,6)-(24,72)
(21,6)-(24,72)
(21,20)-(21,21)
(22,6)-(24,72)
(23,6)-(24,72)
(23,6)-(24,72)
(23,6)-(24,72)
(23,18)-(23,20)
(24,6)-(24,72)
(24,32)-(24,72)
(24,55)-(24,71)
(24,56)-(24,57)
(24,58)-(24,59)
(27,20)-(27,34)
(27,20)-(27,46)
(27,35)-(27,36)
*)
