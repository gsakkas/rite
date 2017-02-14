
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = failwith "to be implemented" in
    let args =
      let combine (a,b) = a + b in
      List.map f (List.rev (List.combine (l1 l2))) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let difference = (List.length l1) - (List.length l2) in
  if difference > 0
  then (l1, ((clone 0 difference) @ l2))
  else
    if difference < 0
    then (((clone 0 ((-1) * difference)) @ l1), l2)
    else (l1, l2);;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | (o,[]) -> (o, [x]) | (o,l) -> (o, (x :: l)) in
    let base = (0, []) in
    let args =
      let combine (a,b) = a + b in
      List.map combine (List.rev (List.combine l1 l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(18,17)-(18,25)
(18,17)-(18,45)
(18,26)-(18,45)
(19,5)-(23,52)
(19,16)-(19,24)
(19,16)-(19,44)
(19,25)-(19,44)
(20,5)-(23,52)
(22,16)-(22,17)
(22,29)-(22,48)
(22,43)-(22,48)
(24,15)-(24,18)
(24,20)-(24,27)
(24,20)-(24,33)
(24,28)-(24,30)
(24,31)-(24,33)
*)

(* type error slice
(20,5)-(23,52)
(21,7)-(22,48)
(22,7)-(22,15)
(22,7)-(22,48)
(22,16)-(22,17)
(22,19)-(22,27)
(22,19)-(22,48)
(22,29)-(22,41)
(22,29)-(22,48)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,41)-(23,45)
*)
