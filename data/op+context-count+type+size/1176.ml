
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev ((List.combine 0) :: (l1 0) :: l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((b,c),(d,e)) ->
          ((((d + e) + b) / 10), ((((d + e) + b) mod 10) :: c)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,27)-(18,41)
(18,27)-(18,58)
(18,40)-(18,41)
(18,47)-(18,51)
(18,50)-(18,51)
*)

(* type error slice
(2,41)-(2,46)
(2,41)-(2,55)
(2,47)-(2,48)
(2,50)-(2,55)
(4,4)-(7,80)
(4,13)-(7,77)
(4,16)-(7,77)
(5,3)-(7,77)
(5,7)-(5,18)
(5,7)-(5,21)
(5,19)-(5,21)
(5,26)-(5,37)
(5,26)-(5,40)
(5,38)-(5,40)
(6,9)-(6,11)
(6,9)-(6,76)
(6,14)-(6,25)
(6,14)-(6,76)
(6,27)-(6,32)
(6,27)-(6,70)
(6,33)-(6,34)
(6,37)-(6,70)
(6,74)-(6,76)
(12,3)-(20,33)
(12,12)-(19,52)
(13,5)-(19,52)
(13,11)-(16,62)
(13,13)-(16,62)
(14,7)-(16,62)
(14,14)-(14,15)
(14,14)-(14,18)
(14,17)-(14,18)
(16,15)-(16,16)
(16,15)-(16,20)
(16,15)-(16,25)
(16,15)-(16,31)
(16,15)-(16,62)
(16,19)-(16,20)
(16,24)-(16,25)
(16,38)-(16,56)
(16,38)-(16,62)
(16,61)-(16,62)
(17,5)-(19,52)
(17,17)-(17,18)
(17,17)-(17,22)
(17,20)-(17,22)
(18,5)-(19,52)
(18,16)-(18,24)
(18,16)-(18,58)
(18,27)-(18,39)
(18,27)-(18,41)
(18,27)-(18,58)
(18,40)-(18,41)
(18,47)-(18,49)
(18,47)-(18,51)
(18,47)-(18,58)
(18,50)-(18,51)
(18,56)-(18,58)
(19,5)-(19,52)
(19,19)-(19,33)
(19,19)-(19,45)
(19,34)-(19,35)
(19,36)-(19,40)
(19,41)-(19,45)
(19,49)-(19,52)
(20,15)-(20,18)
(20,15)-(20,33)
(20,20)-(20,27)
(20,20)-(20,33)
(20,28)-(20,30)
(20,31)-(20,33)
*)
