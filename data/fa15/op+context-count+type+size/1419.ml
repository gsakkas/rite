
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
(4,12)-(9,43)
(5,2)-(9,43)
(6,2)-(9,43)
(15,2)-(23,34)
(16,4)-(22,51)
(17,6)-(19,70)
(17,12)-(17,13)
(18,14)-(18,16)
(19,16)-(19,70)
(19,19)-(19,26)
(19,19)-(19,31)
(19,20)-(19,21)
(19,24)-(19,25)
(19,29)-(19,31)
(19,37)-(19,53)
(19,37)-(19,57)
(19,38)-(19,39)
(19,38)-(19,52)
(19,42)-(19,52)
(19,43)-(19,44)
(19,49)-(19,51)
(19,54)-(19,55)
(19,56)-(19,57)
(19,63)-(19,70)
(19,64)-(19,65)
(19,64)-(19,69)
(20,4)-(22,51)
(20,15)-(20,23)
(20,16)-(20,18)
(20,20)-(20,22)
(21,4)-(22,51)
(21,15)-(21,23)
(21,15)-(21,43)
(21,24)-(21,43)
(22,4)-(22,51)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
(22,40)-(22,44)
(22,48)-(22,51)
(23,2)-(23,12)
(23,2)-(23,34)
(23,14)-(23,17)
(23,18)-(23,33)
(23,19)-(23,26)
(23,27)-(23,29)
(23,30)-(23,32)
*)

(* type error slice
(16,4)-(22,51)
(16,10)-(19,70)
(19,37)-(19,57)
(19,54)-(19,55)
(19,56)-(19,57)
(20,4)-(22,51)
(20,15)-(20,23)
(22,18)-(22,32)
(22,18)-(22,44)
(22,33)-(22,34)
(22,35)-(22,39)
*)
