
let rec mulByDigit i l =
  match l with
  | [] -> [0]
  | h::t ->
      let (cin,res) = mulByDigit i t in
      let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: res));;


(* fix

let rec mulByDigit i l =
  let rec helper acc cin =
    match l with
    | [] -> cin :: acc
    | h::t ->
        let sum = (i * h) + cin in helper ((sum mod 10) :: acc) (sum / 10) in
  helper [] 0;;

*)

(* changed spans
(3,3)-(7,69)
let rec helper =
  fun acc ->
    fun cin ->
      match l with
      | [] -> cin :: acc
      | h :: t -> (let sum =
                     (i * h) + cin in
                   helper ((sum mod 10) :: acc)
                          (sum / 10)) in
helper [] 0
LetG Rec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(7,71)
(2,20)-(7,69)
(2,22)-(7,69)
(3,3)-(7,69)
(4,11)-(4,14)
(6,7)-(7,69)
(6,23)-(6,33)
(6,23)-(6,37)
(7,7)-(7,69)
(7,34)-(7,69)
*)
