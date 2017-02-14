
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
(20,6)-(27,15)
(22,10)-(26,65)
(22,24)-(22,25)
(23,10)-(26,65)
(24,10)-(26,65)
(24,24)-(24,26)
(25,10)-(26,65)
(25,21)-(25,42)
(25,34)-(25,36)
(26,10)-(26,65)
(26,34)-(26,36)
(26,48)-(26,65)
(26,49)-(26,53)
(26,55)-(26,59)
(26,64)-(26,65)
(27,14)-(27,15)
(28,4)-(30,51)
(28,15)-(28,23)
(28,16)-(28,22)
(28,17)-(28,18)
(28,20)-(28,21)
(29,4)-(30,51)
(29,15)-(29,44)
(30,4)-(30,51)
*)

(* type error slice
(19,4)-(30,51)
(19,10)-(27,15)
(19,12)-(27,15)
(20,6)-(27,15)
(20,6)-(27,15)
(20,12)-(20,13)
(29,4)-(30,51)
(29,15)-(29,23)
(29,15)-(29,44)
(29,24)-(29,44)
(29,25)-(29,37)
(30,18)-(30,32)
(30,18)-(30,44)
(30,33)-(30,34)
(30,40)-(30,44)
*)
