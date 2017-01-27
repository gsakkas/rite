
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
      | h::t ->
          let (x1,x2) = h in
          let ha::_ = a in
          let (a1,a2) = ha in
          let tens = (x1 + x2) + (a1 / 10) in
          let ones = (x1 + x2) + (a1 mod 10) in (tens, ones) :: a
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
(20,7)-(27,16)
(20,13)-(20,14)
(22,25)-(22,26)
(24,25)-(24,27)
(25,35)-(25,37)
(26,35)-(26,37)
(26,50)-(26,54)
(26,50)-(26,66)
(26,56)-(26,60)
(26,65)-(26,66)
(27,15)-(27,16)
(28,16)-(28,24)
(28,18)-(28,19)
(28,21)-(28,22)
(29,5)-(30,52)
*)

(* type error slice
(19,5)-(30,52)
(19,11)-(27,16)
(19,13)-(27,16)
(20,7)-(27,16)
(20,13)-(20,14)
(22,11)-(26,66)
(23,11)-(26,66)
(23,23)-(23,24)
(24,11)-(26,66)
(25,11)-(26,66)
(26,11)-(26,66)
(26,50)-(26,66)
(28,5)-(30,52)
(28,16)-(28,24)
(28,18)-(28,19)
(28,18)-(28,22)
(28,21)-(28,22)
(29,5)-(30,52)
(29,16)-(29,24)
(29,16)-(29,44)
(29,26)-(29,38)
(29,26)-(29,44)
(29,39)-(29,41)
(29,42)-(29,44)
(30,19)-(30,33)
(30,19)-(30,45)
(30,34)-(30,35)
(30,36)-(30,40)
(30,41)-(30,45)
*)
