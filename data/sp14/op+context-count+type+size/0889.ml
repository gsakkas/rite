
let bigMul l1 l2 =
  let f a x =
    match x with
    | (x1,x2) ->
        (match a with
         | (h1,h2::t2) ->
             let mul = ((x1 * x2) * h1) + h2 in ((h1 + 1), (mul / 10)) ::
               (mul mod 10) :: t2
         | (_,_) -> (0, [0])) in
  let base = (1, [0]) in
  let args = List.rev (List.combine l1 l2) in
  let (_,res) = List.fold_left f base args in res;;


(* fix

let bigMul l1 l2 =
  let f a x =
    match x with
    | (x1,x2) ->
        (match a with
         | (h1,h2::t2) ->
             let mul = ((x1 * x2) * h1) + h2 in
             ((h1 + 1), ((mul / 10) :: (mul mod 10) :: t2))
         | (_,_) -> (0, [0])) in
  let base = (1, [0]) in
  let args = List.rev (List.combine l1 l2) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(8,51)-(9,34)
(8,61)-(8,69)
*)

(* type error slice
(8,51)-(8,69)
(8,51)-(9,34)
(8,51)-(9,34)
(9,17)-(9,27)
(9,17)-(9,34)
(9,17)-(9,34)
*)
