
let rec listReverse l =
  match l with | [] -> [1] | front::back -> [listReverse back; front];;


(* fix

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

*)

(* changed spans
(3,3)-(3,70)
let rec recurse =
  fun original ->
    fun reverse ->
      match original with
      | [] -> reverse
      | front :: back -> recurse back
                                 (front :: reverse) in
recurse l []
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(3,72)
(2,21)-(3,70)
(3,3)-(3,70)
(3,45)-(3,70)
(3,46)-(3,57)
(3,46)-(3,62)
*)
