
let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with
    | [] -> (mulByDigit x l2) :: a
    | h::t -> [(bigAdd (mulByDigit x l2) h) / 10; h mod 10] @ t in
  let base = [] in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  match n > 0 with | false  -> [] | true  -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) = (List.length l2) with
  | true  -> (l1, l2)
  | false  ->
      let lendiff = (List.length l1) - (List.length l2) in
      (match lendiff > 0 with
       | true  -> (l1, ((clone 0 lendiff) @ l2))
       | false  -> (((clone 0 (- lendiff)) @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a (x,y) =
      match a with
      | [] -> (x + y) :: a
      | h::t -> [(x + y) + (h / 10); h mod 10] @ t in
    let base = [] in
    let args = List.rev ((0, 0) :: (List.combine l1 l2)) in
    let res = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    match a with
    | [] -> (i * x) :: a
    | h::t -> [(i * x) + (h / 10); h mod 10] @ t in
  let base = [] in
  let args = List.rev (0 :: l) in removeZero (List.fold_left f base args);;

let bigMul l1 l2 =
  let f a x =
    match a with | [] -> mulByDigit x l2 | _ -> bigAdd a (mulByDigit x l2) in
  let base = [] in
  let args = List.rev l1 in let res = List.fold_left f base args in res;;

*)

(* changed spans
(24,27)-(24,28)
(24,30)-(24,31)
(38,5)-(40,64)
(39,14)-(39,35)
(39,34)-(39,35)
(40,15)-(40,60)
(40,17)-(40,43)
(40,17)-(40,49)
(40,25)-(40,40)
(40,42)-(40,43)
(40,47)-(40,49)
(40,51)-(40,52)
(40,51)-(40,59)
(40,57)-(40,59)
(40,61)-(40,62)
(40,63)-(40,64)
*)

(* type error slice
(5,4)-(12,57)
(5,13)-(12,53)
(5,16)-(12,53)
(6,3)-(12,53)
(6,10)-(6,21)
(6,10)-(6,24)
(6,22)-(6,24)
(6,29)-(6,40)
(6,29)-(6,43)
(6,41)-(6,43)
(7,15)-(7,17)
(7,15)-(7,21)
(7,19)-(7,21)
(15,3)-(15,58)
(15,37)-(15,47)
(15,37)-(15,49)
(15,48)-(15,49)
(17,4)-(26,37)
(17,12)-(26,33)
(17,15)-(26,33)
(18,3)-(26,33)
(18,12)-(25,48)
(19,5)-(25,48)
(19,11)-(22,51)
(19,14)-(22,51)
(20,7)-(22,51)
(21,16)-(21,17)
(21,16)-(21,21)
(21,16)-(21,27)
(21,20)-(21,21)
(21,26)-(21,27)
(23,5)-(25,48)
(23,16)-(23,18)
(24,5)-(25,48)
(24,16)-(24,24)
(24,16)-(24,55)
(24,27)-(24,55)
(24,37)-(24,49)
(24,37)-(24,55)
(24,50)-(24,52)
(24,53)-(24,55)
(25,5)-(25,48)
(25,15)-(25,29)
(25,15)-(25,41)
(25,30)-(25,31)
(25,32)-(25,36)
(25,37)-(25,41)
(25,45)-(25,48)
(26,3)-(26,13)
(26,3)-(26,33)
(26,15)-(26,18)
(26,15)-(26,33)
(26,20)-(26,27)
(26,20)-(26,33)
(26,28)-(26,30)
(26,31)-(26,33)
(28,4)-(34,76)
(28,20)-(34,73)
(28,22)-(34,73)
(29,3)-(34,73)
(29,9)-(32,49)
(29,11)-(32,49)
(30,5)-(32,49)
(31,14)-(31,15)
(31,14)-(31,19)
(31,14)-(31,25)
(31,18)-(31,19)
(31,24)-(31,25)
(33,3)-(34,73)
(33,14)-(33,16)
(34,3)-(34,73)
(34,14)-(34,22)
(34,14)-(34,30)
(34,24)-(34,25)
(34,24)-(34,30)
(34,29)-(34,30)
(34,35)-(34,45)
(34,35)-(34,73)
(34,47)-(34,61)
(34,47)-(34,73)
(34,62)-(34,63)
(34,64)-(34,68)
(34,69)-(34,73)
(37,3)-(42,76)
(37,9)-(40,64)
(37,11)-(40,64)
(38,5)-(40,64)
(39,14)-(39,24)
(39,14)-(39,29)
(39,14)-(39,35)
(39,25)-(39,26)
(39,27)-(39,29)
(39,34)-(39,35)
(40,15)-(40,60)
(40,15)-(40,64)
(40,17)-(40,23)
(40,17)-(40,43)
(40,17)-(40,49)
(40,25)-(40,35)
(40,25)-(40,40)
(40,36)-(40,37)
(40,38)-(40,40)
(40,42)-(40,43)
(40,51)-(40,52)
(40,51)-(40,59)
(40,61)-(40,62)
(40,63)-(40,64)
(41,3)-(42,76)
(41,14)-(41,16)
(42,3)-(42,76)
(42,14)-(42,22)
(42,14)-(42,25)
(42,23)-(42,25)
(42,29)-(42,76)
(42,43)-(42,57)
(42,43)-(42,69)
(42,58)-(42,59)
(42,60)-(42,64)
(42,65)-(42,69)
*)
