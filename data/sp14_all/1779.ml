
let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let mul (i1,l1) =
    let f a x =
      let (i,j) = x in
      let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
    let base = (0, []) in
    let args =
      List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
    let (_,res) = List.fold_left f base args in res in
  removeZero (mul l);;


(* fix

let rec clone x n = if n <= 0 then [] else x :: (clone x (n - 1));;

let l1 = [9; 9; 9];;

let rec mulByDigit i l =
  let f a x =
    let (i,j) = x in
    let (s,t) = a in ((((i * j) + s) / 10), ((((i * j) + s) mod 10) :: t)) in
  let base = (0, []) in
  let args =
    List.combine (List.rev (0 :: l1)) (List.rev (clone (List.length l) i)) in
  let (_,res) = List.fold_left f base args in res;;

*)

(* changed spans
(8,3)-(16,21)
let f =
  fun a ->
    fun x ->
      (let (i , j) = x in
       let (s , t) = a in
       (((i * j) + s) / 10 , (((i * j) + s) mod 10) :: t)) in
let base = (0 , []) in
let args =
  List.combine (List.rev (0 :: l1))
               (List.rev (clone (List.length l)
                                i)) in
let (_ , res) =
  List.fold_left f base args in
res
LetG NonRec [(VarPatG,LamG EmptyPatG EmptyG)] (LetG NonRec [(EmptyPatG,EmptyG)] EmptyG)

*)

(* type error slice
(8,3)-(16,21)
(8,12)-(15,52)
(14,58)-(14,73)
(14,59)-(14,70)
(14,71)-(14,72)
(16,14)-(16,21)
(16,15)-(16,18)
(16,19)-(16,20)
*)
