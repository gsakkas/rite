
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
      match x with
      | (x1,x2)::t ->
          let ha::_ = a in
          let (a1,a2) = ha in
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in a @ [(tens, ones)]
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
(20,7)-(26,16)
(23,25)-(23,27)
(24,35)-(24,37)
(25,35)-(25,37)
(25,49)-(25,50)
(25,49)-(25,67)
(25,51)-(25,52)
(25,53)-(25,67)
(25,55)-(25,59)
(25,61)-(25,65)
(26,15)-(26,16)
(27,16)-(27,24)
(27,18)-(27,19)
(27,21)-(27,22)
(28,5)-(29,52)
*)

(* type error slice
(19,5)-(29,52)
(19,11)-(26,16)
(19,13)-(26,16)
(20,7)-(26,16)
(20,13)-(20,14)
(22,11)-(25,67)
(22,23)-(22,24)
(23,11)-(25,67)
(24,11)-(25,67)
(24,23)-(24,42)
(25,11)-(25,67)
(25,23)-(25,44)
(25,49)-(25,50)
(25,49)-(25,67)
(25,51)-(25,52)
(25,53)-(25,67)
(25,55)-(25,59)
(25,55)-(25,65)
(25,61)-(25,65)
(27,5)-(29,52)
(27,16)-(27,24)
(27,18)-(27,19)
(27,18)-(27,22)
(27,21)-(27,22)
(28,5)-(29,52)
(28,16)-(28,24)
(28,16)-(28,44)
(28,26)-(28,38)
(28,26)-(28,44)
(28,39)-(28,41)
(28,42)-(28,44)
(29,19)-(29,33)
(29,19)-(29,45)
(29,34)-(29,35)
(29,36)-(29,40)
(29,41)-(29,45)
*)
