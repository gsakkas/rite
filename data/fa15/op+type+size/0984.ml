
let rec helper x = if x = 0 then 1 else 10 * (helper (x - 1));;

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let rec tenEx x y =
  match y with | [] -> [] | h::t -> (tenEx (x + 1) t) @ [(helper x) * h];;

let bigMul l1 l2 =
  let f a x = match x with | [] -> [] | h::t -> bigAdd (mulByDigit h l1) a in
  let base = 0 in
  let args = tenEx 0 l2 in
  let (carry,res) = List.fold_left f base args in [carry] @ res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, ((clone 0 ((List.length l1) - (List.length l2))) @ l2))
  else
    if (List.length l1) < (List.length l2)
    then (((clone 0 ((List.length l2) - (List.length l1))) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (carry,res) = a in
      ((((x1 + x2) + carry) / 10), ((((x1 + x2) + carry) mod 10) :: res)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in [carry] @ res in
  removeZero (add (padZero l1 l2));;

let rec helper l1 l2 =
  match l1 with | [] -> [] | h::t -> (h, l2) :: (helper t l2);;

let rec mulByDigit i l =
  let f a x =
    let carry = i * x in
    match a with
    | h::t -> ((h + carry) / 10) :: ((h + carry) mod 10) :: t
    | _ -> [carry / 10; carry mod 10] in
  let base = [] in removeZero (List.fold_left f base (List.rev l));;

let bigMul l1 l2 =
  let f a x =
    let (x1,x2) = x in
    let (carry,res) = a in
    ((carry @ [0]), (bigAdd ((mulByDigit x1 x2) @ carry) res)) in
  let base = ([], []) in
  let args = List.rev (helper l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(2,19)-(2,61)
(2,22)-(2,23)
(2,22)-(2,27)
(2,26)-(2,27)
(2,33)-(2,34)
(2,40)-(2,42)
(2,40)-(2,61)
(2,45)-(2,61)
(2,46)-(2,52)
(2,53)-(2,60)
(2,54)-(2,55)
(2,58)-(2,59)
(4,14)-(4,65)
(18,2)-(26,34)
(19,4)-(25,65)
(20,6)-(22,73)
(21,6)-(22,73)
(23,4)-(25,65)
(24,4)-(25,65)
(25,4)-(25,65)
(28,19)-(34,66)
(29,2)-(34,66)
(30,4)-(33,37)
(34,2)-(34,66)
(36,14)-(37,72)
(36,16)-(37,72)
(37,2)-(37,72)
(37,8)-(37,9)
(37,23)-(37,25)
(37,36)-(37,53)
(37,36)-(37,72)
(37,37)-(37,42)
(37,43)-(37,50)
(37,44)-(37,45)
(37,48)-(37,49)
(37,51)-(37,52)
(37,54)-(37,55)
(37,56)-(37,72)
(37,57)-(37,67)
(37,57)-(37,71)
(37,58)-(37,64)
(37,65)-(37,66)
(37,70)-(37,71)
(40,2)-(43,63)
(40,14)-(40,74)
(40,35)-(40,37)
(40,48)-(40,54)
(40,48)-(40,74)
(40,56)-(40,66)
(40,67)-(40,68)
(40,69)-(40,71)
(40,73)-(40,74)
(41,2)-(43,63)
(41,13)-(41,14)
(42,2)-(43,63)
(42,13)-(42,18)
(42,13)-(42,23)
(42,19)-(42,20)
(42,21)-(42,23)
(43,2)-(43,63)
(43,50)-(43,63)
*)

(* type error slice
(40,2)-(43,63)
(40,8)-(40,74)
(40,10)-(40,74)
(40,14)-(40,74)
(40,35)-(40,37)
(41,2)-(43,63)
(41,13)-(41,14)
(43,20)-(43,34)
(43,20)-(43,46)
(43,35)-(43,36)
(43,37)-(43,41)
*)

(* all spans
(2,15)-(2,61)
(2,19)-(2,61)
(2,22)-(2,27)
(2,22)-(2,23)
(2,26)-(2,27)
(2,33)-(2,34)
(2,40)-(2,61)
(2,40)-(2,42)
(2,45)-(2,61)
(2,46)-(2,52)
(2,53)-(2,60)
(2,54)-(2,55)
(2,58)-(2,59)
(4,14)-(4,65)
(4,16)-(4,65)
(4,20)-(4,65)
(4,23)-(4,29)
(4,23)-(4,24)
(4,28)-(4,29)
(4,35)-(4,37)
(4,43)-(4,65)
(4,43)-(4,44)
(4,48)-(4,65)
(4,49)-(4,54)
(4,55)-(4,56)
(4,57)-(4,64)
(4,58)-(4,59)
(4,62)-(4,63)
(6,12)-(12,17)
(6,15)-(12,17)
(7,2)-(12,17)
(7,5)-(7,40)
(7,5)-(7,21)
(7,6)-(7,17)
(7,18)-(7,20)
(7,24)-(7,40)
(7,25)-(7,36)
(7,37)-(7,39)
(8,7)-(8,67)
(8,8)-(8,10)
(8,12)-(8,66)
(8,61)-(8,62)
(8,13)-(8,60)
(8,14)-(8,19)
(8,20)-(8,21)
(8,22)-(8,59)
(8,23)-(8,39)
(8,24)-(8,35)
(8,36)-(8,38)
(8,42)-(8,58)
(8,43)-(8,54)
(8,55)-(8,57)
(8,63)-(8,65)
(10,4)-(12,17)
(10,7)-(10,42)
(10,7)-(10,23)
(10,8)-(10,19)
(10,20)-(10,22)
(10,26)-(10,42)
(10,27)-(10,38)
(10,39)-(10,41)
(11,9)-(11,69)
(11,10)-(11,64)
(11,59)-(11,60)
(11,11)-(11,58)
(11,12)-(11,17)
(11,18)-(11,19)
(11,20)-(11,57)
(11,21)-(11,37)
(11,22)-(11,33)
(11,34)-(11,36)
(11,40)-(11,56)
(11,41)-(11,52)
(11,53)-(11,55)
(11,61)-(11,63)
(11,66)-(11,68)
(12,9)-(12,17)
(12,10)-(12,12)
(12,14)-(12,16)
(14,19)-(15,74)
(15,2)-(15,74)
(15,8)-(15,9)
(15,23)-(15,25)
(15,36)-(15,74)
(15,39)-(15,44)
(15,39)-(15,40)
(15,43)-(15,44)
(15,50)-(15,62)
(15,50)-(15,60)
(15,61)-(15,62)
(15,68)-(15,74)
(15,68)-(15,69)
(15,73)-(15,74)
(17,11)-(26,34)
(17,14)-(26,34)
(18,2)-(26,34)
(18,11)-(25,65)
(19,4)-(25,65)
(19,10)-(22,73)
(19,12)-(22,73)
(20,6)-(22,73)
(20,20)-(20,21)
(21,6)-(22,73)
(21,24)-(21,25)
(22,6)-(22,73)
(22,7)-(22,33)
(22,8)-(22,27)
(22,9)-(22,18)
(22,10)-(22,12)
(22,15)-(22,17)
(22,21)-(22,26)
(22,30)-(22,32)
(22,35)-(22,72)
(22,36)-(22,64)
(22,37)-(22,56)
(22,38)-(22,47)
(22,39)-(22,41)
(22,44)-(22,46)
(22,50)-(22,55)
(22,61)-(22,63)
(22,68)-(22,71)
(23,4)-(25,65)
(23,15)-(23,22)
(23,16)-(23,17)
(23,19)-(23,21)
(24,4)-(25,65)
(24,15)-(24,44)
(24,15)-(24,23)
(24,24)-(24,44)
(24,25)-(24,37)
(24,38)-(24,40)
(24,41)-(24,43)
(25,4)-(25,65)
(25,22)-(25,48)
(25,22)-(25,36)
(25,37)-(25,38)
(25,39)-(25,43)
(25,44)-(25,48)
(25,52)-(25,65)
(25,60)-(25,61)
(25,52)-(25,59)
(25,53)-(25,58)
(25,62)-(25,65)
(26,2)-(26,34)
(26,2)-(26,12)
(26,13)-(26,34)
(26,14)-(26,17)
(26,18)-(26,33)
(26,19)-(26,26)
(26,27)-(26,29)
(26,30)-(26,32)
(28,19)-(34,66)
(28,21)-(34,66)
(29,2)-(34,66)
(29,8)-(33,37)
(29,10)-(33,37)
(30,4)-(33,37)
(30,16)-(30,21)
(30,16)-(30,17)
(30,20)-(30,21)
(31,4)-(33,37)
(31,10)-(31,11)
(32,14)-(32,61)
(32,14)-(32,32)
(32,15)-(32,26)
(32,16)-(32,17)
(32,20)-(32,25)
(32,29)-(32,31)
(32,36)-(32,61)
(32,36)-(32,56)
(32,37)-(32,48)
(32,38)-(32,39)
(32,42)-(32,47)
(32,53)-(32,55)
(32,60)-(32,61)
(33,11)-(33,37)
(33,12)-(33,22)
(33,12)-(33,17)
(33,20)-(33,22)
(33,24)-(33,36)
(33,24)-(33,29)
(33,34)-(33,36)
(34,2)-(34,66)
(34,13)-(34,15)
(34,19)-(34,66)
(34,19)-(34,29)
(34,30)-(34,66)
(34,31)-(34,45)
(34,46)-(34,47)
(34,48)-(34,52)
(34,53)-(34,65)
(34,54)-(34,62)
(34,63)-(34,64)
(36,14)-(37,72)
(36,16)-(37,72)
(37,2)-(37,72)
(37,8)-(37,9)
(37,23)-(37,25)
(37,36)-(37,72)
(37,54)-(37,55)
(37,36)-(37,53)
(37,37)-(37,42)
(37,43)-(37,50)
(37,44)-(37,45)
(37,48)-(37,49)
(37,51)-(37,52)
(37,56)-(37,72)
(37,57)-(37,71)
(37,57)-(37,67)
(37,58)-(37,64)
(37,65)-(37,66)
(37,70)-(37,71)
(39,11)-(43,63)
(39,14)-(43,63)
(40,2)-(43,63)
(40,8)-(40,74)
(40,10)-(40,74)
(40,14)-(40,74)
(40,20)-(40,21)
(40,35)-(40,37)
(40,48)-(40,74)
(40,48)-(40,54)
(40,55)-(40,72)
(40,56)-(40,66)
(40,67)-(40,68)
(40,69)-(40,71)
(40,73)-(40,74)
(41,2)-(43,63)
(41,13)-(41,14)
(42,2)-(43,63)
(42,13)-(42,23)
(42,13)-(42,18)
(42,19)-(42,20)
(42,21)-(42,23)
(43,2)-(43,63)
(43,20)-(43,46)
(43,20)-(43,34)
(43,35)-(43,36)
(43,37)-(43,41)
(43,42)-(43,46)
(43,50)-(43,63)
(43,58)-(43,59)
(43,50)-(43,57)
(43,51)-(43,56)
(43,60)-(43,63)
*)
