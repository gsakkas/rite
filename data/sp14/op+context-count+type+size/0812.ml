
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
(15,7)-(20,74)
(16,16)-(16,17)
(16,16)-(16,59)
(16,20)-(16,59)
(16,23)-(16,28)
(16,23)-(16,32)
(16,31)-(16,32)
(16,38)-(16,43)
(16,38)-(16,50)
(16,47)-(16,50)
(16,56)-(16,59)
(18,11)-(20,74)
(18,27)-(18,28)
(19,11)-(20,74)
(21,5)-(23,52)
(22,5)-(23,52)
(23,5)-(23,52)
*)

(* type error slice
(13,5)-(23,52)
(13,11)-(20,74)
(13,13)-(20,74)
(15,7)-(20,74)
(15,7)-(20,74)
(15,13)-(15,14)
(22,5)-(23,52)
(22,16)-(22,28)
(22,16)-(22,34)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,41)-(23,45)
*)
