
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      match x with
      | [] -> (0, (if carry > 0 then carry :: num else num))
      | h::t ->
          let (l1',l2') = h in
          let addit = (l1' + l2') + carry in
          ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then addit mod 10 else 0), ((addit / 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(15,6)-(20,75)
(16,14)-(16,60)
(16,15)-(16,16)
(16,18)-(16,59)
(16,22)-(16,27)
(16,22)-(16,31)
(16,30)-(16,31)
(16,37)-(16,42)
(16,37)-(16,49)
(16,46)-(16,49)
(16,55)-(16,58)
(18,10)-(20,75)
(18,26)-(18,27)
(19,10)-(20,75)
(21,4)-(23,51)
(22,4)-(23,51)
(23,4)-(23,51)
*)

(* type error slice
(13,4)-(23,51)
(13,10)-(20,75)
(13,12)-(20,75)
(15,6)-(20,75)
(15,6)-(20,75)
(15,12)-(15,13)
(22,4)-(23,51)
(22,15)-(22,27)
(22,15)-(22,33)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,40)-(23,44)
*)
