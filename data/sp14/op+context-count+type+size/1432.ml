
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
    let f a x = a + x in
    let base = (0, l1) in
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
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,4)-(25,68)
(23,10)-(23,21)
(23,12)-(23,21)
(23,16)-(23,17)
(23,16)-(23,21)
(23,20)-(23,21)
(24,4)-(25,68)
(24,15)-(24,22)
(24,19)-(24,21)
(25,4)-(25,68)
(25,21)-(25,68)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
(25,57)-(25,61)
(25,65)-(25,68)
(26,2)-(26,34)
*)

(* type error slice
(23,4)-(25,68)
(23,10)-(23,21)
(23,16)-(23,17)
(23,16)-(23,21)
(24,4)-(25,68)
(24,15)-(24,22)
(25,35)-(25,49)
(25,35)-(25,61)
(25,50)-(25,51)
(25,52)-(25,56)
*)
