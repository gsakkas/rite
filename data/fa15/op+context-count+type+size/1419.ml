
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
      | h::t -> if (h + x) > 10 then [h + (x mod 10)] @ a else [h + x] in
    let base = ([], []) in
    let args = failwith "to be implemented" in
    let (_,res) = List.fold_left f base args in res in
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
(15,3)-(23,33)
(16,5)-(22,52)
(17,7)-(19,71)
(17,13)-(17,14)
(18,15)-(18,17)
(19,17)-(19,71)
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
(19,65)-(19,66)
(19,65)-(19,70)
(20,5)-(22,52)
(20,17)-(20,19)
(20,17)-(20,23)
(20,21)-(20,23)
(21,5)-(22,52)
(21,16)-(21,24)
(21,16)-(21,44)
(21,25)-(21,44)
(22,5)-(22,52)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
(22,41)-(22,45)
(22,49)-(22,52)
(23,3)-(23,13)
(23,3)-(23,33)
(23,15)-(23,18)
(23,20)-(23,27)
(23,20)-(23,33)
(23,28)-(23,30)
(23,31)-(23,33)
*)

(* type error slice
(16,5)-(22,52)
(16,11)-(19,71)
(19,38)-(19,58)
(19,55)-(19,56)
(19,57)-(19,58)
(20,5)-(22,52)
(20,17)-(20,23)
(22,19)-(22,33)
(22,19)-(22,45)
(22,34)-(22,35)
(22,36)-(22,40)
*)
