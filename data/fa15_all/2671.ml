
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
(25,33)-(25,47)
mulByDigit (i - 1) l
AppG (fromList [VarG,BopG EmptyG EmptyG])

(25,45)-(25,46)
i - 1
BopG VarG LitG

*)
