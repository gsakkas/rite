
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
    if x != 0 then (helper x) - (1 l (bigAdd l accum)) else accum in
  mulByDigit (helper i l accum);;


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
  mulByDigit i (helper i l accum);;

*)

(* changed spans
(34,20)-(34,55)
helper (x - 1) l (bigAdd l
                         accum)
AppG [BopG EmptyG EmptyG,VarG,AppG [EmptyG,EmptyG]]

(35,3)-(35,32)
mulByDigit i (helper i l
                     accum)
AppG [VarG,AppG [EmptyG,EmptyG,EmptyG]]

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
(33,3)-(35,32)
(33,18)-(34,66)
(33,20)-(34,66)
(34,5)-(34,66)
(34,20)-(34,30)
(34,20)-(34,55)
(34,21)-(34,27)
(34,33)-(34,55)
(34,34)-(34,35)
(34,38)-(34,54)
(34,39)-(34,45)
(34,48)-(34,53)
(34,61)-(34,66)
(35,14)-(35,32)
(35,15)-(35,21)
*)
