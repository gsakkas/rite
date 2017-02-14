
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
(20,6)-(25,15)
(20,20)-(20,21)
(21,6)-(25,15)
(23,10)-(24,67)
(23,21)-(23,42)
(23,34)-(23,36)
(24,10)-(24,67)
(24,34)-(24,36)
(24,48)-(24,62)
(24,48)-(24,67)
(24,50)-(24,54)
(24,56)-(24,60)
(24,66)-(24,67)
(25,14)-(25,15)
(26,4)-(28,51)
(26,15)-(26,23)
(26,16)-(26,22)
(26,17)-(26,18)
(26,20)-(26,21)
(27,4)-(28,51)
(27,15)-(27,44)
(28,4)-(28,51)
*)

(* type error slice
(19,4)-(28,51)
(19,10)-(25,15)
(19,12)-(25,15)
(20,6)-(25,15)
(20,6)-(25,15)
(20,20)-(20,21)
(21,6)-(25,15)
(21,6)-(25,15)
(23,10)-(24,67)
(24,10)-(24,67)
(24,48)-(24,67)
(24,48)-(24,67)
(24,66)-(24,67)
(25,14)-(25,15)
(28,18)-(28,32)
(28,18)-(28,44)
(28,33)-(28,34)
*)
