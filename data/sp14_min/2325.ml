
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
  let f a x = let (q,w) = a in (((+) 1), (mulByDigit x q)) in
  let base = (0, []) in
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
  let f a x = let (q,w) = a in ((q + 1), (mulByDigit x l1)) in
  let base = (0, []) in
  let args = List.rev l2 in let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(38,33)-(38,40)
q + 1
BopG VarG LitG

(38,56)-(38,57)
l1
VarG

*)

(* type error slice
(8,4)-(12,78)
(8,13)-(12,76)
(11,9)-(11,43)
(11,10)-(11,21)
(11,40)-(11,42)
(17,4)-(29,37)
(17,12)-(29,35)
(29,19)-(29,34)
(29,20)-(29,27)
(29,28)-(29,30)
(31,4)-(35,21)
(31,20)-(35,19)
(31,22)-(35,19)
(34,20)-(34,26)
(34,20)-(34,53)
(34,35)-(34,36)
(34,37)-(34,53)
(34,38)-(34,44)
(34,45)-(34,46)
(35,3)-(35,9)
(35,3)-(35,19)
(35,12)-(35,13)
(38,3)-(40,76)
(38,9)-(38,59)
(38,11)-(38,59)
(38,15)-(38,59)
(38,27)-(38,28)
(38,32)-(38,59)
(38,33)-(38,40)
(38,34)-(38,37)
(38,42)-(38,58)
(38,43)-(38,53)
(38,56)-(38,57)
(40,43)-(40,57)
(40,43)-(40,69)
(40,58)-(40,59)
*)
