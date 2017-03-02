
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (0, ((sum / 10) :: (0, (sum mod 10)) :: a))
      | (h1,h)::t -> (0, (sum / 10)) :: (0, (h + (sum mod 10))) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | (0,[]) -> ((b / 10), [b mod 10])
      | (y,h::t) -> ((b / 10), ((b mod 10) :: (h + y) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(23,68)
(21,6)-(23,68)
(22,15)-(22,16)
(22,18)-(22,56)
(22,20)-(22,23)
(22,33)-(22,50)
(22,33)-(22,55)
(22,34)-(22,35)
(22,38)-(22,41)
(22,54)-(22,55)
(23,21)-(23,68)
(23,22)-(23,23)
(23,26)-(23,29)
(23,40)-(23,63)
(23,41)-(23,42)
(23,44)-(23,62)
(23,45)-(23,46)
(23,50)-(23,53)
(23,67)-(23,68)
(24,15)-(24,17)
*)

(* type error slice
(22,18)-(22,56)
(22,18)-(22,56)
(22,19)-(22,29)
(22,33)-(22,50)
(22,33)-(22,55)
(22,33)-(22,55)
*)

(* all spans
(2,14)-(3,66)
(2,16)-(3,66)
(3,2)-(3,66)
(3,8)-(3,9)
(3,34)-(3,36)
(3,44)-(3,66)
(3,44)-(3,45)
(3,49)-(3,66)
(3,50)-(3,55)
(3,56)-(3,57)
(3,58)-(3,65)
(3,59)-(3,60)
(3,63)-(3,64)
(5,12)-(10,76)
(5,15)-(10,76)
(6,2)-(10,76)
(6,8)-(6,44)
(6,8)-(6,24)
(6,9)-(6,20)
(6,21)-(6,23)
(6,28)-(6,44)
(6,29)-(6,40)
(6,41)-(6,43)
(8,6)-(8,76)
(8,7)-(8,71)
(8,8)-(8,19)
(8,20)-(8,67)
(8,21)-(8,26)
(8,27)-(8,28)
(8,29)-(8,66)
(8,30)-(8,46)
(8,31)-(8,42)
(8,43)-(8,45)
(8,49)-(8,65)
(8,50)-(8,61)
(8,62)-(8,64)
(8,68)-(8,70)
(8,73)-(8,75)
(10,6)-(10,76)
(10,7)-(10,9)
(10,11)-(10,75)
(10,12)-(10,23)
(10,24)-(10,71)
(10,25)-(10,30)
(10,31)-(10,32)
(10,33)-(10,70)
(10,34)-(10,50)
(10,35)-(10,46)
(10,47)-(10,49)
(10,53)-(10,69)
(10,54)-(10,65)
(10,66)-(10,68)
(10,72)-(10,74)
(12,19)-(15,55)
(13,2)-(15,55)
(13,8)-(13,9)
(14,10)-(14,12)
(15,12)-(15,55)
(15,19)-(15,20)
(15,33)-(15,45)
(15,33)-(15,43)
(15,44)-(15,45)
(15,53)-(15,54)
(17,11)-(27,34)
(17,14)-(27,34)
(18,2)-(27,34)
(18,11)-(26,51)
(19,4)-(26,51)
(19,10)-(23,68)
(19,12)-(23,68)
(20,6)-(23,68)
(20,16)-(20,33)
(20,16)-(20,23)
(20,17)-(20,20)
(20,21)-(20,22)
(20,26)-(20,33)
(20,27)-(20,30)
(20,31)-(20,32)
(21,6)-(23,68)
(21,12)-(21,13)
(22,14)-(22,57)
(22,15)-(22,16)
(22,18)-(22,56)
(22,19)-(22,29)
(22,20)-(22,23)
(22,26)-(22,28)
(22,33)-(22,55)
(22,33)-(22,50)
(22,34)-(22,35)
(22,37)-(22,49)
(22,38)-(22,41)
(22,46)-(22,48)
(22,54)-(22,55)
(23,21)-(23,68)
(23,21)-(23,36)
(23,22)-(23,23)
(23,25)-(23,35)
(23,26)-(23,29)
(23,32)-(23,34)
(23,40)-(23,68)
(23,40)-(23,63)
(23,41)-(23,42)
(23,44)-(23,62)
(23,45)-(23,46)
(23,49)-(23,61)
(23,50)-(23,53)
(23,58)-(23,60)
(23,67)-(23,68)
(24,4)-(26,51)
(24,15)-(24,17)
(25,4)-(26,51)
(25,15)-(25,55)
(25,15)-(25,27)
(25,28)-(25,41)
(25,29)-(25,37)
(25,38)-(25,40)
(25,42)-(25,55)
(25,43)-(25,51)
(25,52)-(25,54)
(26,4)-(26,51)
(26,18)-(26,44)
(26,18)-(26,32)
(26,33)-(26,34)
(26,35)-(26,39)
(26,40)-(26,44)
(26,48)-(26,51)
(27,2)-(27,34)
(27,2)-(27,12)
(27,13)-(27,34)
(27,14)-(27,17)
(27,18)-(27,33)
(27,19)-(27,26)
(27,27)-(27,29)
(27,30)-(27,32)
*)
