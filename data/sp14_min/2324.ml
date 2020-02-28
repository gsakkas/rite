
let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  helper i l accum;;

let bigMul l1 l2 =
  let f a x = let (q,w) = a in mulByDigit x q in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;


(* fix

let rec clone x n =
  let accum = [] in
  let rec helper accum n =
    if n < 1 then accum else helper (x :: accum) (n - 1) in
  helper accum n;;

let padZero l1 l2 =
  let (a,b) = ((List.length l1), (List.length l2)) in
  if a < b
  then ((List.append (clone 0 (b - a)) l1), l2)
  else if b < a then (l1, (List.append (clone 0 (a - b)) l2)) else (l1, l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (h::t,b) = a in
      if (x + h) > 9
      then
        (if t = []
         then ([], (1 :: ((x + h) - 10) :: b))
         else (let h2::t2 = t in (((h2 + 1) :: t2), (((x + h) - 10) :: b))))
      else (t, ((x + h) :: b)) in
    let base = ((List.rev l1), []) in
    let args = List.rev l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  let accum = [] in
  let rec helper x l accum =
    if x != 0 then helper (x - 1) l (bigAdd l accum) else accum in
  helper i l accum;;

let bigMul l1 l2 =
  let f a x = let (q,w) = a in ((mulByDigit x q), []) in
  let base = (l1, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(38,32)-(38,46)
(mulByDigit x q , [])
TupleG [AppG [EmptyG,EmptyG],ListG []]

*)

(* type error slice
(8,4)-(12,78)
(8,13)-(12,76)
(8,16)-(12,76)
(12,27)-(12,61)
(12,28)-(12,39)
(12,58)-(12,60)
(17,4)-(29,37)
(17,12)-(29,35)
(17,15)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,31)-(29,33)
(31,4)-(35,21)
(31,20)-(35,19)
(31,22)-(35,19)
(32,3)-(35,19)
(33,3)-(35,19)
(34,5)-(34,64)
(34,20)-(34,26)
(34,20)-(34,53)
(34,37)-(34,53)
(34,38)-(34,44)
(34,47)-(34,52)
(34,59)-(34,64)
(35,3)-(35,9)
(35,3)-(35,19)
(38,3)-(40,76)
(38,9)-(38,46)
(38,11)-(38,46)
(38,15)-(38,46)
(38,27)-(38,28)
(38,32)-(38,42)
(38,32)-(38,46)
(40,43)-(40,57)
(40,43)-(40,69)
(40,58)-(40,59)
*)
