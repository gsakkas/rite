
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
(30,34)-(30,74)
(a1 + 1 , bigAdd a2
                 (appZero a1 (mulByDigit x
                                         l2)))
TupleG (fromList [AppG (fromList [EmptyG]),BopG EmptyG EmptyG])

*)

(* type error slice
(4,4)-(8,60)
(4,13)-(8,58)
(4,16)-(8,58)
(7,41)-(7,51)
(7,46)-(7,47)
(7,48)-(7,50)
(8,42)-(8,52)
(8,47)-(8,48)
(8,49)-(8,51)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,28)-(24,30)
(24,31)-(24,33)
(27,42)-(27,48)
(27,42)-(27,73)
(27,49)-(27,50)
(27,51)-(27,73)
(27,52)-(27,62)
(27,71)-(27,72)
(30,3)-(32,76)
(30,9)-(30,74)
(30,15)-(30,74)
(30,29)-(30,30)
(30,34)-(30,40)
(30,34)-(30,74)
(30,44)-(30,74)
(30,45)-(30,67)
(30,46)-(30,56)
(30,64)-(30,66)
(30,68)-(30,70)
(30,71)-(30,73)
(31,3)-(32,76)
(31,14)-(31,21)
(31,15)-(31,16)
(32,43)-(32,57)
(32,43)-(32,69)
(32,58)-(32,59)
(32,60)-(32,64)
*)
