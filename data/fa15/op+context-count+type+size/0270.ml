
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x = let (a1,a2) = a in bigAdd a2 ((mulByDigit (x l1) 10) ** a1) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let sizDif = (List.length l1) - (List.length l2) in
  if sizDif > 0
  then let pad = clone 0 sizDif in (l1, (pad @ l2))
  else (let pad = clone 0 (- sizDif) in ((pad @ l1), l2));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h == 0 then removeZero t else h :: t;;

let rec appZero x l = if x > 0 then l @ [] else appZero (x - 1) l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      if ((x1 + x2) + a1) >= 10
      then (1, ((((x1 + x2) + a1) - 10) :: a2))
      else (0, (((x1 + x2) + a1) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (carry,res) = List.fold_left f base args in carry :: res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | n -> bigAdd l (mulByDigit (i - 1) l);;

let bigMul l1 l2 =
  let f a x =
    let (a1,a2) = a in ((a1 + 1), (bigAdd a2 (appZero a1 (mulByDigit x l2)))) in
  let base = (0, []) in
  let args = List.rev l1 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(13,11)-(24,34)
(14,2)-(24,34)
(15,4)-(23,64)
(16,6)-(20,40)
(17,6)-(20,40)
(21,4)-(23,64)
(22,4)-(23,64)
(23,4)-(23,64)
(30,2)-(32,75)
(30,14)-(30,73)
(30,33)-(30,73)
(30,44)-(30,66)
(30,56)-(30,62)
(30,59)-(30,61)
(30,63)-(30,65)
(30,67)-(30,69)
(30,70)-(30,72)
(31,2)-(32,75)
(31,13)-(31,20)
(31,14)-(31,15)
(31,17)-(31,19)
(32,2)-(32,75)
(32,13)-(32,21)
(32,13)-(32,24)
(32,22)-(32,24)
(32,28)-(32,75)
(32,42)-(32,56)
(32,42)-(32,68)
(32,57)-(32,58)
(32,59)-(32,63)
(32,64)-(32,68)
(32,72)-(32,75)
*)

(* type error slice
(4,3)-(8,59)
(4,12)-(8,57)
(4,15)-(8,57)
(7,40)-(7,50)
(7,45)-(7,46)
(7,47)-(7,49)
(8,41)-(8,51)
(8,46)-(8,47)
(8,48)-(8,50)
(13,3)-(24,36)
(13,11)-(24,34)
(13,14)-(24,34)
(24,18)-(24,33)
(24,19)-(24,26)
(24,27)-(24,29)
(24,30)-(24,32)
(27,41)-(27,47)
(27,41)-(27,72)
(27,48)-(27,49)
(27,50)-(27,72)
(27,51)-(27,61)
(27,70)-(27,71)
(30,2)-(32,75)
(30,8)-(30,73)
(30,14)-(30,73)
(30,28)-(30,29)
(30,33)-(30,39)
(30,33)-(30,73)
(30,43)-(30,73)
(30,44)-(30,66)
(30,45)-(30,55)
(30,63)-(30,65)
(30,67)-(30,69)
(30,70)-(30,72)
(31,2)-(32,75)
(31,13)-(31,20)
(31,14)-(31,15)
(32,42)-(32,56)
(32,42)-(32,68)
(32,57)-(32,58)
(32,59)-(32,63)
*)
