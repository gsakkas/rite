
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
(5,12)-(13,41)
(6,2)-(13,41)
(7,2)-(13,41)
(18,7)-(18,66)
(21,2)-(30,34)
(22,4)-(29,51)
(23,6)-(26,72)
(24,6)-(26,72)
(25,6)-(26,72)
(26,6)-(26,72)
(26,15)-(26,24)
(26,27)-(26,29)
(26,39)-(26,71)
(26,40)-(26,42)
(26,59)-(26,61)
(27,4)-(29,51)
(27,16)-(27,18)
(27,20)-(27,22)
(28,4)-(29,51)
(28,15)-(28,27)
(28,15)-(28,33)
(28,28)-(28,30)
(28,31)-(28,33)
(29,4)-(29,51)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
(29,35)-(29,39)
(29,40)-(29,44)
(29,48)-(29,51)
(30,2)-(30,12)
(30,2)-(30,34)
(30,14)-(30,17)
(30,18)-(30,33)
(30,19)-(30,26)
(30,27)-(30,29)
(30,30)-(30,32)
*)

(* type error slice
(25,6)-(26,72)
(25,6)-(26,72)
(26,14)-(26,30)
(26,27)-(26,29)
(26,46)-(26,62)
(26,59)-(26,61)
*)
