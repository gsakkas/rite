
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
      let (a1,a2) = a in let v = x1 + x2 in ((a1 @ [c + 1]), (a2 @ [c + 1])) in
    let base = ([0], [5]) in
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
(23,2)-(30,34)
(24,4)-(29,60)
(25,6)-(26,76)
(26,6)-(26,76)
(26,25)-(26,76)
(26,33)-(26,35)
(26,44)-(26,76)
(26,45)-(26,59)
(26,46)-(26,48)
(26,52)-(26,53)
(26,52)-(26,57)
(26,56)-(26,57)
(26,61)-(26,75)
(26,62)-(26,64)
(26,68)-(26,69)
(26,68)-(26,73)
(26,72)-(26,73)
(27,4)-(29,60)
(27,15)-(27,25)
(27,16)-(27,19)
(27,22)-(27,23)
(28,4)-(29,60)
(28,15)-(28,33)
(29,4)-(29,60)
(29,50)-(29,60)
(29,51)-(29,54)
*)

(* type error slice
(5,3)-(5,13)
(5,6)-(5,11)
(20,7)-(20,66)
(20,7)-(20,66)
(20,44)-(20,54)
(20,44)-(20,56)
(20,55)-(20,56)
(23,2)-(30,34)
(23,11)-(29,60)
(24,4)-(29,60)
(26,52)-(26,53)
(26,52)-(26,57)
(26,68)-(26,69)
(26,68)-(26,73)
(27,4)-(29,60)
(28,4)-(29,60)
(29,4)-(29,60)
(29,50)-(29,60)
(30,2)-(30,12)
(30,2)-(30,34)
(30,13)-(30,34)
(30,14)-(30,17)
*)
