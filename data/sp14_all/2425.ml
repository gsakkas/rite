
let rec mulByDigit i l =
  match l with
  | [] -> []
  | h::t ->
      let prod = h * i in
      let lastDigit = prod / 10 in
      let firstDigit = prod mod 10 in
      let ret = mulByDigit (i t) in
      (match ret with
       | [] -> 0
       | h2::t2 ->
           if h2 > 10
           then
             let temp = h2 in
             (if prod > 10
              then [lastDigit; firstDigit + temp]
              else firstDigit :: t));;


(* fix

let rec removeZero l =
  match l with | [] -> [] | h::t -> if h = 0 then removeZero t else l;;

let rec mulByDigit i l =
  let mult i l =
    let f a x =
      let (carryOver,rest) = a in
      let num = carryOver + (x * i) in
      let secondDigit = num mod 10 in
      let carryOver = num / 10 in
      let result = secondDigit :: rest in (carryOver, rest) in
    let base = (0, []) in
    let (carryOver,rest) = List.fold_left f base (List.rev l) in carryOver ::
      rest in
  removeZero (mult i l);;

*)

(* changed spans
(3,3)-(18,37)
let mult =
  fun i ->
    fun l ->
      (let f =
         fun a ->
           fun x ->
             (let (carryOver , rest) = a in
              let num =
                carryOver + (x * i) in
              let secondDigit =
                num mod 10 in
              let carryOver = num / 10 in
              let result =
                secondDigit :: rest in
              (carryOver , rest)) in
       let base = (0 , []) in
       let (carryOver , rest) =
         List.fold_left f base
                        (List.rev l) in
       carryOver :: rest) in
removeZero (mult i l)
LetG NonRec (fromList [(VarPatG,LamG VarPatG EmptyG)]) (AppG (fromList [EmptyG]))

*)

(* type error slice
(2,4)-(18,39)
(2,20)-(18,37)
(2,22)-(18,37)
(3,3)-(18,37)
(4,11)-(4,13)
(6,7)-(18,37)
(6,18)-(6,23)
(6,22)-(6,23)
(7,7)-(18,37)
(8,7)-(18,37)
(9,7)-(18,37)
(9,17)-(9,27)
(9,17)-(9,33)
(9,28)-(9,33)
(9,29)-(9,30)
(10,7)-(18,37)
(10,14)-(10,17)
(11,16)-(11,17)
(13,12)-(18,36)
(15,14)-(18,36)
(16,14)-(18,36)
(18,20)-(18,35)
(18,36)-(18,36)
*)
