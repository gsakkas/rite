
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | ([],[]) ->
          let (carry,num) = x in
          (0, (if carry > 0 then carry :: num else num))
      | (l1,l2) ->
          (match x with
           | (carry,num) ->
               let addit = ((List.hd l1) + (List.hd l2)) + carry in
               ((if addit > 10 then addit mod 10 else 0), ((addit / 10) ::
                 x))) in
    let base = (0, 0) in
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
(14,7)-(23,19)
(17,12)-(17,13)
(17,12)-(17,55)
(17,16)-(17,55)
(17,19)-(17,24)
(17,19)-(17,28)
(17,27)-(17,28)
(17,34)-(17,39)
(17,34)-(17,46)
(17,43)-(17,46)
(17,52)-(17,55)
(19,12)-(23,19)
(19,18)-(19,19)
(21,30)-(21,37)
(21,30)-(21,40)
(21,38)-(21,40)
(21,45)-(21,52)
(21,45)-(21,55)
(21,53)-(21,55)
(21,60)-(21,65)
(23,18)-(23,19)
(24,20)-(24,21)
(27,3)-(27,33)
*)

(* type error slice
(13,5)-(26,52)
(13,11)-(23,19)
(13,13)-(23,19)
(14,7)-(23,19)
(14,13)-(14,14)
(16,11)-(17,55)
(16,29)-(16,30)
(17,12)-(17,13)
(17,12)-(17,55)
(17,16)-(17,55)
(17,34)-(17,46)
(22,61)-(22,71)
(22,61)-(23,19)
(23,18)-(23,19)
(24,5)-(26,52)
(24,17)-(24,18)
(24,17)-(24,21)
(24,20)-(24,21)
(25,5)-(26,52)
(25,16)-(25,28)
(25,16)-(25,34)
(25,29)-(25,31)
(25,32)-(25,34)
(26,19)-(26,33)
(26,19)-(26,45)
(26,34)-(26,35)
(26,36)-(26,40)
(26,41)-(26,45)
*)
