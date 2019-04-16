
let rec mulByDigit i l =
  let (cout,res) =
    match l with
    | [] -> (0, [])
    | h::t ->
        let (cin,acc) = mulByDigit i t in
        let sum = (i * h) + cin in ((sum / 10), ((sum mod 10) :: acc)) in
  if cout > 0 then cout :: res else res;;


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
(3,3)-(9,40)
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
(2,4)-(9,42)
(2,20)-(9,40)
(2,22)-(9,40)
(3,3)-(9,40)
(4,5)-(8,71)
(7,9)-(8,71)
(7,25)-(7,35)
(7,25)-(7,39)
(8,9)-(8,71)
(8,36)-(8,71)
(8,49)-(8,70)
(9,3)-(9,40)
(9,37)-(9,40)
*)
