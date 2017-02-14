
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
      | (0,[]) -> (0, [])
      | (carry,h1::t1) ->
          (match x with
           | h2::t2 ->
               ((((h1 + h2) + carry) / 10), (((h1 + h2) mod 10) :: t1))) in
    let base = (0, []) in
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
(23,4)-(31,68)
(23,10)-(29,72)
(23,12)-(29,72)
(24,6)-(29,72)
(24,12)-(24,13)
(25,18)-(25,25)
(25,22)-(25,24)
(27,10)-(29,72)
(27,17)-(27,18)
(29,15)-(29,71)
(29,16)-(29,42)
(29,17)-(29,36)
(29,18)-(29,27)
(29,19)-(29,21)
(29,24)-(29,26)
(29,30)-(29,35)
(29,39)-(29,41)
(29,44)-(29,70)
(30,4)-(31,68)
(32,2)-(32,34)
*)

(* type error slice
(3,30)-(3,31)
(3,30)-(3,52)
(3,30)-(3,52)
(3,35)-(3,52)
(3,36)-(3,41)
(3,42)-(3,43)
(5,3)-(14,63)
(5,12)-(14,61)
(5,15)-(14,61)
(6,2)-(14,61)
(7,2)-(14,61)
(8,2)-(14,61)
(10,6)-(11,61)
(11,6)-(11,61)
(11,6)-(11,61)
(11,19)-(11,24)
(11,19)-(11,28)
(11,25)-(11,26)
(11,32)-(11,61)
(11,37)-(11,60)
(11,38)-(11,49)
(11,50)-(11,56)
(22,2)-(32,34)
(22,11)-(31,68)
(23,4)-(31,68)
(23,10)-(29,72)
(23,12)-(29,72)
(27,10)-(29,72)
(27,10)-(29,72)
(27,17)-(27,18)
(31,4)-(31,68)
(31,15)-(31,17)
(31,35)-(31,49)
(31,35)-(31,61)
(31,50)-(31,51)
(31,57)-(31,61)
(32,13)-(32,34)
(32,14)-(32,17)
(32,18)-(32,33)
(32,19)-(32,26)
*)
