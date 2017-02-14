
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
      let c::c' = a1 in
      ((a1 @ [((x1 + x2) + c') / 10]), (a2 @ [((x1 + x2) + c') mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

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

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c' = a1 in
      match c with
      | 0 -> ((a1 @ [(x1 + x2) / 10]), (a2 @ [(x1 + x2) mod 10]))
      | _ -> ((a1 @ [((x1 + x2) + c) / 10]), (a2 @ [((x1 + x2) + c) mod 10])) in
    let base = ([], []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(5,13)-(13,41)
(6,3)-(13,41)
(7,3)-(13,41)
(18,9)-(18,66)
(21,3)-(30,33)
(22,5)-(29,52)
(23,7)-(26,71)
(24,7)-(26,71)
(25,7)-(26,71)
(26,9)-(26,71)
(26,17)-(26,24)
(26,28)-(26,30)
(26,41)-(26,43)
(26,41)-(26,71)
(26,60)-(26,62)
(27,5)-(29,52)
(27,17)-(27,19)
(27,21)-(27,23)
(28,5)-(29,52)
(28,16)-(28,28)
(28,16)-(28,34)
(28,29)-(28,31)
(28,32)-(28,34)
(29,5)-(29,52)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
(29,36)-(29,40)
(29,41)-(29,45)
(29,49)-(29,52)
(30,3)-(30,13)
(30,3)-(30,33)
(30,15)-(30,18)
(30,20)-(30,27)
(30,20)-(30,33)
(30,28)-(30,30)
(30,31)-(30,33)
*)

(* type error slice
(25,7)-(26,71)
(25,7)-(26,71)
(26,17)-(26,30)
(26,28)-(26,30)
(26,49)-(26,62)
(26,60)-(26,62)
*)
