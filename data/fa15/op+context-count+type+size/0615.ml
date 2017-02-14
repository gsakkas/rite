
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
      | [] -> (0, ((sum / 10) :: (sum mod 10) :: a))
      | (h1,h)::t -> (0, ((sum / 10) :: (h + (sum mod 10)) :: t)) in
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
(20,7)-(23,64)
(21,7)-(23,64)
(22,16)-(22,17)
(22,21)-(22,24)
(22,21)-(22,51)
(22,35)-(22,38)
(22,35)-(22,51)
(22,50)-(22,51)
(23,23)-(23,24)
(23,28)-(23,31)
(23,28)-(23,64)
(23,42)-(23,43)
(23,42)-(23,57)
(23,47)-(23,50)
(23,63)-(23,64)
(24,16)-(24,18)
*)

(* type error slice
(21,7)-(23,64)
(21,7)-(23,64)
(21,7)-(23,64)
(21,13)-(21,14)
(22,35)-(22,45)
(22,35)-(22,51)
(22,35)-(22,51)
(22,50)-(22,51)
(23,42)-(23,57)
(23,42)-(23,64)
(23,42)-(23,64)
(23,63)-(23,64)
*)
