
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
    let f a x = (a, (a + x)) in
    let base = 0 in
    let args = 1 in let (_,res) = List.fold_left f base args in res in
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
(23,4)-(25,67)
(23,10)-(23,28)
(23,12)-(23,28)
(23,16)-(23,28)
(23,17)-(23,18)
(23,20)-(23,27)
(23,21)-(23,22)
(23,25)-(23,26)
(24,4)-(25,67)
(25,4)-(25,67)
(25,15)-(25,16)
(25,20)-(25,67)
(25,34)-(25,48)
(25,34)-(25,60)
(25,49)-(25,50)
(25,51)-(25,55)
(25,56)-(25,60)
(25,64)-(25,67)
(26,2)-(26,12)
(26,2)-(26,34)
*)

(* type error slice
(23,4)-(25,67)
(23,10)-(23,28)
(23,12)-(23,28)
(23,16)-(23,28)
(23,20)-(23,27)
(23,21)-(23,22)
(25,34)-(25,48)
(25,34)-(25,60)
(25,49)-(25,50)
*)
