
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
    let f a x =
      match a with
      | (list1,result) -> (match x with | (h1::t1,h2::t2) -> (0, [])) in
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
  let add (l1,l2) = [0; 0; 0; 0; 0] in removeZero (add (padZero l1 l2));;

*)

(* changed spans
(23,5)-(27,69)
[0 ; 0 ; 0 ; 0 ; 0]
ListG (fromList [LitG])

*)

(* type error slice
(5,4)-(14,64)
(5,13)-(14,62)
(5,16)-(14,62)
(6,3)-(14,62)
(7,3)-(14,62)
(8,3)-(14,62)
(10,7)-(11,62)
(11,7)-(11,62)
(11,33)-(11,62)
(11,34)-(11,36)
(14,34)-(14,57)
(14,35)-(14,46)
(14,54)-(14,56)
(22,3)-(28,35)
(22,12)-(27,69)
(23,5)-(27,69)
(23,11)-(25,70)
(23,13)-(25,70)
(24,7)-(25,70)
(25,27)-(25,70)
(25,62)-(25,69)
(25,63)-(25,64)
(26,5)-(27,69)
(26,16)-(26,24)
(26,17)-(26,19)
(27,36)-(27,50)
(27,36)-(27,62)
(27,51)-(27,52)
(27,53)-(27,57)
(28,14)-(28,35)
(28,15)-(28,18)
(28,19)-(28,34)
(28,20)-(28,27)
*)
