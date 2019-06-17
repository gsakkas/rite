
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n >= 0
  then (l1, ((clone 0 n) @ l2))
  else (((clone 0 (n * (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accum) = a in
      let (x1,x2) = x in
      let n = (carry + x1) + x2 in ((n / 10), ((n mod 10) :: accum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i = 0 then l else bigAdd l ((mulByDigit i) - (1 l));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let n = (List.length l1) - (List.length l2) in
  if n >= 0
  then (l1, ((clone 0 n) @ l2))
  else (((clone 0 (n * (-1))) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,accum) = a in
      let (x1,x2) = x in
      let n = (carry + x1) + x2 in ((n / 10), ((n mod 10) :: accum)) in
    let base = (0, []) in
    let args = List.rev (List.combine (0 :: l1) (0 :: l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l = if i = 0 then l else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(25,33)-(25,57)
mulByDigit (i - 1) l
AppG [BopG EmptyG EmptyG,VarG]

*)

(* type error slice
(4,4)-(8,43)
(4,13)-(8,41)
(4,16)-(8,41)
(7,13)-(7,31)
(7,26)-(7,27)
(7,28)-(7,30)
(13,4)-(22,37)
(13,12)-(22,35)
(13,15)-(22,35)
(22,19)-(22,34)
(22,20)-(22,27)
(22,31)-(22,33)
(24,4)-(25,59)
(24,20)-(25,57)
(24,22)-(25,57)
(25,24)-(25,30)
(25,24)-(25,57)
(25,33)-(25,57)
(25,34)-(25,48)
(25,35)-(25,45)
(25,51)-(25,56)
(25,52)-(25,53)
*)
