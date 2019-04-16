
let getHead b = match b with | [] -> [] | x::xs -> x;;

let rec listReverse l =
  let a = [] in
  let getHead b = function | [] -> [] | x::xs -> x :: (a getHead xs) in
  getHead l;;


(* fix

let rec listReverse l =
  let rec getList a b = match a with | [] -> [] in getList [] l;;

*)

(* changed spans
(5,3)-(7,12)
let rec getList =
  fun a ->
    fun b ->
      match a with
      | [] -> [] in
getList [] l
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(5,3)-(7,12)
(5,11)-(5,13)
(6,55)-(6,69)
(6,56)-(6,57)
*)
