
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
      let lr1 = List.rev a in
      let lr2 = List.rev x in
      let h1::t1 = a in
      let h2::t2 = x in
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
(16,25)-(16,26)
(17,25)-(17,26)
(18,19)-(18,20)
(19,19)-(19,20)
*)

(* type error slice
(15,4)-(23,51)
(15,10)-(20,69)
(15,12)-(20,69)
(16,6)-(20,69)
(17,6)-(20,69)
(18,6)-(20,69)
(18,6)-(20,69)
(18,6)-(20,69)
(18,19)-(18,20)
(19,6)-(20,69)
(20,6)-(20,69)
(20,28)-(20,49)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
*)
