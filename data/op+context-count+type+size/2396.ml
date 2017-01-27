
let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = (mulByDigit i) - (1 (bigAdd l l));;


(* fix

let l1 = [0; 0; 9; 9];;

let l2 = [1; 0; 0; 2];;

let x = (3, 3) :: (List.rev (List.combine l1 l2));;

let clone x n =
  let rec helper x n acc =
    if n <= 0 then acc else helper x (n - 1) (x :: acc) in
  helper x n [];;

let padZero l1 l2 =
  if (List.length l1) < (List.length l2)
  then ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  else (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with | [] -> [] | x::xs -> if x = 0 then removeZero xs else x :: xs;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (o,p) = a in
      let (d1,d2) = x in
      ((((d1 + d2) + o) / 10), ((((d1 + d2) + o) mod 10) :: p)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = mulByDigit (i - 1) (bigAdd l l);;

*)

(* changed spans
(6,10)-(6,11)
(6,13)-(6,14)
(32,27)-(32,39)
(32,27)-(32,57)
(32,38)-(32,39)
(32,44)-(32,57)
*)

(* type error slice
(8,4)-(11,18)
(8,11)-(11,16)
(8,13)-(11,16)
(9,3)-(11,16)
(10,29)-(10,35)
(10,29)-(10,55)
(10,36)-(10,37)
(10,39)-(10,44)
(10,47)-(10,55)
(11,3)-(11,9)
(11,3)-(11,16)
(11,10)-(11,11)
(11,12)-(11,13)
(11,14)-(11,16)
(13,4)-(16,80)
(13,13)-(16,76)
(13,16)-(16,76)
(14,3)-(16,76)
(14,7)-(14,18)
(14,7)-(14,21)
(14,19)-(14,21)
(14,26)-(14,37)
(14,26)-(14,40)
(14,38)-(14,40)
(15,10)-(15,21)
(15,10)-(15,72)
(15,10)-(15,77)
(15,23)-(15,28)
(15,23)-(15,66)
(15,29)-(15,30)
(15,33)-(15,66)
(15,70)-(15,72)
(15,75)-(15,77)
(19,3)-(19,78)
(19,52)-(19,62)
(19,52)-(19,65)
(19,63)-(19,65)
(21,4)-(30,37)
(21,12)-(30,33)
(21,15)-(30,33)
(22,3)-(30,33)
(22,12)-(29,52)
(23,5)-(29,52)
(23,11)-(26,62)
(23,13)-(26,62)
(24,7)-(26,62)
(24,19)-(24,20)
(25,7)-(26,62)
(25,21)-(25,22)
(26,11)-(26,29)
(26,11)-(26,62)
(26,36)-(26,62)
(27,5)-(29,52)
(27,17)-(27,18)
(27,17)-(27,22)
(27,20)-(27,22)
(28,5)-(29,52)
(28,16)-(28,24)
(28,16)-(28,57)
(28,26)-(28,38)
(28,26)-(28,57)
(28,40)-(28,41)
(28,40)-(28,47)
(28,45)-(28,47)
(28,50)-(28,51)
(28,50)-(28,57)
(28,55)-(28,57)
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
(30,15)-(30,33)
(30,20)-(30,27)
(30,20)-(30,33)
(30,28)-(30,30)
(30,31)-(30,33)
(32,4)-(32,61)
(32,20)-(32,57)
(32,22)-(32,57)
(32,27)-(32,37)
(32,27)-(32,39)
(32,27)-(32,57)
(32,38)-(32,39)
(32,44)-(32,45)
(32,44)-(32,57)
(32,47)-(32,53)
(32,47)-(32,57)
(32,54)-(32,55)
(32,56)-(32,57)
*)
