
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f a x =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
  removeZero (add (padZero l1 l2));;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let padZero l1 l2 =
  let diff = (List.length l2) - (List.length l1) in
  (((clone 0 diff) @ l1), ((clone 0 (- diff)) @ l2));;

let rec removeZero l =
  match l with | [] -> l | h::t -> if h = 0 then removeZero t else l;;

let bigAdd l1 l2 =
  let add (l1,l2) =
    let f x a =
      let (carry,num) = a in
      let (l1',l2') = x in
      let addit = (l1' + l2') + carry in
      ((if addit > 10 then 1 else 0), ((addit mod 10) :: num)) in
    let base = (0, []) in
    let args = List.combine l1 l2 in
    let (_,res) = List.fold_right f args base in res in
  removeZero (add (padZero l1 l2));;

*)

(* changed spans
(13,11)-(17,63)
fun x ->
  fun a ->
    (let (carry , num) = a in
     let (l1' , l2') = x in
     let addit =
       (l1' + l2') + carry in
     (if addit > 10
      then 1
      else 0 , (addit mod 10) :: num))
LamG VarPatG (LamG EmptyPatG EmptyG)

*)

(* type error slice
(13,5)-(20,53)
(13,11)-(17,63)
(13,13)-(17,63)
(14,7)-(17,63)
(15,7)-(17,63)
(15,23)-(15,24)
(16,7)-(17,63)
(16,19)-(16,30)
(16,26)-(16,29)
(17,7)-(17,63)
(17,39)-(17,62)
(20,19)-(20,34)
(20,19)-(20,46)
(20,35)-(20,36)
*)
