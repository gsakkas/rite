
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
if i > 0
then mulByDigit (i - 1)
                (bigAdd l l)
else l
IteG (BopG EmptyG EmptyG) (AppG (fromList [EmptyG])) VarG

*)

(* type error slice
(2,44)-(2,45)
(2,44)-(2,66)
(2,49)-(2,66)
(2,50)-(2,55)
(2,56)-(2,57)
(4,4)-(8,60)
(4,13)-(8,58)
(7,18)-(7,23)
(7,18)-(7,32)
(7,24)-(7,25)
(8,8)-(8,58)
(8,19)-(8,24)
(8,19)-(8,37)
(8,42)-(8,52)
(8,43)-(8,46)
(8,47)-(8,48)
(8,49)-(8,51)
(11,37)-(11,76)
(11,52)-(11,62)
(11,52)-(11,64)
(11,70)-(11,76)
(13,4)-(24,37)
(13,12)-(24,35)
(13,15)-(24,35)
(14,3)-(24,35)
(24,3)-(24,13)
(24,3)-(24,35)
(24,19)-(24,34)
(24,20)-(24,27)
(24,28)-(24,30)
(27,3)-(28,70)
(27,9)-(27,27)
(27,11)-(27,27)
(27,15)-(27,21)
(27,15)-(27,27)
(27,22)-(27,25)
(27,23)-(27,24)
(28,44)-(28,58)
(28,44)-(28,70)
(28,59)-(28,60)
*)
