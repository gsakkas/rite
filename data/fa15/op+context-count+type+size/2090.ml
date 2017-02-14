
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
(5,6)-(5,11)
(5,10)-(5,11)
(8,2)-(15,41)
(9,2)-(15,41)
(20,7)-(20,66)
(23,2)-(32,34)
(24,4)-(31,60)
(25,6)-(28,63)
(26,6)-(28,63)
(27,6)-(28,63)
(27,18)-(27,20)
(28,6)-(28,63)
(28,32)-(28,46)
(28,33)-(28,35)
(28,39)-(28,40)
(28,39)-(28,44)
(28,43)-(28,44)
(28,48)-(28,62)
(28,49)-(28,51)
(28,55)-(28,56)
(28,55)-(28,60)
(28,59)-(28,60)
(29,4)-(31,60)
(29,15)-(29,25)
(29,16)-(29,19)
(29,17)-(29,18)
(29,22)-(29,23)
(30,4)-(31,60)
(30,15)-(30,33)
(31,4)-(31,60)
(31,50)-(31,60)
(31,51)-(31,54)
*)

(* type error slice
(20,7)-(20,66)
(20,7)-(20,66)
(20,44)-(20,54)
(20,44)-(20,56)
(20,55)-(20,56)
(23,2)-(32,34)
(23,11)-(31,60)
(24,4)-(31,60)
(29,4)-(31,60)
(30,4)-(31,60)
(31,4)-(31,60)
(31,50)-(31,60)
(32,2)-(32,12)
(32,2)-(32,34)
(32,13)-(32,34)
(32,14)-(32,17)
*)
