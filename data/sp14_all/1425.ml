
let append x l = match l with | [] -> [x] | _ -> x :: l;;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10) [n mod 10]);;


(* fix

let append x l =
  let rec helper x l acc =
    match x with | [] -> l | h::t -> helper t l (h :: acc) in
  helper x l [];;

let rec digitsOfInt n =
  if n <= 0 then [] else append (digitsOfInt (n / 10)) [n mod 10];;

*)

(* changed spans
(2,18)-(2,56)
let rec helper =
  fun x ->
    fun l ->
      fun acc ->
        match x with
        | [] -> l
        | h :: t -> helper t l
                           (h :: acc) in
helper x l []
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

(5,26)-(5,66)
append (digitsOfInt (n / 10))
       [n mod 10]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(2,4)-(2,58)
(2,12)-(2,56)
(2,14)-(2,56)
(4,4)-(5,68)
(4,21)-(5,66)
(5,3)-(5,66)
(5,18)-(5,20)
(5,26)-(5,32)
(5,26)-(5,66)
(5,33)-(5,66)
(5,34)-(5,45)
*)
