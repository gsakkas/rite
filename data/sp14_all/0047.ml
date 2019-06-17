
let rec clone x n =
  match n > 0 with | true  -> x :: (clone x (n - 1)) | false  -> [];;

let padZero l1 l2 =
  let length1 = List.length l1 in
  let length2 = List.length l2 in
  match length1 >= length2 with
  | true  ->
      let n = length1 - length2 in
      let zeroes = clone 0 n in (l1, (List.append (zeroes l2)))
  | false  ->
      let n = length2 - length1 in
      let zeroes = clone 0 n in ((List.append (zeroes l1)), l2);;


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

*)

(* changed spans
(11,38)-(11,63)
List.append zeroes l2
AppG [VarG,VarG]

(14,34)-(14,59)
List.append zeroes l1
AppG [VarG,VarG]

*)

(* type error slice
(3,31)-(3,53)
(3,36)-(3,53)
(3,37)-(3,42)
(7,17)-(7,28)
(7,17)-(7,31)
(7,29)-(7,31)
(8,3)-(14,64)
(10,7)-(11,64)
(11,7)-(11,64)
(11,20)-(11,25)
(11,20)-(11,29)
(11,33)-(11,64)
(11,38)-(11,63)
(11,39)-(11,50)
(11,51)-(11,62)
(11,52)-(11,58)
(13,7)-(14,64)
(14,7)-(14,64)
(14,20)-(14,25)
(14,20)-(14,29)
(14,33)-(14,64)
(14,47)-(14,58)
(14,48)-(14,54)
(14,61)-(14,63)
*)
