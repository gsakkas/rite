
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

let rec mulByDigit i l = if i = 0 then 0 else bigAdd l (mulByDigit (i - 1) l);;


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

let rec mulByDigit i l =
  if i = 0 then [0] else bigAdd l (mulByDigit (i - 1) l);;

*)

(* changed spans
(24,40)-(24,41)
[0]
ListG (fromList [LitG])

*)

(* type error slice
(11,3)-(11,69)
(11,9)-(11,10)
(11,36)-(11,69)
(11,50)-(11,60)
(11,50)-(11,62)
(11,68)-(11,69)
(13,4)-(22,37)
(13,12)-(22,35)
(13,15)-(22,35)
(14,3)-(22,35)
(22,3)-(22,13)
(22,3)-(22,35)
(24,26)-(24,78)
(24,40)-(24,41)
(24,47)-(24,53)
(24,47)-(24,78)
*)
