
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = [] in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let len1 = List.length l1 in
  let len2 = List.length l2 in
  if len1 > len2
  then (l1, ((clone 0 (len1 - len2)) @ l2))
  else (((clone 0 (len2 - len1)) @ l1), l2);;

let rec removeZero l =
  match l with | [] -> [] | h::t when h == 0 -> removeZero t | h::t -> h :: t;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      match a with
      | (w,z) ->
          (match x with
           | (x,y) -> ((((x + y) + w) / 10), ((((x + y) + w) mod 10) :: z))) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_left f base args in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(21,15)-(21,17)
*)

(* type error slice
(16,4)-(23,51)
(16,10)-(20,76)
(17,6)-(20,76)
(17,12)-(17,13)
(21,4)-(23,51)
(21,15)-(21,17)
(23,18)-(23,32)
(23,18)-(23,44)
(23,33)-(23,34)
(23,35)-(23,39)
*)
