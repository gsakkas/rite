
let x a = a;;

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      let rec helper acc v =
        if v = 0 then acc else helper ((v mod 10) :: acc) (v / 10) in
      (match (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @
               [helper [] (h * i)]
       with
       | [] -> []
       | x::y -> x);;


(* fix

let rec mulByDigit i l =
  match List.rev l with
  | [] -> []
  | h::t ->
      (mulByDigit i (List.rev (List.map (fun x  -> x * 10) t))) @ [h * i];;

*)

(* changed spans
(8,7)-(14,20)
mulByDigit i
           (List.rev (List.map (fun x ->
                                  x * 10) t)) @ [h * i]
AppG (fromList [AppG (fromList [EmptyG]),ListG (fromList [EmptyG])])

*)

(* type error slice
(4,4)-(14,22)
(4,20)-(14,20)
(4,22)-(14,20)
(5,3)-(14,20)
(8,7)-(14,20)
(10,7)-(14,20)
(10,14)-(10,71)
(10,14)-(11,35)
(10,15)-(10,25)
(10,72)-(10,73)
(14,18)-(14,19)
*)
