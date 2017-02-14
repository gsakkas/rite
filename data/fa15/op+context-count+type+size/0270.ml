
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
(13,12)-(24,33)
(14,3)-(24,33)
(15,5)-(23,65)
(16,7)-(20,39)
(17,7)-(20,39)
(21,5)-(23,65)
(22,5)-(23,65)
(23,5)-(23,65)
(30,3)-(32,76)
(30,15)-(30,73)
(30,34)-(30,73)
(30,46)-(30,66)
(30,58)-(30,62)
(30,60)-(30,62)
(30,64)-(30,66)
(30,68)-(30,70)
(30,71)-(30,73)
(31,3)-(32,76)
(31,15)-(31,16)
(31,15)-(31,20)
(31,18)-(31,20)
(32,3)-(32,76)
(32,14)-(32,22)
(32,14)-(32,25)
(32,23)-(32,25)
(32,29)-(32,76)
(32,43)-(32,57)
(32,43)-(32,69)
(32,58)-(32,59)
(32,60)-(32,64)
(32,65)-(32,69)
(32,73)-(32,76)
*)

(* type error slice
(4,4)-(8,60)
(4,13)-(8,56)
(4,16)-(8,56)
(7,42)-(7,50)
(7,46)-(7,47)
(7,48)-(7,50)
(8,43)-(8,51)
(8,47)-(8,48)
(8,49)-(8,51)
(13,4)-(24,37)
(13,12)-(24,33)
(13,15)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
(27,42)-(27,48)
(27,42)-(27,72)
(27,49)-(27,50)
(27,52)-(27,62)
(27,52)-(27,72)
(27,71)-(27,72)
(30,3)-(32,76)
(30,9)-(30,73)
(30,15)-(30,73)
(30,29)-(30,30)
(30,34)-(30,40)
(30,34)-(30,73)
(30,46)-(30,56)
(30,46)-(30,66)
(30,46)-(30,73)
(30,64)-(30,66)
(30,68)-(30,70)
(30,71)-(30,73)
(31,3)-(32,76)
(31,15)-(31,16)
(31,15)-(31,20)
(32,43)-(32,57)
(32,43)-(32,69)
(32,58)-(32,59)
(32,60)-(32,64)
*)
