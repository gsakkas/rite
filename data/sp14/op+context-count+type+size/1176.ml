
let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match (a, x) with
      | ((h::i,j::k),(d::e,f::g)) -> ((f + d) / 10) :: ((h + j) mod 10) in
    let base = (0, 0) in
    let args =
      List.rev
        (List.combine (List.map (fun x  -> [x]) l1)
           (List.map (fun x  -> [x]) l2)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then x :: (clone x (n - 1)) else [];;

let padZero l1 l2 =
  if (List.length l1) > (List.length l2)
  then (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2))
  else ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2);;

let rec removeZero l = match l with | 0::t -> removeZero t | _ -> l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match (a, x) with | ((b,c),(d,e)) -> (b, ((d + e) :: c)) in
    let base = ([], []) in
    let args = List.rev (List.combine [0; 0; 9; 9] [1; 0; 0; 2]) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(14,7)-(15,71)
(15,40)-(15,41)
(15,40)-(15,51)
(15,40)-(15,71)
(15,49)-(15,51)
(15,58)-(15,59)
(15,58)-(15,63)
(15,58)-(15,71)
(15,62)-(15,63)
(15,69)-(15,71)
(16,5)-(21,52)
(16,17)-(16,18)
(16,17)-(16,21)
(16,20)-(16,21)
(17,5)-(21,52)
(18,7)-(20,40)
(19,24)-(19,32)
(19,24)-(19,51)
(19,34)-(19,47)
(19,44)-(19,47)
(19,45)-(19,46)
(19,49)-(19,51)
(20,13)-(20,21)
(20,13)-(20,40)
(20,23)-(20,36)
(20,33)-(20,36)
(20,34)-(20,35)
(20,38)-(20,40)
(21,5)-(21,52)
(21,19)-(21,45)
*)

(* type error slice
(13,5)-(21,52)
(13,11)-(15,71)
(13,13)-(15,71)
(14,7)-(15,71)
(14,7)-(15,71)
(14,14)-(14,15)
(14,14)-(14,18)
(15,40)-(15,71)
(15,40)-(15,71)
(15,58)-(15,71)
(21,19)-(21,33)
(21,19)-(21,45)
(21,34)-(21,35)
*)
