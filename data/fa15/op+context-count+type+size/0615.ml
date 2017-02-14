
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
(20,6)-(23,65)
(21,6)-(23,65)
(22,15)-(22,16)
(22,18)-(22,51)
(22,20)-(22,23)
(22,33)-(22,50)
(22,34)-(22,37)
(22,49)-(22,50)
(23,22)-(23,23)
(23,25)-(23,64)
(23,27)-(23,30)
(23,40)-(23,58)
(23,41)-(23,42)
(23,46)-(23,49)
(23,62)-(23,63)
(24,15)-(24,17)
*)

(* type error slice
(21,6)-(23,65)
(21,6)-(23,65)
(21,6)-(23,65)
(21,12)-(21,13)
(22,33)-(22,45)
(22,33)-(22,50)
(22,33)-(22,50)
(22,49)-(22,50)
(23,40)-(23,58)
(23,40)-(23,63)
(23,40)-(23,63)
(23,62)-(23,63)
*)
