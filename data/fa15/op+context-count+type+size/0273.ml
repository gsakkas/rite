
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
  let f a x = bigAdd [a] x in
  let base = 0 in let args = List.rev l in List.fold_left f base args;;


(* fix

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

let rec mulByDigit i l = if i > 0 then mulByDigit (i - 1) (bigAdd l l) else l;;

*)

(* changed spans
(27,3)-(28,70)
(27,9)-(27,27)
(27,11)-(27,27)
(27,15)-(27,21)
(27,15)-(27,27)
(27,22)-(27,25)
(27,23)-(27,24)
(27,26)-(27,27)
(28,3)-(28,70)
(28,14)-(28,15)
(28,19)-(28,70)
(28,30)-(28,38)
(28,30)-(28,40)
(28,44)-(28,70)
*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,64)
(2,44)-(2,64)
(2,50)-(2,55)
(2,50)-(2,64)
(2,56)-(2,57)
(4,4)-(8,60)
(4,13)-(8,56)
(7,18)-(7,23)
(7,18)-(7,32)
(7,24)-(7,25)
(8,9)-(8,56)
(8,19)-(8,24)
(8,19)-(8,36)
(8,43)-(8,46)
(8,43)-(8,51)
(8,47)-(8,48)
(8,49)-(8,51)
(11,37)-(11,76)
(11,37)-(11,76)
(11,52)-(11,62)
(11,52)-(11,64)
(11,70)-(11,76)
(13,4)-(24,37)
(13,12)-(24,33)
(13,15)-(24,33)
(14,3)-(24,33)
(24,3)-(24,13)
(24,3)-(24,33)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(27,3)-(28,70)
(27,9)-(27,27)
(27,11)-(27,27)
(27,15)-(27,21)
(27,15)-(27,27)
(27,22)-(27,25)
(27,22)-(27,25)
(27,23)-(27,24)
(28,44)-(28,58)
(28,44)-(28,70)
(28,59)-(28,60)
*)
