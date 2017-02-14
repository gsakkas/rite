
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
          let ones = (x1 + x2) + (a1 mod 10) in a @ [(tens, ones)]
      | [] -> a in
    let base = [(0, 0)] in
    let args = List.rev List.combine l1 l2 in
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
(20,7)-(25,16)
(20,21)-(20,22)
(21,7)-(25,16)
(23,11)-(24,67)
(23,23)-(23,42)
(23,35)-(23,37)
(24,11)-(24,67)
(24,35)-(24,37)
(24,49)-(24,50)
(24,49)-(24,67)
(24,51)-(24,52)
(24,53)-(24,67)
(24,55)-(24,59)
(24,61)-(24,65)
(25,15)-(25,16)
(26,5)-(28,52)
(26,16)-(26,24)
(26,18)-(26,19)
(26,18)-(26,22)
(26,21)-(26,22)
(27,5)-(28,52)
(27,16)-(27,24)
(27,16)-(27,43)
(27,25)-(27,37)
(28,5)-(28,52)
*)

(* type error slice
(20,7)-(25,16)
(20,21)-(20,22)
(24,49)-(24,50)
(24,49)-(24,67)
(24,51)-(24,52)
(27,16)-(27,24)
(27,16)-(27,43)
*)
