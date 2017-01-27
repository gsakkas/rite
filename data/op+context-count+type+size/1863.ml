
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (a1,a2) = a in
      match x with
      | (x1,x2)::t ->
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in [(tens, ones)] :: a
      | [] -> a in
    let base = [(0, 0)] in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let x1 = List.length l1 in
  let x2 = List.length l2 in
  if x1 < x2
  then (((clone 0 (x2 - x1)) @ l1), l2)
  else (l1, ((clone 0 (x1 - x2)) @ l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::[] -> if h <> 0 then l else []
  | h::t -> if h <> 0 then l else removeZero t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      let h::_ = a1 in
      let tens = (x1 + x2) + (h / 10) in
      let ones = (x1 + x2) + (h mod 10) in ((tens :: a1), (ones :: a2)) in
    let base = ([], []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,21)-(20,22)
(21,7)-(25,16)
(23,23)-(23,42)
(23,35)-(23,37)
(24,35)-(24,37)
(24,49)-(24,63)
(24,49)-(24,68)
(24,51)-(24,55)
(24,57)-(24,61)
(24,67)-(24,68)
(25,15)-(25,16)
(26,16)-(26,24)
(26,18)-(26,19)
(26,21)-(26,22)
(27,5)-(28,52)
*)

(* type error slice
(19,5)-(28,52)
(19,11)-(25,16)
(19,13)-(25,16)
(20,7)-(25,16)
(20,21)-(20,22)
(21,7)-(25,16)
(21,13)-(21,14)
(23,11)-(24,68)
(23,23)-(23,42)
(24,11)-(24,68)
(24,23)-(24,44)
(24,49)-(24,63)
(24,49)-(24,68)
(24,51)-(24,55)
(24,51)-(24,61)
(24,57)-(24,61)
(24,67)-(24,68)
(25,15)-(25,16)
(26,5)-(28,52)
(26,16)-(26,24)
(26,18)-(26,19)
(26,18)-(26,22)
(26,21)-(26,22)
(27,5)-(28,52)
(27,16)-(27,24)
(27,16)-(27,44)
(27,26)-(27,38)
(27,26)-(27,44)
(27,39)-(27,41)
(27,42)-(27,44)
(28,19)-(28,33)
(28,19)-(28,45)
(28,34)-(28,35)
(28,36)-(28,40)
(28,41)-(28,45)
*)
