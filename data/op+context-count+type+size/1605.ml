
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = match a with | [] -> ([], []) | h1::t1 -> (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append zeroes l2))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append zeroes l1), l2);;

let rec removeZero l =
  match l with
  | [] -> []
  | h::t -> (match h with | 0 -> removeZero t | _ -> t);;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x = (l1, [0; 0; 0; 0]) in
    let base = (l1, []) in
    let args = l2 in let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,17)-(23,76)
(23,23)-(23,24)
(23,39)-(23,41)
(23,43)-(23,45)
(23,60)-(23,76)
*)

(* type error slice
(23,5)-(25,69)
(23,11)-(23,76)
(23,13)-(23,76)
(23,17)-(23,76)
(23,23)-(23,24)
(23,39)-(23,41)
(23,39)-(23,45)
(23,43)-(23,45)
(23,60)-(23,62)
(23,60)-(23,76)
(23,64)-(23,76)
(23,65)-(23,66)
(24,5)-(25,69)
(24,17)-(24,19)
(24,17)-(24,23)
(24,21)-(24,23)
(25,5)-(25,69)
(25,16)-(25,18)
(25,36)-(25,50)
(25,36)-(25,62)
(25,51)-(25,52)
(25,53)-(25,57)
(25,58)-(25,62)
*)
