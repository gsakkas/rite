
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
    let (l1p,l2p) = padZero l1 l2 in
    let args = List.combine l1p l2p in
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
(17,16)-(17,24)
(17,16)-(17,44)
(17,25)-(17,44)
(18,4)-(21,51)
(18,15)-(18,17)
(19,4)-(21,51)
(19,20)-(19,27)
(19,20)-(19,33)
(19,28)-(19,30)
(19,31)-(19,33)
(20,4)-(21,51)
(20,15)-(20,27)
(20,15)-(20,35)
(20,28)-(20,31)
(20,32)-(20,35)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,33)-(21,34)
(21,35)-(21,39)
(21,40)-(21,44)
(21,48)-(21,51)
(22,2)-(22,12)
(22,2)-(22,34)
(22,14)-(22,17)
(22,19)-(22,26)
*)

(* type error slice
(18,4)-(21,51)
(18,15)-(18,17)
(21,4)-(21,51)
(21,18)-(21,32)
(21,18)-(21,44)
(21,35)-(21,39)
*)
