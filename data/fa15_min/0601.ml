
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
      let lr1 = List.rev x in
      let lr2 = List.rev l2 in
      let h1::t1 = lr1 in
      let h2::t2 = lr2 in
      if (h1 + h2) > 9 then (1, [(h1 + h2) - 10]) else (0, [h1 + h2]) in
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
      let lr1 = List.rev l1 in
      let lr2 = List.rev l2 in
      let h1::t1 = lr1 in
      let h2::t2 = lr2 in
      if (h1 + h2) > 9 then (1, [(h1 + h2) - 10]) else (0, [h1 + h2]) in
    let base = (0, []) in
    let args = List.rev (List.combine l1 l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(16,26)-(16,27)
l1
VarG

*)

(* type error slice
(15,5)-(23,52)
(15,11)-(20,70)
(15,13)-(20,70)
(16,17)-(16,25)
(16,17)-(16,27)
(16,26)-(16,27)
(22,5)-(23,52)
(22,16)-(22,24)
(22,16)-(22,45)
(22,25)-(22,45)
(22,26)-(22,38)
(23,19)-(23,33)
(23,19)-(23,45)
(23,34)-(23,35)
(23,41)-(23,45)
*)
