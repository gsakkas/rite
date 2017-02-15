
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
(14,6)-(15,71)
(15,37)-(15,51)
(15,37)-(15,71)
(15,39)-(15,40)
(15,48)-(15,50)
(15,55)-(15,71)
(15,56)-(15,63)
(15,57)-(15,58)
(15,61)-(15,62)
(15,68)-(15,70)
(16,4)-(21,51)
(16,15)-(16,21)
(16,16)-(16,17)
(16,19)-(16,20)
(17,4)-(21,51)
(18,6)-(20,41)
(19,22)-(19,51)
(19,23)-(19,31)
(19,32)-(19,47)
(19,43)-(19,46)
(19,44)-(19,45)
(19,48)-(19,50)
(20,11)-(20,40)
(20,12)-(20,20)
(20,21)-(20,36)
(20,32)-(20,35)
(20,33)-(20,34)
(20,37)-(20,39)
(21,4)-(21,51)
(21,18)-(21,44)
(22,14)-(22,17)
*)

(* type error slice
(13,4)-(21,51)
(13,10)-(15,71)
(13,12)-(15,71)
(14,6)-(15,71)
(14,6)-(15,71)
(14,12)-(14,18)
(14,13)-(14,14)
(15,37)-(15,71)
(15,37)-(15,71)
(15,55)-(15,71)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
*)
