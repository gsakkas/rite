
let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul i l);;


(* fix

let rec removeZero l =
  match l with
  | [] -> []
  | _ -> let h::t = l in (match h with | 0 -> removeZero t | _ -> l);;

let rec mulByDigit i l =
  let mul (i,l) =
    let f a x =
      let (a1,a2) = a in
      let val1 = (x * i) + a1 in
      if val1 > 9
      then ((val1 / 10), ((val1 mod 10) :: a2))
      else (0, (val1 :: a2)) in
    let base = (0, []) in
    let args = List.rev (0 :: l) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul (i, l));;

*)

(* changed spans
(18,14)-(18,23)
mul (i , l)
AppG (fromList [TupleG (fromList [EmptyG])])

*)

(* type error slice
(8,3)-(18,23)
(8,12)-(17,52)
(9,5)-(17,52)
(9,11)-(14,29)
(10,7)-(14,29)
(10,21)-(10,22)
(13,26)-(13,47)
(13,44)-(13,46)
(15,5)-(17,52)
(16,5)-(17,52)
(17,5)-(17,52)
(17,19)-(17,33)
(17,19)-(17,45)
(17,34)-(17,35)
(17,49)-(17,52)
(18,14)-(18,23)
(18,15)-(18,18)
*)
