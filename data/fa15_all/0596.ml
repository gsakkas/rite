
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
(16,16)-(16,26)
List.nth l1 (List.length l1)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

(17,16)-(17,26)
List.nth l2 (List.length l2)
AppG (fromList [VarG,AppG (fromList [EmptyG])])

*)

(* type error slice
(16,7)-(18,70)
(16,16)-(16,23)
(16,16)-(16,26)
(17,7)-(18,70)
(17,16)-(17,23)
(17,16)-(17,26)
(18,10)-(18,19)
(18,11)-(18,13)
(18,16)-(18,18)
(18,34)-(18,43)
(18,35)-(18,37)
(18,40)-(18,42)
(18,61)-(18,63)
(18,61)-(18,68)
(18,66)-(18,68)
*)
