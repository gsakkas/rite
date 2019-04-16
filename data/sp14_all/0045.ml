
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
      let zeroes = clone 0 n in ((List.append zeroes), l2);;


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
(14,34)-(14,54)
List.append zeroes l1
AppG (fromList [VarG])

*)

(* type error slice
(6,17)-(6,28)
(6,17)-(6,31)
(6,29)-(6,31)
(8,3)-(14,59)
(10,7)-(11,62)
(11,7)-(11,62)
(11,33)-(11,62)
(11,34)-(11,36)
(13,7)-(14,59)
(14,7)-(14,59)
(14,33)-(14,59)
(14,34)-(14,54)
(14,35)-(14,46)
*)
