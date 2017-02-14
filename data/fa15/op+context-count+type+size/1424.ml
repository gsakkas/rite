
let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | [] -> []
      | h::t -> if (h + x) > 10 then [h + (x mod 10)] @ a else [h + x] @ a in
    let base = [] in
    let args = l1 @ l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n > 0 then [x] @ (clone x (n - 1)) else [];;

let rec addHelper (t,u) =
  match List.rev t with
  | [] -> []
  | h::t ->
      (match List.rev u with
       | [] -> []
       | h'::t' ->
           if (h + h') > 10
           then (addHelper (t, t')) @ [(1 + h') + h]
           else (addHelper (t, t')) @ [h' + h]);;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = addHelper (a, x) in
    let base = [] in let args = [] in List.fold_left f base args in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(4,13)-(9,43)
(5,3)-(9,43)
(6,3)-(9,43)
(15,3)-(22,33)
(16,5)-(21,74)
(17,7)-(19,75)
(17,13)-(17,14)
(18,15)-(18,17)
(19,17)-(19,75)
(19,21)-(19,22)
(19,21)-(19,26)
(19,21)-(19,32)
(19,25)-(19,26)
(19,30)-(19,32)
(19,38)-(19,54)
(19,38)-(19,58)
(19,39)-(19,40)
(19,39)-(19,52)
(19,44)-(19,45)
(19,44)-(19,52)
(19,50)-(19,52)
(19,55)-(19,56)
(19,57)-(19,58)
(19,64)-(19,71)
(19,64)-(19,75)
(19,65)-(19,66)
(19,65)-(19,70)
(19,72)-(19,73)
(19,74)-(19,75)
(20,5)-(21,74)
(21,5)-(21,74)
(21,16)-(21,18)
(21,16)-(21,23)
(21,19)-(21,20)
(21,21)-(21,23)
(21,27)-(21,74)
(21,41)-(21,55)
(21,41)-(21,67)
(21,56)-(21,57)
(21,58)-(21,62)
(21,63)-(21,67)
(21,71)-(21,74)
(22,3)-(22,13)
(22,3)-(22,33)
(22,15)-(22,18)
(22,20)-(22,27)
(22,20)-(22,33)
(22,28)-(22,30)
(22,31)-(22,33)
*)

(* type error slice
(16,5)-(21,74)
(16,11)-(19,75)
(19,38)-(19,58)
(19,55)-(19,56)
(19,57)-(19,58)
(21,27)-(21,74)
(21,41)-(21,55)
(21,41)-(21,67)
(21,56)-(21,57)
*)
