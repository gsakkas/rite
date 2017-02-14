
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = failwith "to be implemented" in
    let base = [] in
    let args = List.combine (padZero l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec padZero l1 l2 =
  let diff = (List.length l1) - (List.length l2) in
  match diff with
  | diff when diff > 0 -> (l1, (List.append (clone 0 diff) l2))
  | diff when diff < 0 -> ((List.append (clone 0 (0 - diff)) l1), l2)
  | 0 -> (l1, l2)
  | _ -> ([], []);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (x1,x2) = x in
      let (a1,a2) = a in
      (((x1 + x2) / 10), ((((a1 + x1) + x2) mod 10) :: a2)) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(17,17)-(17,25)
(17,17)-(17,45)
(17,26)-(17,45)
(18,5)-(20,52)
(18,16)-(18,18)
(19,5)-(20,52)
(19,16)-(19,28)
(19,30)-(19,37)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,34)-(20,35)
(20,36)-(20,40)
(20,41)-(20,45)
(20,49)-(20,52)
(21,3)-(21,13)
(21,3)-(21,33)
(21,15)-(21,18)
(21,20)-(21,27)
(21,20)-(21,33)
(21,28)-(21,30)
(21,31)-(21,33)
*)

(* type error slice
(4,4)-(10,20)
(4,17)-(10,17)
(4,20)-(10,17)
(5,3)-(10,17)
(6,3)-(10,17)
(7,28)-(7,62)
(18,5)-(20,52)
(18,16)-(18,18)
(19,16)-(19,28)
(19,16)-(19,43)
(19,30)-(19,37)
(19,30)-(19,43)
(20,5)-(20,52)
(20,19)-(20,33)
(20,19)-(20,45)
(20,36)-(20,40)
*)
