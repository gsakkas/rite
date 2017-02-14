
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
(25,35)-(25,47)
(25,35)-(25,55)
(25,46)-(25,47)
(25,52)-(25,55)
*)

(* type error slice
(4,4)-(8,43)
(4,13)-(8,40)
(4,16)-(8,40)
(7,15)-(7,30)
(7,26)-(7,27)
(7,28)-(7,30)
(13,4)-(22,37)
(13,12)-(22,33)
(13,15)-(22,33)
(22,20)-(22,27)
(22,20)-(22,33)
(22,31)-(22,33)
(24,4)-(25,59)
(24,20)-(25,55)
(24,22)-(25,55)
(25,24)-(25,30)
(25,24)-(25,55)
(25,35)-(25,45)
(25,35)-(25,47)
(25,35)-(25,55)
(25,35)-(25,55)
(25,52)-(25,53)
(25,52)-(25,55)
*)
