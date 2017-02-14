
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
(20,6)-(26,15)
(22,10)-(25,65)
(23,10)-(25,65)
(23,24)-(23,26)
(24,10)-(25,65)
(24,21)-(24,42)
(24,34)-(24,36)
(25,10)-(25,65)
(25,34)-(25,36)
(25,48)-(25,65)
(25,49)-(25,53)
(25,55)-(25,59)
(25,64)-(25,65)
(26,14)-(26,15)
(27,4)-(29,51)
(27,15)-(27,23)
(27,16)-(27,22)
(27,17)-(27,18)
(27,20)-(27,21)
(28,4)-(29,51)
(28,15)-(28,44)
(29,4)-(29,51)
*)

(* type error slice
(19,4)-(29,51)
(19,10)-(26,15)
(19,12)-(26,15)
(20,6)-(26,15)
(20,6)-(26,15)
(20,12)-(20,13)
(28,4)-(29,51)
(28,15)-(28,23)
(28,15)-(28,44)
(28,24)-(28,44)
(28,25)-(28,37)
(29,18)-(29,32)
(29,18)-(29,44)
(29,33)-(29,34)
(29,40)-(29,44)
*)
