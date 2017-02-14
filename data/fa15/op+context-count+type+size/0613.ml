
let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let sum = (fst x) + (snd x) in
      match a with
      | [] -> (0, ((sum / 10) :: (0, (sum mod 10)) :: a))
      | (h1,h)::t -> (0, (sum / 10)) :: (0, (h + (sum mod 10))) :: t in
    let base = [] in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n with | y when y <= 0 -> [] | _ -> x :: (clone x (n - 1));;

let padZero l1 l2 =
  match (List.length l1) <= (List.length l2) with
  | true  ->
      ((List.append (clone 0 ((List.length l2) - (List.length l1))) l1), l2)
  | false  ->
      (l1, (List.append (clone 0 ((List.length l1) - (List.length l2))) l2));;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> l);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let b = (fst x) + (snd x) in
      match a with
      | (0,[]) -> ((b / 10), [b mod 10])
      | (y,h::t) -> ((b / 10), ((b mod 10) :: (h + y) :: t)) in
    let base = (0, []) in
    let args = List.combine (List.rev l1) (List.rev l2) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(20,6)-(23,68)
(21,6)-(23,68)
(22,15)-(22,16)
(22,18)-(22,56)
(22,20)-(22,23)
(22,33)-(22,50)
(22,33)-(22,55)
(22,34)-(22,35)
(22,38)-(22,41)
(22,54)-(22,55)
(23,21)-(23,68)
(23,22)-(23,23)
(23,26)-(23,29)
(23,40)-(23,63)
(23,41)-(23,42)
(23,44)-(23,62)
(23,45)-(23,46)
(23,50)-(23,53)
(23,67)-(23,68)
(24,15)-(24,17)
*)

(* type error slice
(22,18)-(22,56)
(22,18)-(22,56)
(22,19)-(22,29)
(22,33)-(22,50)
(22,33)-(22,55)
(22,33)-(22,55)
*)
