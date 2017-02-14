
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
      let v = (x1 + x2) + c in ((a1 @ [c + 1]), (a2 @ [c + 1])) in
    let base = ([9], [5]) in
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
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(20,9)-(20,66)
(23,3)-(32,33)
(24,5)-(31,60)
(25,7)-(28,62)
(26,7)-(28,62)
(27,7)-(28,62)
(27,19)-(27,21)
(28,7)-(28,62)
(28,34)-(28,36)
(28,34)-(28,46)
(28,40)-(28,41)
(28,40)-(28,45)
(28,44)-(28,45)
(28,50)-(28,52)
(28,50)-(28,62)
(28,56)-(28,57)
(28,56)-(28,61)
(28,60)-(28,61)
(29,5)-(31,60)
(29,17)-(29,20)
(29,17)-(29,25)
(29,18)-(29,19)
(29,23)-(29,24)
(30,5)-(31,60)
(30,16)-(30,34)
(31,5)-(31,60)
(31,52)-(31,55)
(31,52)-(31,60)
*)

(* type error slice
(20,9)-(20,66)
(20,9)-(20,66)
(20,45)-(20,55)
(20,45)-(20,57)
(20,56)-(20,57)
(23,3)-(32,33)
(23,12)-(31,60)
(24,5)-(31,60)
(29,5)-(31,60)
(30,5)-(31,60)
(31,5)-(31,60)
(31,52)-(31,60)
(32,3)-(32,13)
(32,3)-(32,33)
(32,15)-(32,18)
(32,15)-(32,33)
*)
