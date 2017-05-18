
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))))
       | _ -> buildCosine (build (rand, (depth - 1))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Tangent of expr* expr
  | Square2 of expr* expr* expr
  | Thresh of expr* expr* expr* expr;;

let buildAverage (e1,e2) = Average (e1, e2);;

let buildCosine e = Cosine e;;

let buildSine e = Sine e;;

let buildThresh (a,b,a_less,b_less) = Thresh (a, b, a_less, b_less);;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match depth with
  | 0 -> if (rand (0, 1)) = 1 then buildX () else buildY ()
  | _ ->
      let r = rand (3, 100) in
      (match r with
       | _ when r < 20 ->
           buildAverage
             ((buildCosine (build (rand, (depth - 1)))),
               (buildSine (build (rand, (depth - 1)))))
       | _ when (r < 30) && (r > 20) ->
           buildThresh
             ((build (rand, (depth - 1))),
               (buildCosine (build (rand, (depth - 1)))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | _ -> buildCosine (build (rand, (depth - 1))));;

*)

(* changed spans
(37,13)-(38,57)
(38,15)-(38,56)
*)

(* type error slice
(19,3)-(19,69)
(19,17)-(19,67)
(36,11)-(36,22)
(36,11)-(38,57)
(37,13)-(38,57)
*)

(* all spans
(13,18)-(13,43)
(13,27)-(13,43)
(13,36)-(13,38)
(13,40)-(13,42)
(15,16)-(15,28)
(15,20)-(15,28)
(15,27)-(15,28)
(17,14)-(17,24)
(17,18)-(17,24)
(17,23)-(17,24)
(19,17)-(19,67)
(19,38)-(19,67)
(19,46)-(19,47)
(19,49)-(19,50)
(19,52)-(19,58)
(19,60)-(19,66)
(21,11)-(21,20)
(21,16)-(21,20)
(23,11)-(23,20)
(23,16)-(23,20)
(25,15)-(39,54)
(26,2)-(39,54)
(26,8)-(26,13)
(27,9)-(27,59)
(27,12)-(27,29)
(27,12)-(27,25)
(27,13)-(27,17)
(27,18)-(27,24)
(27,19)-(27,20)
(27,22)-(27,23)
(27,28)-(27,29)
(27,35)-(27,44)
(27,35)-(27,41)
(27,42)-(27,44)
(27,50)-(27,59)
(27,50)-(27,56)
(27,57)-(27,59)
(29,6)-(39,54)
(29,14)-(29,27)
(29,14)-(29,18)
(29,19)-(29,27)
(29,20)-(29,21)
(29,23)-(29,26)
(30,6)-(39,54)
(30,13)-(30,14)
(31,16)-(31,22)
(31,16)-(31,17)
(31,20)-(31,22)
(35,16)-(35,36)
(35,16)-(35,24)
(35,17)-(35,18)
(35,21)-(35,23)
(35,28)-(35,36)
(35,29)-(35,30)
(35,33)-(35,35)
(32,11)-(34,55)
(32,11)-(32,23)
(33,13)-(34,55)
(33,14)-(33,55)
(33,15)-(33,26)
(33,27)-(33,54)
(33,28)-(33,33)
(33,34)-(33,53)
(33,35)-(33,39)
(33,41)-(33,52)
(33,42)-(33,47)
(33,50)-(33,51)
(34,15)-(34,54)
(34,16)-(34,25)
(34,26)-(34,53)
(34,27)-(34,32)
(34,33)-(34,52)
(34,34)-(34,38)
(34,40)-(34,51)
(34,41)-(34,46)
(34,49)-(34,50)
(36,11)-(38,57)
(36,11)-(36,22)
(37,13)-(38,57)
(37,14)-(37,41)
(37,15)-(37,20)
(37,21)-(37,40)
(37,22)-(37,26)
(37,28)-(37,39)
(37,29)-(37,34)
(37,37)-(37,38)
(38,15)-(38,56)
(38,16)-(38,27)
(38,28)-(38,55)
(38,29)-(38,34)
(38,35)-(38,54)
(38,36)-(38,40)
(38,42)-(38,53)
(38,43)-(38,48)
(38,51)-(38,52)
(39,14)-(39,53)
(39,14)-(39,25)
(39,26)-(39,53)
(39,27)-(39,32)
(39,33)-(39,52)
(39,34)-(39,38)
(39,40)-(39,51)
(39,41)-(39,46)
(39,49)-(39,50)
*)
