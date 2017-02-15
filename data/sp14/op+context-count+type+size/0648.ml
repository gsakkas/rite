
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
(38,31)-(38,45)
(39,2)-(40,75)
*)

(* type error slice
(8,3)-(12,77)
(8,12)-(12,75)
(8,15)-(12,75)
(12,26)-(12,60)
(12,27)-(12,38)
(12,57)-(12,59)
(17,3)-(29,36)
(17,11)-(29,34)
(17,14)-(29,34)
(29,18)-(29,33)
(29,19)-(29,26)
(29,30)-(29,32)
(31,3)-(35,20)
(31,19)-(35,18)
(31,21)-(35,18)
(32,2)-(35,18)
(33,2)-(35,18)
(34,4)-(34,63)
(34,4)-(34,63)
(34,19)-(34,25)
(34,19)-(34,52)
(34,36)-(34,52)
(34,37)-(34,43)
(34,46)-(34,51)
(34,58)-(34,63)
(35,2)-(35,8)
(35,2)-(35,18)
(38,2)-(40,75)
(38,8)-(38,45)
(38,10)-(38,45)
(38,14)-(38,45)
(38,14)-(38,45)
(38,26)-(38,27)
(38,31)-(38,41)
(38,31)-(38,45)
(40,42)-(40,56)
(40,42)-(40,68)
(40,57)-(40,58)
*)
