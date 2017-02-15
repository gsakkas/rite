
let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let t1 = List.tl l1 in
      let t2 = List.tl l2 in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then List.append [x] (clone x (n - 1)) else [];;

let padZero l1 l2 =
  ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1),
    (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let t1 = List.nth l1 (List.length l1) in
      let t2 = List.nth l2 (List.length l2) in
      if (t1 + t2) > 9 then (1, [(t1 + t2) - 10]) else (0, [t1 + t2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,15)-(16,22)
(16,15)-(16,25)
(17,15)-(17,22)
(17,15)-(17,25)
(22,14)-(22,17)
(22,18)-(22,33)
(22,19)-(22,26)
(22,27)-(22,29)
(22,30)-(22,32)
*)

(* type error slice
(16,6)-(18,69)
(16,15)-(16,22)
(16,15)-(16,25)
(17,6)-(18,69)
(17,15)-(17,22)
(17,15)-(17,25)
(18,9)-(18,18)
(18,9)-(18,18)
(18,10)-(18,12)
(18,15)-(18,17)
(18,33)-(18,42)
(18,33)-(18,42)
(18,34)-(18,36)
(18,39)-(18,41)
(18,60)-(18,62)
(18,60)-(18,67)
(18,60)-(18,67)
(18,65)-(18,67)
*)
