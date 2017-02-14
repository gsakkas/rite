
type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  match rand with
  | (a,b) ->
      let rdm = rand (0, 7) in
      (match rdm with
       | 0 -> buildY ()
       | 1 -> buildX ()
       | 2 -> Cosine (build (rand, (depth - 1)))
       | 3 -> Sine (build (rand, (depth - 1)))
       | 4 ->
           Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 5 ->
           Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
       | 6 ->
           Thresh
             ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
               (build (rand, (depth - 1))), (build (rand, (depth - 1)))));;


(* fix

type expr =
  | VarX
  | VarY
  | Sine of expr
  | Cosine of expr
  | Average of expr* expr
  | Times of expr* expr
  | Thresh of expr* expr* expr* expr
  | Half of expr
  | ThreeAve of expr* expr* expr;;

let buildX () = VarX;;

let buildY () = VarY;;

let rec build (rand,depth) =
  let rdm = rand (0, 7) in
  match rdm with
  | 0 -> buildY ()
  | 1 -> buildX ()
  | 2 -> Cosine (build (rand, (depth - 1)))
  | 3 -> Sine (build (rand, (depth - 1)))
  | 4 -> Average ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 5 -> Times ((build (rand, (depth - 1))), (build (rand, (depth - 1))))
  | 6 ->
      Thresh
        ((build (rand, (depth - 1))), (build (rand, (depth - 1))),
          (build (rand, (depth - 1))), (build (rand, (depth - 1))));;

*)

(* changed spans
(18,2)-(33,73)
(18,8)-(18,12)
(20,6)-(33,73)
*)

(* type error slice
(18,2)-(33,73)
(18,8)-(18,12)
(20,16)-(20,20)
(20,16)-(20,27)
*)
