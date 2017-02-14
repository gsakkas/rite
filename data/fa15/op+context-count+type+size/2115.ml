
let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let c y = y;;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let c::c'::c'' = a1 in
      let s::s' = a2 in
      let v = (x1 + x2) + c' in
      (([c + 1] @ [v / 10]), (s' @ ([s + c'] @ [v mod 10]))) in
    let base = ([0; 0], [5]) in
    let args = List.combine l1 l2 in
    let (duh,res) = List.fold_left f base args in (duh, res) in
  add (padZero l1 l2);;

let rec mulByDigit i l =
  match i with | 0 -> [] | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l);;


(* fix

let rec clone x n =
  if n < 1 then [] else (match n with | _ -> x :: (clone x (n - 1)));;

let padZero l1 l2 =
  let s1 = List.length l1 in
  let s2 = List.length l2 in
  if s1 = s2
  then (l1, l2)
  else
    if s1 > s2
    then (l1, ((clone 0 (s1 - s2)) @ l2))
    else (((clone 0 (s2 - s1)) @ l1), l2);;

let rec removeZero l =
  if l = []
  then []
  else (let h::t = l in match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (c,a1::a2) = a in
      let v = (x1 + x2) + c in ((v / 10), ([v / 10] @ ([v mod 10] @ a2))) in
    let base = (0, [0]) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

let rec mulByDigit i l =
  if i < 1
  then []
  else (match i with | 1 -> l | _ -> bigAdd l (mulByDigit (i - 1) l));;

*)

(* changed spans
(5,7)-(5,12)
(5,11)-(5,12)
(8,3)-(15,41)
(9,3)-(15,41)
(17,12)-(29,21)
(18,3)-(29,21)
(19,5)-(28,60)
(20,7)-(25,58)
(21,7)-(25,58)
(22,7)-(25,58)
(22,24)-(22,26)
(23,7)-(25,58)
(23,19)-(23,21)
(24,7)-(25,58)
(24,27)-(24,29)
(25,9)-(25,27)
(25,10)-(25,11)
(25,10)-(25,15)
(25,14)-(25,15)
(25,19)-(25,27)
(25,31)-(25,33)
(25,37)-(25,58)
(25,38)-(25,39)
(25,38)-(25,44)
(25,42)-(25,44)
(25,46)-(25,47)
(25,48)-(25,58)
(26,5)-(28,60)
(26,17)-(26,23)
(26,21)-(26,22)
(26,26)-(26,27)
(27,16)-(27,34)
(28,5)-(28,60)
(28,52)-(28,55)
(28,52)-(28,60)
(29,3)-(29,6)
(32,3)-(32,72)
(32,9)-(32,10)
(32,23)-(32,25)
(32,33)-(32,34)
(32,64)-(32,65)
(32,68)-(32,69)
*)

(* type error slice
(17,4)-(29,24)
(17,12)-(29,21)
(17,15)-(29,21)
(18,3)-(29,21)
(18,3)-(29,21)
(18,12)-(28,60)
(19,5)-(28,60)
(26,5)-(28,60)
(27,5)-(28,60)
(28,5)-(28,60)
(28,52)-(28,60)
(29,3)-(29,6)
(29,3)-(29,21)
(32,3)-(32,72)
(32,3)-(32,72)
(32,23)-(32,25)
(32,42)-(32,48)
(32,42)-(32,72)
*)
