
let rec listReverse l =
  match l with | [] -> None | front::back -> [listReverse back; front];;


(* fix

let rec listReverse l =
  let rec recurse original reverse =
    match original with
    | [] -> reverse
    | front::back -> recurse back (front :: reverse) in
  recurse l [];;

*)

(* changed spans
(3,3)-(3,71)
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
(3,3)-(3,71)
(3,24)-(3,28)
(3,46)-(3,71)
*)
